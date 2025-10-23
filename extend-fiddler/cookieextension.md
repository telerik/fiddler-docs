---
title: Build Cookie Scanning Extension
slug: CookieExtension
publish: true
position: 16
---

Build Cookie Scanning Extension
===============================

Below is the code for the Fiddler Classic [Privacy Scanner add-on](https://www.telerik.com/fiddler/add-ons). 

		using System;
		using System.Collections;
		using System.Globalization;
		using System.Collections.Generic;
		using System.Windows.Forms;
		using System.Text;
		using Fiddler;
		using System.IO;
		using System.Diagnostics;
		using Microsoft.Win32;
		using System.Reflection;
		using System.Text.RegularExpressions;
 
		[assembly: Fiddler.RequiredVersion("2.3.9.0")]
		[assembly: AssemblyVersion("1.0.1.0")]
		[assembly: AssemblyTitle("PrivacyScanner")]
		[assembly: AssemblyDescription("Scans for Cookies and P3P")]
		[assembly: AssemblyCompany("Eric Lawrence")]
		[assembly: AssemblyProduct("PrivacyScanner")]
 
		public class TagCookies : IAutoTamper2
		{
			private bool bEnabled = false;
			private bool bEnforceP3PValidity = false;
			private bool bCreatedColumn = false;
			private System.Windows.Forms.MenuItem miEnabled;
			private System.Windows.Forms.MenuItem miEnforceP3PValidity;
			private System.Windows.Forms.MenuItem mnuCookieTag;
 
			public void OnLoad()
			{
				/*
		 * NB: You might not get called here until ~after~ one of the AutoTamper methods was called.
		 * This is okay for us, because we created our mnuContentBlock in the constructor and its simply not
		 * visible anywhere until this method is called and we merge it onto the Fiddler Classic Main menu.
		 */
				FiddlerApplication.UI.mnuMain.MenuItems.Add(mnuCookieTag);
			}
 
			public void OnBeforeUnload() {  /*noop*/   }
 
			private void InitializeMenu()
			{
				this.miEnabled = new System.Windows.Forms.MenuItem("&Enabled");
				this.miEnforceP3PValidity = new System.Windows.Forms.MenuItem("&Rename P3P header if invalid");
 
				this.miEnabled.Index = 0;
				this.miEnforceP3PValidity.Index = 1;
 
				this.mnuCookieTag = new System.Windows.Forms.MenuItem();
				this.mnuCookieTag.MenuItems.AddRange(new System.Windows.Forms.MenuItem[] { this.miEnabled, this.miEnforceP3PValidity });
				this.mnuCookieTag.Text = "Privacy";
 
				this.miEnabled.Click += new System.EventHandler(this.miEnabled_Click);
				this.miEnabled.Checked = bEnabled;
 
				this.miEnforceP3PValidity.Click += new System.EventHandler(this.miEnforceP3PValidity_Click);
				this.miEnforceP3PValidity.Checked = bEnforceP3PValidity;
			}
 
			public void miEnabled_Click(object sender, EventArgs e)
			{
				miEnabled.Checked = !miEnabled.Checked;
				bEnabled = miEnabled.Checked;
				this.miEnforceP3PValidity.Enabled = bEnabled;
				if (bEnabled) { EnsureColumn(); }
				FiddlerApplication.Prefs.SetBoolPref("extensions.tagcookies.enabled", bEnabled);
			}
 
			public void miEnforceP3PValidity_Click(object sender, EventArgs e)
			{
				miEnforceP3PValidity.Checked = !miEnforceP3PValidity.Checked;
				bEnforceP3PValidity = miEnforceP3PValidity.Checked;
				FiddlerApplication.Prefs.SetBoolPref("extensions.tagcookies.EnforceP3PValidity", bEnforceP3PValidity);
			}
 
			private void EnsureColumn()
			{
				if (bCreatedColumn) return;
 
				FiddlerApplication.UI.lvSessions.AddBoundColumn("Privacy Info", 1, 120, "X-Privacy");
 
				bCreatedColumn = true;
			}
 
			public TagCookies()
			{
				this.bEnabled = FiddlerApplication.Prefs.GetBoolPref("extensions.tagcookies.enabled", false);
				this.bEnforceP3PValidity = FiddlerApplication.Prefs.GetBoolPref("extensions.tagcookies.EnforceP3PValidity", true);
				InitializeMenu();
 
				if (bEnabled) { EnsureColumn(); } else { this.miEnforceP3PValidity.Enabled = false; }
			}
 
			private void SetP3PStateFromHeader(string sValue, ref P3PState oP3PState)
			{
				if (string.IsNullOrEmpty(sValue))
				{
					return;
				}
 
				string sUnsatCat = String.Empty;
				string sUnsatPurpose = String.Empty;
				sValue = sValue.Replace('\'', '"');
 
				string sCP = null;
 
				Regex r = new Regex("CP\\s?=\\s?[\"]?(?<TokenValue>[^\";]*)");
				Match m = r.Match(sValue);
				if (m.Success && (null != m.Groups["TokenValue"]))
				{
					sCP = m.Groups["TokenValue"].Value;
				}
 
				if (String.IsNullOrEmpty(sCP))
				{
					return;
				}
 
				// Okay, we've got a compact policy token.
 
				oP3PState = P3PState.P3POk;
				string[] sTokens = sCP.Split(new char[] { ' ' }, StringSplitOptions.RemoveEmptyEntries);
 
				foreach (string sToken in sTokens)
				{
					// Reject clearly invalid tokens...
					if ((sToken.Length < 3) || (sToken.Length > 4))
					{
						oP3PState = P3PState.P3PMalformed;
						return;
					}
 
					if (",PHY,ONL,GOV,FIN,".IndexOf("," + sToken + ",", StringComparison.OrdinalIgnoreCase) > -1)
					{
						sUnsatCat += (sToken + " ");
						continue;
					}
 
					if (",SAM,OTR,UNR,PUB,IVA,IVD,CON,TEL,OTP,".IndexOf("," + sToken + ",", StringComparison.OrdinalIgnoreCase) > -1)
					{
						sUnsatPurpose += (sToken + " ");
						continue;
					}
 
					// TODO: Look up the token in the complete collection and check validity
				}
 
				// If a cookie contains an unsatisfactory purpose and an unsatisfactory category, mark it
				// https://msdn.microsoft.com/en-us/library/ie/ms537343(v=vs.85).aspx#unsatisfactory_cookies
				if ((sUnsatCat.Length > 0) && (sUnsatPurpose.Length > 0))
				{
					if (oP3PState == P3PState.P3POk)
					{
						oP3PState = P3PState.P3PUnsatisfactory;
					}
				}
			}
 
			private enum P3PState
			{
				NoCookies,
				NoP3PAndSetsCookies,
				P3POk,
				P3PUnsatisfactory,
				P3PMalformed
			}
 
			public void OnPeekAtResponseHeaders(Session oSession) 
			{
				if (!bEnabled) return;
 
				P3PState oP3PState = P3PState.NoCookies;
 
				if (!oSession.oResponse.headers.Exists("Set-Cookie"))
				{
					return;
				}
 
				oP3PState = P3PState.NoP3PAndSetsCookies;
 
				if (oSession.oResponse.headers.Exists("P3P"))
				{
					SetP3PStateFromHeader(oSession.oResponse.headers["P3P"], ref oP3PState);
				}
 
				switch (oP3PState)
				{
					case P3PState.P3POk:
						oSession["ui-backcolor"] = "#ACDC85";
						oSession["X-Privacy"] = "Sets cookies & P3P";
						break;
 
					case P3PState.NoP3PAndSetsCookies:
						oSession["ui-backcolor"] = "#FAFDA4";
						oSession["X-Privacy"] = "Sets cookies without P3P";
						break;
 
					case P3PState.P3PUnsatisfactory:
						oSession["ui-backcolor"] = "#EC921A";
						oSession["X-Privacy"] = "Sets cookies; P3P unsatisfactory for 3rd-party use";
						break;
 
					case P3PState.P3PMalformed:
						oSession["ui-backcolor"] = "#E90A05";
						if (bEnforceP3PValidity)
						{
							oSession.oResponse.headers["MALFORMED-P3P"] = oSession.oResponse.headers["P3P"];
							oSession["X-Privacy"] = "MALFORMED P3P: " + oSession.oResponse.headers["P3P"];
							oSession.oResponse.headers.Remove("P3P");
						}
						break;
				}
			}
			public void AutoTamperRequestBefore(Session oSession) { }
			public void AutoTamperRequestAfter(Session oSession){ /*noop*/ }
			public void AutoTamperResponseAfter(Session oSession) {/*noop*/}
			public void AutoTamperResponseBefore(Session oSession) { /*noop*/ }
			public void OnBeforeReturningError(Session oSession) {/*noop*/}
		}

See Also
--------

+ [View Cookie Information](slug://CookieScanning)
+ [Rename Invalid P3P Headers](slug://RenameInvalidP3P)
