---
title: VPAT
slug: vpat
publish: true
res_type: kb
---


### Date:
9/15/2012

### Name of Product:
Fiddler Classic Web Debugger

### Contact for more Information:
[https://www.telerik.com/fiddler](https://www.telerik.com/fiddler)

# Summary
## Voluntary Product Accessibility Template

### Section 1194.21 Software Applications and Operating Systems
Please refer to the attached VPAT

### Section 1194.22 Web-based Internet Information and Applications
Not Applicable - Fiddler Classic is not considered a web-based internet information application

### Section 1194.23 Telecommunications Products
Not Applicable - Fiddler Classic is not considered a telecommunications product

### Section 1194.24 Video and Multi-media Products
Not Applicable - Fiddler Classic is not considered a video or multi-media product

### Section 1194.25 Self-Contained, Closed Products
Not Applicable - Fiddler Classic is not considered a self-contained, closed product

### Section 1194.26 Desktop and Portable Computers
Not Applicable - Fiddler Classic is not considered a desktop or portable computer

### Section 1194.31 Functional Performance Criteria
Please refer to the attached VPAT

### Section 1194.41 Information, Documentation, and Support
Please refer to the attached VPAT

# Section 1194.21 Software Applications and Operating Systems - Detail
## Voluntary Product Accessibility Template

### (a) When software is designed to run on a system that has a keyboard, product functions shall be executable from a keyboard where the function itself or the result of performing a function can be discerned textually.
Supports with Exceptions

* Fiddler Classic supports all standard keyboard features of the user interface.
* Fiddler Classic provides Help functionality that includes easily accessible reference guides for keyboard shortcuts.
* In addition, documentation on Keyboard Shortcut keys are available online: [http://www.fiddler2.com/fiddler/help/keyboard.asp](http://www.fiddler2.com/fiddler/help/keyboard.asp)
* Fiddler Classic supports a feature known as QuickExec which allows full command-line access to all Fiddler Classic features via the scripting engine.  See [http://www.fiddler2.com/fiddler/help/quickexec.asp](http://www.fiddler2.com/fiddler/help/quickexec.asp) for more information.

Exceptions

* Fiddler Classic supports all standard keyboard operation of the user interface.
* Fiddler Classic plugins not bundled with Fiddler Classic may or may not support keyboard accessibility.

### (b) Applications shall not disrupt or disable activated features of other products that are identified as accessibility features, where those features are developed and documented according to industry standards. Applications also shall not disrupt or disable activated features of any operating system that are identified as accessibility features where the application programming interface for those accessibility features has been documented by the manufacturer of the operating system and is available to the product developer.
Supports with Exceptions

* Fiddler Classic supports system StickyKeys, FilterKeys, MouseKeys, SerialKeys and ToggleKeys.

### (c) A well-defined on-screen indication of the current focus shall be provided that moves among interactive interface elements as the input focus changes. The focus shall be programmatically exposed so that Assistive Technology can track focus and focus changes.
Supports with Exceptions

* Fiddler Classic indicates focus in all focusable fields using standard technologies.

### (d) Sufficient information about a user interface element including the identity, operation and state of the element shall be available to Assistive Technology. When an image represents a program element, the information conveyed by the image must also be available in text.
Supports with Exceptions

* Fiddler Classic user interface elements are exposed programmatically through managed object models and programming interfaces such as Microsoft Active Accessibility. Standard Windows controls and interface elements automatically expose this information through Microsoft Active Accessibility.

### (e) When bitmap images are used to identify controls, status indicators, or other programmatic elements, the meaning assigned to those images shall be consistent throughout an application's performance.
Supports

* Fiddler Classic utilizes standard and consistent images throughout.

### (f) Textual information shall be provided through operating system functions for displaying text. The minimum information that shall be made available is text content, text input caret location, and text attributes.
Supports with Exceptions

* Fiddler Classic provides textual information through Microsoft Active Accessibility.
* Microsoft Active Accessibility is a COM-based technology that improves the way accessibility aids work with applications running on Microsoft Windows operating systems. It provides dynamic-link libraries that are incorporated into the operating system, as well as a COM interface and application programming elements that provide reliable methods for exposing information about user interface elements.

### (g) Applications shall not override user selected contrast and color selections and other individual display attributes.
Supports with Exceptions

* In some cases, Fiddler Classic overrides UI colors to indicate characteristics of HTTP/HTTPS traffic.  Color is not used as the sole distinguishing attribute.
* Fiddler Classic does not always respect system font sizing.  Fiddler Classic font sizing may be controlled from the Tools / Fiddler Classic Options screen.

### (h) When animation is displayed, the information shall be displayable in at least one non-animated presentation mode at the option of the user.
Supports with Exceptions

* Fiddler Classic does not use animation in its user interface.
* When viewing animated web images using Fiddler, they will be animated.

### (i) Color coding shall not be used as the only means of conveying information, indicating an action, prompting a response, or distinguishing a visual element.
Supports

* Fiddler Classic does not use colors as the only way to convey information, indicate an action, prompt a response, or distinguish a visual element.

### (j) When a product permits a user to adjust color and contrast settings, a variety of color selections capable of producing a range of contrast levels shall be provided.
Supports

* Fiddler Classic supports changing of UI element colors via its scripting engine.

### (k) Software shall not use flashing or blinking text, objects, or other elements having a flash or blink frequency greater than 2 Hz and lower than 55 Hz.
Supports with Exceptions

* When viewing animated web images using Fiddler, they will be animated according to the original images settings.


### (l) When electronic forms are used, the form shall allow people using Assistive Technology to access the information, field elements, and functionality required for completion and submission of the form, including all directions and cues.
Not Applicable

* Fiddler Classic does not use electronic forms.

# Section 1194.22 Web-based Internet Information and Applications - Detail
## Voluntary Product Accessibility Template

### (a) A text equivalent for every non-text element shall be provided (e.g., via "alt", "longdesc", or in element content).
Not Applicable

### (b) Equivalent alternatives for any multimedia presentation shall be synchronized with the presentation.
Not Applicable

### (c) Web pages shall be designed so that all information conveyed with color is also available without color, for example from context or markup.
Not Applicable

### (d) Documents shall be organized so they are readable without requiring an associated style sheet.
Not Applicable

### (e) Redundant text links shall be provided for each active region of a server-side image map.
Not Applicable

### (f) Client-side image maps shall be provided instead of server-side image maps except where the regions cannot be defined with an available geometric shape.
Not Applicable

### (g) Row and column headers shall be identified for data tables.
Not Applicable

### (h) Markup shall be used to associate data cells and header cells for data tables that have two or more logical levels of row or column headers.
Not Applicable

### (i) Frames shall be titled with text that facilitates frame identification and navigation
Not Applicable

### (j) Pages shall be designed to avoid causing the screen to flicker with a frequency greater than 2 Hz and lower than 55 Hz.
Not Applicable

### (k) A text-only page, with equivalent information or functionality, shall be provided to make a web site comply with the provisions of this part, when compliance cannot be accomplished in any other way. The content of the text-only page shall be updated whenever the primary page changes.
Not Applicable

### (l) When pages utilize scripting languages to display content, or to create interface elements, the information provided by the script shall be identified with functional text that can be read by Assistive Technology.
Not Applicable

### (m) When a web page requires that an applet, plug-in or other application be present on the client system to interpret page content, the page must provide a link to a plug-in or applet that complies with §1194.21(a) through (l).
Not Applicable

### (n) When electronic forms are designed to be completed on-line, the form shall allow people using Assistive Technology to access the information, field elements, and functionality required for completion and submission of the form, including all directions and cues.
Not Applicable

### (o) A method shall be provided that permits users to skip repetitive navigation links.
Not Applicable

### (p) When a timed response is required, the user shall be alerted and given sufficient time to indicate more time is required.
Not Applicable

# Section 1194.23 Telecommunications Products - Detail
## Voluntary Product Accessibility Template

### (a) Telecommunications products or systems which provide a function allowing voice communication and which do not themselves provide a TTY functionality shall provide a standard non-acoustic connection point for TTYs. Microphones shall be capable of being turned on and off to allow the user to intermix speech with TTY use.
Not Applicable

### (b) Telecommunications products which include voice communication functionality shall support all commonly used cross-manufacturer non-proprietary standard TTY signal protocols.
Not Applicable

### (c) Voice mail, auto-attendant, and interactive voice response telecommunications systems shall be usable by TTY users with their TTYs.
Not Applicable

### (d) Voice mail, messaging, auto-attendant, and interactive voice response telecommunications systems that require a response from a user within a time interval, shall give an alert when the time interval is about to run out, and shall provide sufficient time for the user to indicate more time is required.
Not Applicable

### (e) Where provided, caller identification and similar telecommunications functions shall also be available for users of TTYs, and for users who cannot see displays.
Not Applicable

### (f) For transmitted voice signals, telecommunications products shall provide a gain adjustable up to a minimum of 20 dB. For incremental volume control, at least one intermediate step of 12 dB of gain shall be provided.
Not Applicable

### (g) If the telecommunications product allows a user to adjust the receive volume, a function shall be provided to automatically reset the volume to the default level after every use.
Not Applicable

### (h) Where a telecommunications product delivers output by an audio transducer which is normally held up to the ear, a means for effective magnetic wireless coupling to hearing technologies shall be provided.
Not Applicable

### (i) Interference to hearing technologies (including hearing aids, cochlear implants, and assistive listening devices) shall be reduced to the lowest possible level that allows a user of hearing technologies to utilize the telecommunications product.
Not Applicable

### (j) Products that transmit or conduct information or communication, shall pass through cross-manufacturer, non-proprietary, industry-standard codes, translation protocols, formats or other information necessary to provide the information or communication in a usable format. Technologies which use encoding, signal compression, format transformation, or similar techniques shall not remove information needed for access or shall restore it upon delivery.
Not Applicable

### (k)(1) Products which have mechanically operated controls or keys shall comply with the following: Controls and Keys shall be tactilely discernible without activating the controls or keys.
Not Applicable

### (k)(2) Products which have mechanically operated controls or keys shall comply with the following: Controls and Keys shall be operable with one hand and shall not require tight grasping, pinching, twisting of the wrist. The force required to activate controls and keys shall be 5 lbs. (22.2N) maximum.
Not Applicable

### (k)(3) Products which have mechanically operated controls or keys shall comply with the following: If key repeat is supported, the delay before repeat shall be adjustable to at least 2 seconds. Key repeat rate shall be adjustable to 2 seconds per character.
Not Applicable

### (k)(4) Products which have mechanically operated controls or keys shall comply with the following: The status of all locking or toggle controls or keys shall be visually discernible, and discernible either through touch or sound.
Not Applicable

# Section 1194.24 Video and Multimedia Products
## Voluntary Product Accessibility Template

### (a) All analog television displays 13 inches and larger, and computer equipment that includes analog television receiver or display circuitry, shall be equipped with caption decoder circuitry which appropriately receives, decodes, and displays closed captions from broadcast, cable, videotape, and DVD signals. As soon as practicable, but not later than July 1, 2002, widescreen digital television (DTV) displays measuring at least 7.8 inches vertically, DTV sets with conventional displays measuring at least 13 inches vertically, and stand-alone DTV tuners, whether or not they are marketed with display screens, and computer equipment that includes DTV receiver or display circuitry, shall be equipped with caption decoder circuitry which appropriately receives, decodes, and displays closed captions from broadcast, cable, videotape, and DVD signals.
Not Applicable

* This is a hardware related item that does not apply to Fiddler.

### (b) Television tuners, including tuner cards for use in computers, shall be equipped with secondary audio program playback circuitry.
Not Applicable

* This is a hardware related item that does not apply to Fiddler.

### (c) All training and informational video and multimedia productions which support the agency's mission, regardless of format, that contain speech or other audio information necessary for the comprehension of the content, shall be open or closed captioned.
Does Not Support

* Fiddler Classic demonstration videos [http://www.fiddler2.com/fiddler/help/video/default.asp](http://www.fiddler2.com/fiddler/help/video/default.asp) are not required to use the product, and are not currently closed-captioned.

### (d) All training and informational video and multimedia productions which support the agency's mission, regardless of format, that contain visual information necessary for the comprehension of the content, shall be audio described.
Does Not Support

* Fiddler Classic demonstration videos [http://www.fiddler2.com/fiddler/help/video/default.asp](http://www.fiddler2.com/fiddler/help/video/default.asp) are not required to use the product, and are not currently closed-captioned.
* The majority of their content is available in textual form elsewhere in the Help.

### (e) Display or presentation of alternate text presentation or audio descriptions shall be user-selectable unless permanent.
Not Applicable

# Section 1194.25 Self-Contained, Closed Products - Detail
## Voluntary Product Accessibility Template

### (a) Self contained products shall be usable by people with disabilities without requiring an end-user to attach Assistive Technology to the product. Personal headsets for private listening are not Assistive Technology.
Not Applicable

### (b) When a timed response is required, the user shall be alerted and given sufficient time to indicate more time is required.
Not Applicable

### (c) Where a product utilizes touch screens or contact-sensitive controls, an input method shall be provided that complies with §1194.23 (k) (1) through (4).
Not Applicable

### (d) When biometric forms of user identification or control are used, an alternative form of identification or activation, which does not require the user to possess particular biological characteristics, shall also be provided.
Not Applicable

### (e) When products provide auditory output, the audio signal shall be provided at a standard signal level through an industry standard connector that will allow for private listening. The product must provide the ability to interrupt, pause, and restart the audio at anytime.
Not Applicable

### (f) When products deliver voice output in a public area, incremental volume control shall be provided with output amplification up to a level of at least 65 dB. Where the ambient noise level of the environment is above 45 dB, a volume gain of at least 20 dB above the ambient level shall be user selectable. A function shall be provided to automatically reset the volume to the default level after every use.
Not Applicable

### (g) Color coding shall not be used as the only means of conveying information, indicating an action, prompting a response, or distinguishing a visual element.
Not Applicable

### (h) When a product permits a user to adjust color and contrast settings, a range of color selections capable of producing a variety of contrast levels shall be provided.
Not Applicable

### (i) Products shall be designed to avoid causing the screen to flicker with a frequency greater than 2 Hz and lower than 55 Hz.
Not Applicable

### (j) (1) Products which are freestanding, non-portable, and intended to be used in one location and which have operable controls shall comply with the following: The position of any operable control shall be determined with respect to a vertical plane, which is 48 inches in length, centered on the operable control, and at the maximum protrusion of the product within the 48 inch length on products which are freestanding, non-portable, and intended to be used in one location and which have operable controls.
Not Applicable

### (j)(2) Products which are freestanding, non-portable, and intended to be used in one location and which have operable controls shall comply with the following: Where any operable control is 10 inches or less behind the reference plane, the height shall be 54 inches maximum and 15 inches minimum above the floor.
Not Applicable

### (j)(3) Products which are freestanding, non-portable, and intended to be used in one location and which have operable controls shall comply with the following: Where any operable control is more than 10 inches and not more than 24 inches behind the reference plane, the height shall be 46 inches maximum and 15 inches minimum above the floor.
Not Applicable

### (j)(4) Products which are freestanding, non-portable, and intended to be used in one location and which have operable controls shall comply with the following: Operable controls shall not be more than 24 inches behind the reference plane.
Not Applicable

# Section 1194.26 Desktop and Portable Computers - Detail
## Voluntary Product Accessibility Template

### (a) All mechanically operated controls and keys shall comply with §1194.23 (k) (1) through (4).
Not Applicable

### (b) If a product utilizes touch screens or touch-operated controls, an input method shall be provided that complies with §1194.23 (k) (1) through (4).
Not Applicable

### (c) When biometric forms of user identification or control are used, an alternative form of identification or activation, which does not require the user to possess particular biological characteristics, shall also be provided.
Not Applicable

### (d) Where provided, at least one of each type of expansion slots, ports and connectors shall comply with publicly available industry standards
Not Applicable

# Section 1194.31 Functional Performance Criteria - Detail
## Voluntary Product Accessibility Template

### (a) At least one mode of operation and information retrieval that does not require user vision shall be provided, or support for Assistive Technology used by people who are blind or visually impaired shall be provided.
Supports with Exceptions

* Fiddler Classic Supports the use of assistive technology, such as screen readers, for access by people who are blind or visually impaired, except as noted in the Remarks section.
* Fiddler Classic provides keyboard accessibility through keyboard shortcuts, access keys and TAB order to all significant features so use of a mouse is not required to be productive with the software.
* Documentation on Keyboard Shortcut keys are listed on http://www.fiddler2.com/fiddler/help/keyboard.asp.

Exceptions

* Not all available plugins support assistive technologies.

### (b) At least one mode of operation and information retrieval that does not require visual acuity greater than 20/70 shall be provided in audio and enlarged print output working together or independently, or support for Assistive Technology used by people who are visually impaired shall be provided.
Supports

* Fiddler Classic supports font sizing using the Tools / Fiddler Classic Options command.

### (c) At least one mode of operation and information retrieval that does not require user hearing shall be provided, or support for Assistive Technology used by people who are deaf or hard of hearing shall be provided
Supports

* Fiddler Classic does not use audio in any meaningful way.

### (d) Where audio information is important for the use of a product, at least one mode of operation and information retrieval shall be provided in an enhanced auditory fashion, or support for assistive hearing devices shall be provided.
Supports

* Fiddler Classic does not use audio in any meaningful way.

### (e) At least one mode of operation and information retrieval that does not require user speech shall be provided, or support for Assistive Technology used by people with disabilities shall be provided.
Not Applicable

* Fiddler Classic does not require the use of speech for any functionality.

### (f) At least one mode of operation and information retrieval that does not require fine motor control or simultaneous actions and that is operable with limited reach and strength shall be provided.
Supports with Exceptions

* Fiddler Classic supports the use of assistive technology such as voice recognition and alternative input devices for people who have reduced motor skills/coordination, with the exceptions listed in the Remarks section.
* Fiddler Classic provides keyboard accessibility through keyboard shortcuts, access keys and TAB order to all significant features so use of a mouse is not required to be productive with the software.
* Documentation on Keyboard Shortcut keys are listed on http://www.fiddler2.com/fiddler/help/keyboard.asp.
* Fiddler Classic supports operating system keyboard assistance features to complement keyboard accessibility to facilitate the use of alternative input devices and to assist users who do not have the need for assistive technology but have reduced motor skills/coordination. These features include StickyKeys, FilterKeys, Mouse Keys, SerialKeys and ToggleKeys which are provided by the Windows operating system itself, as well as all applications that are installed on the Windows operating system. The recommended Operating System for Fiddler Classic is Windows XP and later.

Exceptions

* Fiddlers support for voice recognition and alternative input devices can be limited as reason stated in section 1194.21 (a)

# Section 1194.41 Information, Documentation, and Support - Detail
## Voluntary Product Accessibility Template

### Section 1194.41 (a) Product Support Documentation provided to end-users shall be made available in alternate formats upon request, at no additional charge.
Supported - [http://www.fiddler2.com/fiddler/help/](http://www.fiddler2.com/fiddler/help/)

### Section 1194.41 (b) End-users shall have access to a description of the accessibility and compatibility features of products in alternate formats or alternate methods upon request, at no additional charge.
Supports with Exceptions - [http://www.fiddler2.com/fiddler/help/keyboard.asp](http://www.fiddler2.com/fiddler/help/keyboard.asp) provides keyboard reference

### 1194.41 (c) Support services for products shall accommodate the communication needs of end-users with disabilities.
Supports with Exceptions - Support via Web Discussions and email is available in the Product Help menu.

#### This document is for informational purposes only. Telerik and Eric Lawrence make no warranties, express implied or statuatory, in this document. Please feel free to send any feedback using the "Contact" link at www.fiddler2.com.
