---
title: Out-of-Memory exception
description: "Address out-of-memory errors in Fiddler Classic - tips for buffer limits, memory settings, and large session handling."
slug: OutOfMemory
publish: true
position: 10
---

# Fiddler Classic throws an out-of-memory exception

Sometimes, Fiddler Classic may show a dialog containing the following text:

```txt
Exception of type 'System.OutOfMemoryException' was thrown.
at System.IO.MemoryStream.set_Capacity(Int32 value)
at System.IO.MemoryStream.EnsureCapacity(Int32 value)
at System.IO.MemoryStream.Write(Byte[] buffer, Int32 offset, Int32 count)
at Fiddler.Session.Execute(Object objThreadstate)
```

Fiddler Classic works by storing the entire request and response in memory.  If you are performing a huge download (hundreds of megabytes) it's possible that Fiddler Classic cannot find a free memory block large enough to hold the entire contiguous response, and hence you'll run into this "out of memory" problem.  It's also possible that if you have thousands of sessions in the Fiddler Classic session list, even a relatively small memory block will not be available to store a response a few megabytes in size. You can reduce the incidence of this problem by clearing the **Web Sessions** list (CTRL+X) or configuring it to automatically trim to the most recent two hundred sessions (Click the Filters tab, and click the "Keep only the most recent sessions" option at the bottom).

Developers can learn more about this here: [https://blogs.msdn.com/ericlippert/archive/2009/06/08/out-of-memory-does-not-refer-to-physical-memory.aspx](https://blogs.msdn.com/ericlippert/archive/2009/06/08/out-of-memory-does-not-refer-to-physical-memory.aspx) and here [https://blogs.msdn.com/b/dotnet/archive/2011/10/04/large-object-heap-improvements-in-net-4-5.aspx.](https://blogs.msdn.com/b/dotnet/archive/2011/10/04/large-object-heap-improvements-in-net-4-5.aspx)

**Update:** Fiddler2 now supports running on 64bit computers. If you're on a 64-bit machine, you'll never hit a problem.

If you're on a 32-bit machine, you can avoid out-of-memory errors when downloading huge files by adding the following code inside the **OnPeekAtResponseHeaders** function inside Rules > Customize Rules. The line in red will cause Fiddler Classic not to keep a copy of the large file:

```js
	// This block enables streaming for files larger than 5mb
	if (oSession.oResponse.headers.Exists("Content-Length"))
	{
	  var sLen = oSession.oResponse["Content-Length"];
	  var iLen: Int32 = 0;
	  if (!isNaN(sLen)){ 
		iLen = parseInt(sLen); 
		if (iLen > 5120000) {
		  oSession.bBufferResponse = false; 
		  oSession["ui-color"] = "yellow";
		  oSession["log-drop-response-body"] = "save memory";
		}
	  }
	}
```

If you're using [FiddlerCore](http://fiddler2.com/core) or writing a Fiddler Classic Extension, you can use code like this:
```js
Fiddler.FiddlerApplication.ResponseHeadersAvailable += delegate(Fiddler.Session oS)
{
	// This block enables streaming for files larger than 5mb
	if (oS.oResponse.headers.Exists("Content-Length"))
	{
		int iLen = 0;
		if (int.TryParse(oS.oResponse["Content-Length"], out iLen))
		{
			// File larger than 5mb? Don't save its content
			if (iLen > 5000000)
			{
				oS.bBufferResponse = false;
				oS["log-drop-response-body"] = "save memory";
			}
		}
	}
};
```