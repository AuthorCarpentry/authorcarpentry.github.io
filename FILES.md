
# Description of files and organization

+ \*.tmpl are [mkpage](https://caltechlibrary.github.io/mkpage) templates for render markdown content into specific HTML pages
+ \*.bash are scripts for managing website
+ \*.md are our markdown files
+ css/\* holds our website css files (lesssons or subfolder may have their own css associated with them)
+ assets/* holds any media assets like image files, logos and such used in the website
+ js/* holds any sitewide JavaScripts files

## special handling 

The following files have a special handline

+ *README.md* becomes *index.html*
+ *nav.md* never renders its own html file as it is included by the mkpage template

