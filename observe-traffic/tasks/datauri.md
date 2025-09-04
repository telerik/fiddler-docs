---
title: Inspect DataURI Object
description: "Convert sessions to Data URI format in Fiddler Classic - embed HTTP response content as inline URIs for sharing and testing."
slug: DataURI
publish: true
position: 15
---

Inspect DataURI Object
======================

To inspect a DataURI object:

1. Copy a [DataURI][1] to your clipboard from Fiddler Classic or any other source.

 ![Copy DataURI][2]

2. Click **Edit > Paste Files as Sessions**].

 ![Paste Files as Sessions][3]

 Fiddler Classic will parse the DataURI and create a new Session for it in the **Web Sessions List**.

3. [Use Fiddler Classic inspectors][4] to examine the resulting object.

 ![Inspect Object][5]

[1]: https://en.wikipedia.org/wiki/Data_URI_scheme
[2]: ../../images/DataURI/CopyDataURI.png
[3]: ../../images/DataURI/PasteFiles.png
[4]: ./ViewSessionContent
[5]: ../../images/DataURI/InspectObject.png