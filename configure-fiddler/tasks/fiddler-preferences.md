---
title: Configurable Preferences
description: List of Fiddler CLassic configurable preferences
slug: fiddler-classic-preferences
publish: true
position: 30
---

# Preferences in Fiddler Classic

Fiddler's preferences feature allows you to view and alter many configuration settings.

The following is a partial list of supported preferences in Fiddler; the default value is shown when one exists.

Shows error messages when Inspector and Extension related errors are encountered:
```bash
fiddler.debug.extensions.showerrors = "False"
```

Shows verbose messages in the Log tab when Fiddler loads Inspector and Extensions:
```bash
fiddler.debug.extensions.verbose = "False"
```

Controls whether the Fiddler Toolbar is visible:
```
fiddler.ui.toolbar.visible = "True"
```

Controls whether the Fiddler disables filters (e.g. Filters tab, Hide Images/Connects, process class filter) after restart (otherwise, the filter state from the last Fiddler session is restored):
```bash
fiddler.filters.ResetOnRestart = "False"
```

String indicating which egressIP to use:
```bash
fiddler.network.egress.IP
```

String indicating what hostname to use when registering as the system proxy. Should be 127.0.0.1 (default), localhost, the machine's name, or the machine's IP address.
```bash
fiddler.network.proxy.RegistrationHostName = "127.0.0.1"
```

Controls whether Fiddler will request a client certificate from the client application any time a HTTPS connection is made; this is mostly useful for testing whether the client can properly handle attaching such a certificate. Note: You must restart Fiddler after setting this option for the change to take effect.
```bash
fiddler.network.https.requestclientcertificate = "False"
```

Controls the Rules > Remove all Encodings rule:
```bash
fiddler.ui.rules.removeencoding = "False"
```

Controls the Rules > Hide Connects rule:
```bash
fiddler.ui.rules.hideconnects = "False"
```


Controls the Rules > Hide Images rule:
```bash
fiddler.ui.rules.hideimages = "False"
```

Set to "True" to cause Fiddler to abort a download if streaming the response to the client and the client aborts the connection to Fiddler:
```bash
fiddler.network.streaming.abortifclientaborts = "False"
```


Set to "True" to cause Fiddler to "forget" received bytes if they are streamed to the client. Similar to the SessionFlag 
log-drop-response-body, but forgetting occurs during streaming rather than upon response completion:
```bash
fiddler.network.streaming.ForgetStreamedData = "False"
```

Number of milliseconds Fiddler should wait for a request from the client on a new client connection:
```bash
fiddler.network.timeouts.clientpipe.receive.initial = 60000
```

Number of milliseconds Fiddler should wait for a request from the client on a new client connection.
```bash
fiddler.network.timeouts.clientpipe.receive.reuse = 30000
```

Number of milliseconds Fiddler should keep a DNS cache entry in its cache:
```bash
fiddler.network.timeouts.dnscache = 150000
```


When CTRL+X is hit, keep sessions that are either in progress, or marked (at a breakpoint, or with a comment, or with a mark color set)
```bash
fiddler.ui.CtrlX.KeepMarked = True
```


Force Fiddler to always use the RAW request inspector when double-clicking or hitting ENTER on a session:
```bash
fiddler.ui.inspectors.request.alwaysuse = "Raw"
```


Force Fiddler to always use the SyntaxView response inspector when double-clicking or hitting ENTER on a session:
```bash
fiddler.ui.inspectors.response.alwaysuse = "SyntaxView"
```

** FULL LIST of all preferences in Fiddler Classic**


