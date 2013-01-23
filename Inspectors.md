---
title: Building Fiddler Inspectors
slug: buildingfiddlerinspectors
tags: Inspector
publish: true
---


#Building Fiddler Inspectors

Building custom Inspector objects for Fiddler is easy!  You can use any .NET language, although I'll present my examples in C#.

Fiddler v2.x loads only **.NET CLR v2.0** assemblies; use Visual Studio 2005+ to compile your extension. If you use Visual Studio 2010 or later, you must change your project to target the .NET2.0/3.5 framework or Fiddler will not load your extension.

Fiddler itself requires only that the user have **.NET Framework 2.0 SP1** installed. You *may* have your extensions target the .NET Framework 3.5 (which includes Linq) since that framework also (confusingly) runs on the v2.0 CLR, but you MUST yourself ensure that the user has the required Framework version installed BEFORE you install your extension, or a user with only the older Framework will crash on boot.

You should also ensure your project targets **AnyCPU** to ensure that it works properly with [64bit Fiddler](http://fiddler.wikidot.com/bitness).

###Building for Fiddler v2 and v4
Learn more about [Building assemblies to run in both Fiddler v2 and v4](http://fiddler2.com/Fiddler/dev/FrameworkTarget.asp).

Debugging your Extensions
Extension developers should set the fiddler.debug.extensions.showerrors preference to **True** ensure that exceptions and other extension-related errors are not silently caught.

Extension developers should set the fiddler.debug.extensions.verbose preference to **True** to spew logging information to the Log tab.

*If you write to me complaining that your extension doesn't work and you have not first set these preferences before testing, I will tease you mercilessly.*

###Step-by-Step
1. **File | New Project**

2. Pick **VC# Projects | Class Library**

3. Type a name, e.g. WebBrowser

4. Hit **OK.**

5. In Solution Explorer, right-click **References** and choose **Add Reference**

6. Hit **Browse** and find **Fiddler.exe**

7. On the .NET tab, you probably want to add a reference to **System.Windows.Forms** as well.

8. Ensure both libraries are in the **Selected Components List** and hit **OK**.

In Solution Explorer, rename **Class1.cs** to whatever, e.g. **WebViewer.cs**

Change the code to derive from the **Inspector2** class.  Also, implement either **IResponseInspector2** or **IRequestInspector2.**

	using Fiddler;

	[assembly: Fiddler.RequiredVersion("2.3.0.0")]

	public class WebViewer: Inspector2, IResponseInspector2
	{
	   public Viewers()
	   {
	   //
	   // TODO: Add constructor logic here
	  //
	   }
	}

Inside the class, create a new method. By typing **public override**, you'll get an autocomplete list of the methods you need to write.

In Solution Explorer, right-click on the project and choose **Add | User Control**

Use the Toolbox to add controls to your user control-- these will show the data about the HTTP message under Inspection.

In the **body{ set }** and **headers{ set }** properties, you should update your control's visual representation of the request or response. 

**Almost done...**

* Compile your project.

* Drop your assembly .DLL in the **\Fiddler2\Inspectors** folder

* Restart Fiddler2

If you need help or have questions, please email me using the **Contact** link above.

TextViewer.cs

		using System;
		using System.IO;
		using System.Drawing;
		using System.Windows.Forms;
		using System.Collections;
		using Fiddler;

		[assembly: Fiddler.RequiredVersion("2.2.7.0")]

		namespace Standard
		{
		 public class RequestTextViewer: Inspector2, IRequestInspector2
		 {
		 TextView myControl;
		 private byte[] m_entityBody;
		 private bool m_bDirty;

		 private bool m_bReadOnly;

		 public bool bReadOnly{
		 get {
		   return m_bReadOnly;
		 }
		 set{
		   m_bReadOnly = value;   // TODO: You probably also want to turn your visible control CONFIG.colorDisabledEdit (false) or WHITE (true) here depending on the value being passed in.   
		  }
		 }

		public void Clear(){
		  m_entityBody = null;
		  m_bDirty = false;
		  myControl.txtBody.Clear(); 
		}

		public RequestTextViewer()
		{
		  // TODO: Add constructor logic here
		}

		public HTTPRequestHeaders headers{
		 get {
		  return null;    // Return null if your control doesn't allow header editing.
		  }
		 set{
		  }
		}

		public byte[] body
		{
		 get
		 {
		   return m_entityBody;
		 }
		 set
		 {    // Here's where the action is.  It's time to update the visible display of the text
		  m_entityBody = value;
		  
		  if (null!=m_entityBody){
		   myControl.txtBody.Text = System.Text.Encoding.UTF8.GetString(m_entityBody); // TODO: Use correct encoding based on content header.
		  }
		  else {
		   myControl.txtBody.Text = "";
		  }
		  m_bDirty = false;   // Note: Be sure to have an OnTextChanged handler for the textbox which sets m_bDirty to true!
		}

		public bool bDirty
		{
		 get
		  {
			return m_bDirty;
		  }
		}

		public override int GetOrder()
		{
		 return 0;
		}

		public override void AddToTab(System.Windows.Forms.TabPage o)
		{
		  myControl = new TextView(this);   // Essentially the TextView class is simply a usercontrol containing a textbox.
		  o.Text = "TextView";
		  o.Controls.Add(myControl);
		  o.Controls[0].Dock= DockStyle.Fill;
		}

		}
		}