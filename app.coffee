markdown = require( "markdown" ).markdown
fs = require('fs')
_ = require('underscore')

# convert the markdown to html
content = _.chain(fs.readdirSync('.'))
    .filter((fn) -> /.*\.md$/.exec(fn) != null)
    .filter((fn) -> fn != 'README.md')
    .map((fn) -> markdown.toHTML(fs.readFileSync(fn, 'utf-8')))
    .reduce(((acc, c) -> acc + c), '')
    .value()
    
# render the template
template = "
<html>
    <head>
        <style>
            img { max-width: 400px }
        </style>
    <head>
    <body>
        <%= content %>
    </body>
</html>
"
htmlContent = _.template(template, { content: content })
fs.writeFileSync('index.html', htmlContent)
