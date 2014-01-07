markdown = require( "markdown" ).markdown
fs = require('fs')
_ = require('underscore')

# convert the markdown to html
content = _.chain(fs.readdirSync('.'))
    .filter((fn) -> /.*\.md$/.exec(fn) != null)
    .filter((fn) -> fn != 'README.md')
    .map((fn) -> 
        c = fs.readFileSync(fn, 'utf-8')
        c = c.replace(/(\$\$.*?\$\$)/g, ' `$1` ') # tweak for the equations
        c = markdown.toHTML(c)
        c = c.replace(/<code>\$/g, '$').replace(/\$<\/code>/g, '\$')
    )
    .reduce(((acc, c) -> acc + c), '')
    .value()

# render the template
template = "
<html>
    <head>
        <style>
            img { max-width: 400px; display: block; margin-left: auto; margin-right: auto }
            body { max-width: 800px; margin: 0 auto; }
        </style>
        <script type=\"text/javascript\" src=\"http://cdn.mathjax.org/mathjax/latest/MathJax.js?config=TeX-AMS-MML_SVG\"></script>
        <script type=\"text/x-mathjax-config\">
            MathJax.Hub.Config({
                  tex2jax: {inlineMath: [['$$','$$']], displayMath: []}
            });
        </script>
    <head>
    <body>
        <%= content %>
    </body>
</html>
"
htmlContent = _.template(template, { content: content })
fs.writeFileSync('index.html', htmlContent)
