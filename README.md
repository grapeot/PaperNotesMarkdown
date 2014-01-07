# Yan's paper notes tool

This is a small tool used to generate "pretty" paper notes from pure Markdown.

## Usage

A simple coffee script is provided to generate (and host) an html file from the Markdown files. A sample deployment script is like:

```bash
sudo apt-get install nodejs npm coffeescript
npm install
```

And to use the tool, simply

```bash
coffee app
open index.html # if you want to directly view it in the local browser
coffee app host # if you wish to host at :8080 to share with others
mkdir PaperNotes; cp *.png *.html PaperNotes;  # if you wish to copy the output to someone. Assume only png figures are used.
```

## Special syntax for Markdown

This small tool also supports [MathJax](http://www.mathjax.org/), which means you can also surround your `tex` code in the Markdown files with `$$` and they will be rendered as equations.
