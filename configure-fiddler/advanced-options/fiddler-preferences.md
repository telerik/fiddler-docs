---
title: Configurable Preferences
description: Learn how to view, set, and manage configurable preferences in Fiddler Classic
slug: fiddler-classic-preferences
publish: true
position: 30
previous_url: /configure-fiddler/tasks/fiddler-preferences
---

# Preferences in Fiddler Classic

Fiddler Classic includes a preferences system for viewing and changing internal configuration settings not exposed through the standard **Tools** > **Options** dialog. Preferences are key-value pairs stored in the Windows Registry and persist across Fiddler Classic sessions.

## Accessing Preferences

### Preferences Tab

Click **View** > **Tabs** > **Preferences** to open a searchable grid of all active preferences. You can add, edit, or remove preferences directly in the grid.

### QuickExec Commands

The [QuickExec box](slug://QuickExec) (the command bar below the session list) accepts `prefs` commands for managing preferences from the keyboard.

#### Browse All Preferences

Type `about:config` in the QuickExec box to open the full editable preferences grid.

#### View Preference Values

```sh
# Show all current preference values in a message box
prefs show

# Filter results by a partial name match
prefs show toolbar
```

>tip Press `Ctrl+C` inside the result message box to copy the displayed preferences to the clipboard.

#### Set a Preference

```sh
prefs set fiddler.ui.toolbar.visible True
prefs set fiddler.config.path.captures "C:\Work\Captures"
```

To include a quote character inside a value, escape it with a backslash:

```sh
prefs set fiddler.welcomemsg "I said \"Hello!\""
```

When setting a file path, omit the final backslash to prevent parsing ambiguity:

```sh
prefs set fiddler.config.path.captures "C:\Work\Captures"
```

#### Remove a Preference

```sh
prefs remove fiddler.ui.toolbar.mdnsearchurl
```

## Preference Naming Rules

All preference names must follow these rules:

* Names are **not case-sensitive** — `fiddler.UI.Toolbar.Visible` and `fiddler.ui.toolbar.visible` refer to the same preference.
* Names may only contain ASCII letters (A–Z), digits, dots (`.`), dashes (`-`), and underscores (`_`).
* Names must be between 1 and 255 characters long.
* Preferences with **`ephemeral`** in the name are not saved to or loaded from the registry — they reset on every Fiddler Classic restart.
* Preferences with **`internal`** in the name cannot be created or modified by extensions or FiddlerScript.

## Managing Preferences from FiddlerScript or Extensions

Preferences can also be read and written programmatically through `FiddlerApplication.Prefs`, which implements `IFiddlerPreferences`:

```c#
// Write preferences
FiddlerApplication.Prefs.SetBoolPref("fiddler.ui.toolbar.visible", true);
FiddlerApplication.Prefs.SetInt32Pref("fiddler.network.timeouts.dnscache", 300000);
FiddlerApplication.Prefs.SetStringPref("fiddler.ui.toolbar.mdnsearchurl", "https://example.com/search?q=");

// Read preferences
bool isVisible = FiddlerApplication.Prefs.GetBoolPref("fiddler.ui.toolbar.visible", true);
string searchURL = FiddlerApplication.Prefs.GetStringPref("fiddler.ui.toolbar.mdnsearchurl", "");
```

To watch for preference changes in FiddlerScript, use `WatchPreference`:

```js
static function OnPrefChange(o: Object, pceA: PrefChangeEventArgs) {
    FiddlerObject.log(pceA.PrefName + " changed to: " + pceA.ValueString);
}

static function Main() {
    FiddlerObject.WatchPreference("fiddler.ui.", OnPrefChange);
}
```

For full details on the `IFiddlerPreferences` interface and extension-based watcher patterns, see [Create a Fiddler Classic Extension](slug://CreateExtension).

## Preference Reference

The following is a partial list of preferences with descriptions; the default value is shown where one exists.

Shows error messages when Inspector and Extension related errors are encountered:
```bash
fiddler.debug.extensions.showerrors = "True"
```

Shows verbose messages in the **Log** tab when Fiddler Classic loads inspectors and extensions:
```bash
fiddler.debug.extensions.verbose = "True"
```

Controls whether the Fiddler Classic toolbar is visible:
```bash
fiddler.ui.toolbar.visible = "True"
```

Controls the placeholder text shown in the toolbar search box (the MDN search cue):
```bash
fiddler.ui.toolbar.mdnsearchcue = "Search MDN..."
```

Controls the URL that is opened when you perform a search from the toolbar search box. By default this points to MDN, but you can replace it with any search URL that accepts a query string:
```bash
fiddler.ui.toolbar.mdnsearchurl = "https://developer.mozilla.org/en-US/search?q="
```

For example, to redirect toolbar searches to a custom internal wiki:
```bash
fiddler.ui.toolbar.mdnsearchurl = "https://wiki.example.com/search?q="
```

Controls whether Fiddler Classic disables filters (for example, the **Filters** tab, **Hide Images**, **Hide Connects**, and process class filter) after restart (otherwise, the filter state from the last Fiddler Classic session is restored):
```bash
fiddler.filters.resetonrestart = "False"
```

Specifies the egress IP address to use:
```bash
fiddler.network.egress.ip 131.107.0.111
```

Specifies the hostname to use when registering as the system proxy. Accepted values: `127.0.0.1` (default), `localhost`, the machine name, or the machine's IP address.
```bash
fiddler.network.proxy.registrationhostname = "127.0.0.1"
```

Controls whether Fiddler Classic requests a client certificate from the client application any time an HTTPS connection is made. This is useful for testing whether the client handles attaching such a certificate.

>note You must restart Fiddler Classic after setting this option for the change to take effect.
```bash
fiddler.network.https.requestclientcertificate = "False"
```

Controls the **Rules** > **Remove All Encodings** rule:
```bash
fiddler.ui.rules.removeencoding = "False"
```

Controls the **Rules** > **Hide Connects** rule:
```bash
fiddler.ui.rules.hideconnects = "False"
```


Controls the **Rules** > **Hide Images** rule:
```bash
fiddler.ui.rules.hideimages = "False"
```

When set to `True`, Fiddler Classic aborts a download if it is streaming the response to the client and the client closes the connection:
```bash
fiddler.network.streaming.abortifclientaborts = "False"
```

When set to `True`, Fiddler Classic discards received bytes as they are streamed to the client — similar to the `log-drop-response-body` session flag, but the discarding occurs during streaming rather than after the response completes:
```bash
fiddler.network.streaming.forgetstreameddata = "False"
```

Number of milliseconds Fiddler Classic waits for a request from the client on a new connection (initial timeout):
```bash
fiddler.network.timeouts.clientpipe.receive.initial = 60000
```

Number of milliseconds Fiddler Classic waits for a request from the client on a reused keep-alive connection:
```bash
fiddler.network.timeouts.clientpipe.receive.reuse = 30000
```

Number of milliseconds Fiddler Classic keeps a DNS cache entry:
```bash
fiddler.network.timeouts.dnscache = 150000
```

When `Ctrl+X` is pressed, Fiddler Classic keeps sessions that are in progress or marked (at a breakpoint, with a comment, or with a color mark):
```bash
fiddler.ui.ctrlx.keepmarked = True
```

Forces Fiddler Classic to always use the **Raw** request inspector when you double-click or press `Enter` on a session:
```bash
fiddler.ui.inspectors.request.alwaysuse = "Raw"
```

Forces Fiddler Classic to always use the **SyntaxView** response inspector when you double-click or press `Enter` on a session:
```bash
fiddler.ui.inspectors.response.alwaysuse = "SyntaxView"
```

### Full Preference List

```bash
addons.ericlaw.hosts.enabled
addons.imagebloat.embedastext
addons.imagebloat.keeporiginalresponse
experiment.nodoublebuffer
ext.contentblocker.blockhosts
ext.contentblocker.blockpathsbyheuristic
ext.contentblocker.flashblockalways
ext.contentblocker.flashblockxdomain
ext.contentblocker.hideblocked
ext.contentblocker.shortcircuitredirects
extensions.anywhere.lastlocation
extensions.tagcookies.enabled
extensions.tagcookies.enforcep3pvalidity
fiddler.auth.spnincludesport
fiddler.auth.spnmode
fiddler.certmaker.assembly
fiddler.certmaker.bc.addclientautheku
fiddler.certmaker.bc.addcrl
fiddler.certmaker.bc.addevpolicyoid
fiddler.certmaker.bc.cert
fiddler.certmaker.bc.crlurl
fiddler.certmaker.bc.debug
fiddler.certmaker.bc.dodummyencrypt
fiddler.certmaker.bc.ee.createddaysago
fiddler.certmaker.bc.ee.criticalakid
fiddler.certmaker.bc.ee.criticalbasicconstraints
fiddler.certmaker.bc.ee.criticaleku
fiddler.certmaker.bc.ee.setakid
fiddler.certmaker.bc.ee.sigalg
fiddler.certmaker.bc.ee.yearsvalid
fiddler.certmaker.bc.emiteecertfile
fiddler.certmaker.bc.emitrootcertfile
fiddler.certmaker.bc.key
fiddler.certmaker.bc.keycontainername
fiddler.certmaker.bc.keylength
fiddler.certmaker.bc.keyprovidertype
fiddler.certmaker.bc.logprivatekeys
fiddler.certmaker.bc.paralleltimeout
fiddler.certmaker.bc.reuseprivatekeys
fiddler.certmaker.bc.reuseroot
fiddler.certmaker.bc.reuserootkeysforee
fiddler.certmaker.bc.root.criticalakid
fiddler.certmaker.bc.root.criticalbasicconstraints
fiddler.certmaker.bc.root.criticalkeyusage
fiddler.certmaker.bc.root.criticalskid
fiddler.certmaker.bc.root.setakid
fiddler.certmaker.bc.root.sigalg
fiddler.certmaker.bc.root.yearsvalid
fiddler.certmaker.bc.rootcn
fiddler.certmaker.bc.rootfriendly
fiddler.certmaker.bc.rootkeylength
fiddler.certmaker.bc.usemachinekeystore
fiddler.certmaker.ce.ee.keylength
fiddler.certmaker.ce.ee.sigalg
fiddler.certmaker.ce.root.keylength
fiddler.certmaker.ce.root.sigalg
fiddler.certmaker.cleanupservercertsonexit
fiddler.certmaker.dateformatstring
fiddler.certmaker.debug
fiddler.certmaker.ee.extraparams
fiddler.certmaker.ee.sigalg
fiddler.certmaker.gracedays
fiddler.certmaker.offermachinetrust
fiddler.certmaker.prefercertenroll
fiddler.certmaker.root.extraparams
fiddler.certmaker.root.sigalg
fiddler.certmaker.validdays
fiddler.composer.autoauth
fiddler.composer.autoauthcreds
fiddler.composer.followredirects
fiddler.composer.followredirects.max
fiddler.composer.history.logrequests
fiddler.composer.history.removeduplicates
fiddler.composer.history.saveonexit
fiddler.composer.httpsproxybasiccreds
fiddler.composer.inspectsession
fiddler.config.path.captures
fiddler.config.path.defaultclientcert
fiddler.config.path.differ
fiddler.config.path.explorer
fiddler.config.path.lsof
fiddler.config.path.makecert
fiddler.config.path.texteditor
fiddler.config.path.tools
fiddler.config.path.webtestexport.plugins
fiddler.debug.extensions.verbose
fiddler.differ.decodefirst
fiddler.differ.params
fiddler.differ.paramsalt
fiddler.differ.ultradiff
fiddler.echoservice.enabled
fiddler.ephemeral.autoresponder.lasttesturi
fiddler.exporters.curl.defaultoptions
fiddler.exporters.rawfiles.openfolder
fiddler.exporters.rawfiles.recreatestructure
fiddler.exporters.rawfiles.skipnon200
fiddler.extensions.autosave.password
fiddler.extensions.httpsnotary.enabled
fiddler.extensions.httpsnotary.ignorehosts
fiddler.extensions.httpsnotary.ignoresslpolicyerrors
fiddler.extensions.httpsnotary.logverbose
fiddler.extensions.httpsnotary.timeoutms
fiddler.extensions.jsformat.autoformat
fiddler.extensions.jsformat.backcolor
fiddler.filters.ephemeral.debugmode
fiddler.filters.resetonrestart
fiddler.find.ephemeral.lastsearchmarkcolor
fiddler.ftp.alwaysdemandcredentials
fiddler.ftp.usebinary
fiddler.ftp.usepassive
fiddler.gallery.displaylimit
fiddler.gallery.fixedheight
fiddler.gallery.minsizek
fiddler.gallery.picturepile.backcolor
fiddler.gallery.picturepile.interval
fiddler.gallery.slideshow.backcolor
fiddler.gallery.slideshow.commentbackcolor
fiddler.gallery.slideshow.commentforecolor
fiddler.gallery.thumbsize
fiddler.importers.packetcapture.debug
fiddler.importers.packetcapture.verbose
fiddler.importexport.httparchivejson.maxbinarybodylength
fiddler.importexport.httparchivejson.maxtextbodylength
fiddler.inspectors.headers.autosizerequestline
fiddler.inspectors.hexview.bytesperline
fiddler.inspectors.hexview.showoffsets
fiddler.inspectors.hidelist
fiddler.inspectors.images.alertongeoloc
fiddler.inspectors.images.editedreloaddelay
fiddler.inspectors.images.editorpath
fiddler.inspectors.images.mapuri
fiddler.inspectors.images.textwidth
fiddler.inspectors.images.viewmode
fiddler.inspectors.request.raw.truncatebinaryat
fiddler.inspectors.request.raw.truncatetextat
fiddler.inspectors.requesthexview.showheaders
fiddler.inspectors.response.advertisefse
fiddler.inspectors.response.advertisesyntaxview
fiddler.inspectors.response.raw.truncatebinaryat
fiddler.inspectors.response.raw.truncatetextat
fiddler.inspectors.response.syntaxview.wordwrap
fiddler.inspectors.response.webview.autoplay
fiddler.inspectors.responsehexview.showheaders
fiddler.inspectors.webforms.assumeurlencoded
fiddler.lint.http
fiddler.log.dropmessagesunlessactive
fiddler.memory.dropifover
fiddler.network.auth.reusemode
fiddler.network.dns.fallback
fiddler.network.dns.maxaddresscount
fiddler.network.dns.resolveonionhosts
fiddler.network.fixrequestcontentlength
fiddler.network.gateway.determineinprocess
fiddler.network.gateway.exceptions
fiddler.network.gateway.proxies
fiddler.network.gateway.usefailedautoproxy
fiddler.network.https.blindtunnelifcertunobtainable
fiddler.network.https.cacheclientcert
fiddler.network.https.checkcertificaterevocation
fiddler.network.https.clientcertificate.ephemeral.prompt-for-missing
fiddler.network.https.nodecryptionhosts
fiddler.network.https.requestclientcertificate
fiddler.network.https.setcnfromsni
fiddler.network.https.storeservercertchain
fiddler.network.https.supportedclientprotocolversions
fiddler.network.https.supportedserverprotocolversions
fiddler.network.https.validateclientcert
fiddler.network.leakhttp1xx
fiddler.network.proxy.registrationhostname
fiddler.network.rejectincompleterequests
fiddler.network.sethostheaderfromurl
fiddler.network.sockets.client_so_rcvbuf
fiddler.network.sockets.client_so_sndbuf
fiddler.network.sockets.clientreadbuffersize
fiddler.network.sockets.server_so_rcvbuf
fiddler.network.sockets.server_so_sndbuf
fiddler.network.sockets.serverreadbuffersize
fiddler.network.streaming.abortifclientaborts
fiddler.network.streaming.abortorphanstreams
fiddler.network.streaming.autostreambymime
fiddler.network.streaming.forgetstreameddata
fiddler.network.timeouts.clientpipe.receive.initial
fiddler.network.timeouts.clientpipe.receive.reuse
fiddler.network.timeouts.dnscache
fiddler.network.timeouts.serverpipe.receive.initial
fiddler.network.timeouts.serverpipe.receive.reuse
fiddler.network.timeouts.serverpipe.reuse
fiddler.network.timeouts.serverpipe.send.initial
fiddler.network.timeouts.serverpipe.send.reuse
fiddler.network.timeouts.serverpipe.watchdoginterval
fiddler.processinfo.decoratewithappname
fiddler.proxy.creds
fiddler.proxy.ignoregatewayoverrideifunreachable
fiddler.proxy.pacfile.text
fiddler.proxy.pacfile.usefileprotocol
fiddler.proxy.warnaboutappcontainers
fiddler.proxy.warnifelevationrequired
fiddler.proxy.watchregistry
fiddler.proxy.workaroundbuggywinshutdown
fiddler.quickexec.autocomplete
fiddler.quickexec.keephistory
fiddler.reissue.autoauth
fiddler.reissue.autoredircount
fiddler.saz.adduishortcuts
fiddler.saz.aes.use256bit
fiddler.saz.clearcaches
fiddler.saz.privacynoticeshown
fiddler.saz.reloadidasflag
fiddler.saz.usememorycache
fiddler.screenshot.delayms
fiddler.script.autoref
fiddler.script.compiletofilename
fiddler.script.delaycreate
fiddler.script.generatedebuginfo
fiddler.script.libpath
fiddler.session.prependidtosuggestedfilename
fiddler.sounds.countdown
fiddler.sounds.gallery.slideshowadvance
fiddler.sounds.screenshot
fiddler.sounds.scriptcompile
fiddler.sounds.scripterror
fiddler.textwizard.inputencoding
fiddler.textwizard.outputencoding
fiddler.threads.minio
fiddler.threads.minworker
fiddler.timeline.mode
fiddler.timeline.sessionlimit
fiddler.transfomer.chunkcount
fiddler.ui.autorefreshitemcountlimit
fiddler.ui.colors.autoresponded
fiddler.ui.colors.columnduplicate
fiddler.ui.colors.imagebloat
fiddler.ui.colors.imagebloatmortar
fiddler.ui.colors.loadedfromsaz
fiddler.ui.colors.quickexec
fiddler.ui.colors.quickexectext
fiddler.ui.ctrlx.keepmarked
fiddler.ui.ctrlx.promptifmorethan
fiddler.ui.ephemeral.rules.breakonrequest
fiddler.ui.ephemeral.rules.breakonresponse
fiddler.ui.ephemeral.rules.forcegzip
fiddler.ui.ephemeral.rules.requireproxyauth
fiddler.ui.explorerstyle
fiddler.ui.fixedfont.face
fiddler.ui.font.face
fiddler.ui.httperror.height
fiddler.ui.httperror.left
fiddler.ui.httperror.top
fiddler.ui.httperror.width
fiddler.ui.inspectors.request.alwaysuse
fiddler.ui.inspectors.response.alwaysuse
fiddler.ui.lastview
fiddler.ui.layout.mode
fiddler.ui.maskpasswords
fiddler.ui.menus.book.visible
fiddler.ui.mru.max
fiddler.ui.overrideicon
fiddler.ui.reporterupdateinterval
fiddler.ui.rules.bufferresponses
fiddler.ui.rules.hideconnects
fiddler.ui.rules.hideimages
fiddler.ui.rules.keeponly
fiddler.ui.rules.removeencoding
fiddler.ui.sessionlist.updateinterval
fiddler.ui.toolbar.browserlist
fiddler.ui.toolbar.mdnsearchcue
fiddler.ui.toolbar.mdnsearchurl
fiddler.ui.toolbar.showlabels
fiddler.ui.toolbar.visible
fiddler.ui.wizardcolumnset
fiddler.updater.checkfreshness
fiddler.updater.lastbegged
fiddler.updater.offerbetabuilds
fiddler.websocket.parsemessages
fiddler.welcomemsg
inspectors.pdfview.speakrate
inspectors.webview.speakrate
```

## See Also

- [QuickExec Reference](slug://QuickExec)
- [Create a Fiddler Classic Extension](slug://CreateExtension)
- [Options UI Reference](slug://options-ui)