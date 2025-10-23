---
title: Inspect DataURI Object
description: "Convert sessions to Data URI format in Fiddler Classic - embed HTTP response content as inline URIs for sharing and testing."
slug: DataURI
publish: true
position: 15
previous_url: /tasks/datauri
---

# Inspect DataURI Object

To inspect a DataURI object:

1. Copy a [DataURI](https://en.wikipedia.org/wiki/Data_URI_scheme) to your clipboard from Fiddler Classic or any other source.
    ![Copy DataURI](./images/CopyDataURI.png)
2. Click **Edit > Paste Files as Sessions**. Fiddler Classic will parse the DataURI and create a new Session for it in the **Web Sessions List**.
    ![Paste Files as Sessions](./images/PasteFiles.png)
3. [Use Fiddler Classic inspectors](slug://ViewSessionContent) to examine the resulting object.
    ![Inspect Object](./images/InspectObject.png)
