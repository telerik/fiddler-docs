---
title: Build a Custom Inspector
slug: CustomInspector
publish: true
position: 5
---

# Build a Custom Inspector

1. Create a [Fiddler Classic extension project](slug://CreateExtension).

2. Change the code to derive from the **Inspector2** class and implement either **IResponseInspector2** or **IRequestInspector2**.

	```c#
	using Fiddler;

	[assembly: Fiddler.RequiredVersion("2.3.0.0")]

	public class WebViewer: Inspector2, IResponseInspector2
	{
		public WebViewer()
		{
		//
		// TODO: Add constructor logic here
		//
		}
	}
	```

3. Inside the class, create a new method. By typing **public override**, you'll get an autocomplete list of the methods you need to write.

4. In **Solution Explorer**, right-click on the project and click **Add > User Control**.

5. Use the **Toolbox** to add controls to your user control. These will show the data about the HTTP message under inspection.

6. In the **body{ set }** and **headers{ set }** properties, you should update your control's visual representation of the request or response. 

7. [Compile and load your extension in Fiddler](slug://LoadExtension).