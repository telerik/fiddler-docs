---
title: View Web Session Content
slug: ViewSessionContent
publish: true
position: 4
previous_url: /observe-traffic/tasks/viewsessioncontent
---

# View Web Session Content

To view the content of a web session in a variety of formats:

1. Click on a web session in the **Web Sessions List**.
    ![Web Session List](./images/SessionsList.png)
2. Click the **Inspectors** tab.
    ![Inspectors Tab](./images/Inspectors.png)

## Supported Content Encodings

Fiddler Classic automatically decompresses response bodies encoded with the following `Content-Encoding` values:

* **gzip**
* **deflate**
* **br** (Brotli)
* **zstd** (Zstandard) — supported in Fiddler Classic v6.0.20261 and later. Chrome and Edge advertise `zstd` in the `Accept-Encoding` request header by default; Fiddler Classic can transparently decompress such responses so the body is readable in the Inspectors tab.
