---
title: Fiddler Public Documentation Repo
slug: root-readme
publish: false
---

# Fiddler Public Documentation

Welcome to the GitHub repo for [Fiddler](http://www.fiddler2.com) [Documentation](http://www.fiddler2.com/docs/). This repository contains the source content--written in Markdown--that we use to power the Fiddler Documentation at [www.fiddler2.com/docs](http://www.fiddler2.com/docs). If you've arrived here wanting to search and peruse our docs, you'd be better served heading over to [www.fiddler2.com/docs](http:\\www.fiddler2.com/docs) where our content is prettified and searchable. 

We believe that the documentation for a product is at its best when the content is a collaboration between the builders and consumers of that product. As such, this documentation is both public, and open sourced. That means you can clone this repository, read the docs off line, or even load the entire thing to an Apple Newton, if that's your thing.

It also means that you can play a role in making our docs better for everyone, and if helping us make the Fiddler docs better sounds interesting to you, read on.

## Contributing

There are two ways you can contribute to the public Fiddler documentation: either create an issue in this repository, or fork the repo, make the change and send us a pull request!

* **Create an issue** - If you find an issue with our docs that needs to be addressed, the best way to let us know about it is by [creating an issue in this repository](https://github.com/telerik/fiddler-docs/issues?state=open). When creating an issue, provide a descriptive title, be as specific as possible and link to the document in question (If you can provide a link to the closest anchor to the issue, all the better). Here's an example:

		Title: foo/bar/setting-things-up.md is missing an image
		Description: The image for setting up the the foobar handler is missing. https://github.com/telerik/fiddler-docs/issues?state=open
 
> Note: When creating issues, please don't modify the assignee or milestone fields. Also, please create one issue per fix or change. "Bundled" entries will be deleted.

* **Send us a pull request** - Creating an issue is great--and we certainly appreciate them--but what we really love are pull requests. So, if you find an issue in the docs, or even feel like creating new content, we'd be happy to have your contributions! If you're just getting started with open source, Git, and GitHub, we suggest you first read up on [forking repos](https://help.github.com/articles/fork-a-repo) and [sending pull requests](https://help.github.com/articles/using-pull-requests), both great articles from the GitHub bootcamp.  
	
	Once you've read these--or you've already memorized them--you're ready to contribute to the Fiddler docs. Start by creating a local clone of our repo either using [GitHub for Windows](http://windows.github.com/), [GitHub for Mac](http://mac.github.com/) or your friendly command-line:

		git clone git@github.com:telerik/fiddler-docs.git

	Then, open up the fiddler-docs folder in your favorite text editor and contribute away! Of course, as you work with the docs, we do ask that you follow a couple of ground rules:

	- Fixing grammar, punctuation, and other general errors is always appreciated. So are changes that expand on key ideas or correct errors in logic phrasing or otherwise. If your ambitions are greater, however, and you want to add completely new content to the site--like a new tutorial on using Fiddler with an Atari 2600, for instance--we suggest you contact a member of the team first (or enter an issue!) to vet your idea. We would all be happy to hear your idea and offer advice.
	- Each document in this repo contains a section of YAML Front Matter at the very top. This content, which looks like the text below, is used by our auto-import tool when content is processed for the [www.fiddler2.com/docs](http://www.fiddler2.com/docs) site. Please don't edit the content in this section of a document.

		---
		
		title: Add stuff to Fiddler
		
		slug: howto-add-stuff
		
		tags: How-To

		publish: true
		
		---

	- When adding content or making changes, please use only standard Markdown syntax, and make sure to preview your additions or changes before sending us a pull request. 

	Once you've made your changes, commit, pull, merge, push, and [send us a pull request](https://help.github.com/articles/using-pull-requests)! We--and Fiddler users everywhere--thank you for making our docs better! 