```bash
addons.ericlaw.hosts.enabled
addons.ImageBloat.EmbedAsText
addons.ImageBloat.KeepOriginalResponse
experiment.nodoublebuffer
ext.ContentBlocker.BlockHosts
ext.ContentBlocker.BlockPathsByHeuristic
ext.ContentBlocker.FlashBlockAlways
ext.ContentBlocker.FlashBlockXDomain
ext.ContentBlocker.HideBlocked
ext.ContentBlocker.ShortcircuitRedirects
extensions.AnyWHERE.LastLocation
extensions.tagcookies.enabled
extensions.tagcookies.EnforceP3PValidity
fiddler.auth.SPNIncludesPort
fiddler.auth.SPNMode
fiddler.certmaker.assembly
fiddler.certmaker.bc.AddClientAuthEKU
fiddler.certmaker.bc.AddCRL
fiddler.certmaker.bc.AddEVPolicyOID
fiddler.certmaker.bc.cert
fiddler.certmaker.bc.CRLURL
fiddler.certmaker.bc.Debug
fiddler.certmaker.bc.DoDummyEncrypt
fiddler.certmaker.bc.EE.CreatedDaysAgo
fiddler.certmaker.bc.EE.CriticalAKID
fiddler.certmaker.bc.EE.CriticalBasicConstraints
fiddler.certmaker.bc.EE.CriticalEKU
fiddler.certmaker.bc.EE.SetAKID
fiddler.certmaker.bc.EE.SigAlg
fiddler.certmaker.bc.EE.YearsValid
fiddler.certmaker.bc.EmitEECertFile
fiddler.certmaker.bc.EmitRootCertFile
fiddler.certmaker.bc.key
fiddler.certmaker.bc.KeyContainerName
fiddler.certmaker.bc.KeyLength
fiddler.certmaker.bc.KeyProviderType
fiddler.certmaker.bc.LogPrivateKeys
fiddler.certmaker.bc.ParallelTimeout
fiddler.certmaker.bc.ReusePrivateKeys
fiddler.certmaker.bc.ReuseRoot
fiddler.certmaker.bc.ReuseRootKeysForEE
fiddler.certmaker.bc.Root.CriticalAKID
fiddler.certmaker.bc.Root.CriticalBasicConstraints
fiddler.certmaker.bc.Root.CriticalKeyUsage
fiddler.certmaker.bc.Root.CriticalSKID
fiddler.certmaker.bc.Root.SetAKID
fiddler.certmaker.bc.Root.SigAlg
fiddler.certmaker.bc.Root.YearsValid
fiddler.certmaker.bc.RootCN
fiddler.certmaker.bc.RootFriendly
fiddler.certmaker.bc.RootKeyLength
fiddler.certmaker.bc.UseMachineKeyStore
fiddler.certmaker.ce.EE.KeyLength
fiddler.certmaker.ce.EE.SigAlg
fiddler.certmaker.ce.Root.KeyLength
fiddler.certmaker.ce.Root.SigAlg
fiddler.CertMaker.CleanupServerCertsOnExit
fiddler.certmaker.DateFormatString
fiddler.certmaker.Debug
fiddler.certmaker.EE.extraparams
fiddler.certmaker.EE.SigAlg
fiddler.certmaker.GraceDays
fiddler.CertMaker.OfferMachineTrust
fiddler.certmaker.PreferCertEnroll
fiddler.certmaker.Root.extraparams
fiddler.certmaker.Root.SigAlg
fiddler.certmaker.ValidDays
fiddler.composer.autoauth
fiddler.composer.AutoAuthCreds
fiddler.composer.followredirects
fiddler.composer.followredirects.max
fiddler.composer.history.LogRequests
fiddler.composer.history.removeduplicates
fiddler.composer.history.SaveOnExit
fiddler.composer.HTTPSProxyBasicCreds
fiddler.composer.inspectsession
fiddler.config.path.captures
fiddler.config.path.defaultclientcert
fiddler.config.path.differ
fiddler.config.path.explorer
fiddler.config.path.lsof
fiddler.config.path.makecert
fiddler.config.path.texteditor
fiddler.config.path.Tools
fiddler.config.path.webtestexport.plugins
fiddler.debug.extensions.verbose
fiddler.differ.DecodeFirst
fiddler.differ.Params
fiddler.differ.ParamsAlt
fiddler.differ.ultradiff
fiddler.echoservice.enabled
fiddler.ephemeral.autoresponder.LastTestURI
fiddler.exporters.cURL.DefaultOptions
fiddler.exporters.RawFiles.OpenFolder
fiddler.exporters.RawFiles.RecreateStructure
fiddler.exporters.RawFiles.SkipNon200
fiddler.extensions.AutoSave.Password
fiddler.extensions.HTTPSNotary.Enabled
fiddler.extensions.HTTPSNotary.IgnoreHosts
fiddler.extensions.HTTPSNotary.IgnoreSSLPolicyErrors
fiddler.extensions.HTTPSNotary.LogVerbose
fiddler.extensions.HTTPSNotary.TimeoutMS
fiddler.extensions.JSFormat.AutoFormat
fiddler.extensions.JSFormat.BackColor
fiddler.filters.ephemeral.debugmode
fiddler.filters.ResetOnRestart
fiddler.find.ephemeral.lastsearchmarkcolor
fiddler.ftp.AlwaysDemandCredentials
fiddler.ftp.UseBinary
fiddler.ftp.UsePassive
fiddler.gallery.DisplayLimit
fiddler.gallery.FixedHeight
fiddler.gallery.MinSizeK
fiddler.Gallery.PicturePile.BackColor
fiddler.Gallery.PicturePile.Interval
fiddler.Gallery.Slideshow.BackColor
fiddler.Gallery.Slideshow.CommentBackColor
fiddler.Gallery.Slideshow.CommentForeColor
fiddler.gallery.ThumbSize
fiddler.importers.PacketCapture.debug
fiddler.importers.PacketCapture.verbose
fiddler.importexport.HTTPArchiveJSON.MaxBinaryBodyLength
fiddler.importexport.HTTPArchiveJSON.MaxTextBodyLength
fiddler.inspectors.headers.AutoSizeRequestLine
fiddler.inspectors.hexview.bytesperline
fiddler.inspectors.hexview.showoffsets
fiddler.inspectors.HideList
fiddler.inspectors.images.AlertOnGeoLoc
fiddler.inspectors.images.EditedReloadDelay
fiddler.inspectors.images.EditorPath
fiddler.inspectors.images.MapURI
fiddler.inspectors.images.textwidth
fiddler.inspectors.images.viewmode
fiddler.inspectors.request.raw.truncatebinaryat
fiddler.inspectors.request.raw.truncatetextat
fiddler.inspectors.RequestHexView.ShowHeaders
fiddler.inspectors.response.AdvertiseFSE
fiddler.inspectors.response.AdvertiseSyntaxView
fiddler.inspectors.response.raw.truncatebinaryat
fiddler.inspectors.response.raw.truncatetextat
fiddler.inspectors.response.syntaxview.wordwrap
fiddler.inspectors.response.WebView.AutoPlay
fiddler.inspectors.ResponseHexView.ShowHeaders
fiddler.inspectors.WebForms.AssumeURLEncoded
fiddler.Lint.HTTP
fiddler.log.DropMessagesUnlessActive
fiddler.memory.DropIfOver
fiddler.network.auth.reusemode
fiddler.network.dns.fallback
fiddler.network.dns.MaxAddressCount
fiddler.network.dns.ResolveOnionHosts
fiddler.network.FixRequestContentLength
fiddler.network.gateway.DetermineInProcess
fiddler.network.gateway.exceptions
fiddler.network.gateway.proxies
fiddler.network.gateway.UseFailedAutoProxy
fiddler.network.https.blindtunnelifcertunobtainable
fiddler.network.https.cacheclientcert
fiddler.network.https.checkcertificaterevocation
fiddler.network.https.clientcertificate.ephemeral.prompt-for-missing
fiddler.network.https.NoDecryptionHosts
fiddler.network.https.requestclientcertificate
fiddler.network.https.SetCNFromSNI
fiddler.network.https.storeservercertchain
fiddler.network.https.SupportedClientProtocolVersions
fiddler.network.https.SupportedServerProtocolVersions
fiddler.network.https.validateclientcert
fiddler.network.leakhttp1xx
fiddler.network.proxy.RegistrationHostName
fiddler.network.RejectIncompleteRequests
fiddler.network.SetHostHeaderFromURL
fiddler.network.sockets.Client_SO_RCVBUF
fiddler.network.sockets.Client_SO_SNDBUF
fiddler.network.sockets.ClientReadBufferSize
fiddler.network.sockets.Server_SO_RCVBUF
fiddler.network.sockets.Server_SO_SNDBUF
fiddler.network.sockets.ServerReadBufferSize
fiddler.network.streaming.abortifclientaborts
fiddler.network.streaming.abortorphanstreams
fiddler.network.streaming.AutoStreamByMIME
fiddler.network.streaming.ForgetStreamedData
fiddler.network.timeouts.clientpipe.receive.initial
fiddler.network.timeouts.clientpipe.receive.reuse
fiddler.network.timeouts.dnscache
fiddler.network.timeouts.serverpipe.receive.initial
fiddler.network.timeouts.serverpipe.receive.reuse
fiddler.network.timeouts.serverpipe.reuse
fiddler.network.timeouts.serverpipe.send.initial
fiddler.network.timeouts.serverpipe.send.reuse
fiddler.network.timeouts.serverpipe.watchdoginterval
fiddler.ProcessInfo.DecorateWithAppName
fiddler.proxy.creds
fiddler.proxy.IgnoreGatewayOverrideIfUnreachable
fiddler.proxy.pacfile.text
fiddler.proxy.pacfile.usefileprotocol
fiddler.proxy.WarnAboutAppContainers
fiddler.proxy.WarnIfElevationRequired
fiddler.proxy.WatchRegistry
fiddler.proxy.WorkaroundBuggyWinShutdown
fiddler.QuickExec.autocomplete
fiddler.QuickExec.KeepHistory
fiddler.reissue.autoauth
fiddler.reissue.autoredircount
fiddler.saz.AddUIShortcuts
fiddler.saz.AES.Use256Bit
fiddler.saz.ClearCaches
fiddler.saz.PrivacyNoticeShown
fiddler.saz.ReloadIDAsFlag
fiddler.SAZ.UseMemoryCache
fiddler.screenshot.DelayMS
fiddler.script.AutoRef
fiddler.script.CompileToFilename
fiddler.script.delaycreate
fiddler.script.GenerateDebugInfo
fiddler.script.LibPath
fiddler.session.prependIDtosuggestedfilename
fiddler.sounds.Countdown
fiddler.sounds.Gallery.SlideShowAdvance
fiddler.sounds.Screenshot
fiddler.sounds.ScriptCompile
fiddler.sounds.ScriptError
fiddler.textwizard.InputEncoding
fiddler.textwizard.OutputEncoding
fiddler.threads.minIO
fiddler.threads.minworker
fiddler.timeline.mode
fiddler.timeline.SessionLimit
fiddler.transfomer.ChunkCount
fiddler.ui.AutoRefreshItemCountLimit
fiddler.ui.Colors.AutoResponded
fiddler.ui.Colors.ColumnDuplicate
fiddler.ui.Colors.ImageBloat
fiddler.ui.Colors.ImageBloatMortar
fiddler.ui.Colors.LoadedFromSAZ
fiddler.ui.Colors.QuickExec
fiddler.ui.Colors.QuickExecText
fiddler.ui.CtrlX.KeepMarked
fiddler.ui.CtrlX.PromptIfMoreThan
fiddler.ui.ephemeral.rules.breakonrequest
fiddler.ui.ephemeral.rules.breakonresponse
fiddler.ui.ephemeral.rules.forcegzip
fiddler.ui.ephemeral.rules.requireproxyauth
fiddler.ui.ExplorerStyle
fiddler.ui.fixedfont.face
fiddler.ui.font.face
fiddler.ui.httperror.Height
fiddler.ui.httperror.Left
fiddler.ui.httperror.Top
fiddler.ui.httperror.Width
fiddler.ui.inspectors.request.alwaysuse
fiddler.ui.inspectors.response.alwaysuse
fiddler.ui.lastview
fiddler.ui.layout.mode
fiddler.ui.MaskPasswords
fiddler.ui.menus.book.visible
fiddler.ui.mru.max
fiddler.ui.overrideIcon
fiddler.ui.ReporterUpdateInterval
fiddler.ui.rules.bufferresponses
fiddler.ui.rules.hideconnects
fiddler.ui.rules.hideimages
fiddler.ui.rules.keeponly
fiddler.ui.rules.removeencoding
fiddler.ui.sessionlist.updateinterval
fiddler.ui.toolbar.BrowserList
fiddler.ui.toolbar.ShowLabels
fiddler.ui.toolbar.visible
fiddler.ui.WizardColumnSet
fiddler.updater.CheckFreshness
fiddler.updater.LastBegged
fiddler.updater.OfferBetaBuilds
fiddler.websocket.ParseMessages
fiddler.welcomemsg
inspectors.pdfview.SpeakRate
inspectors.webview.SpeakRate
```