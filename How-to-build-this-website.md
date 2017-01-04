

# How to build this website

These are instructions for generate [caltechlibrary.github.io/AuthorCarpentry](https://caltechlibrary.github.io/AuthorCarpentry) website.
This is includes content in the [CODATA-RDA](CODATA-RDA/) folder.

## One time setup

### Prerequisites

This website is built using several command line tools developed at Caltech. They are

+ [mkpage](https://caltechlibrary.github.io/mkpage) - renders the website from Markdown files using template page.tmpl
    + [installation instructions](https://caltechlibrary.github.io/mkpage/install.html)
+ [md2slides](https://caltechlibrary.github.io/md2slides) - (optional) is a markdown to HTML slide converter
    + [installation instructions](https://caltechlibrary.github.io/md2slides/install.html)
+ [ws](https://caltechlibrary.github.io/ws) - (optional) is a static web server you can use to view your site while you're writing it
    + [installation instructions](https://caltechlibrary.github.io/ws/install.html)

Installation instructions for these utilities are available for Mac OS X, Windows 10, Ubuntu/Linux and Raspbian/Linux operating systems.


### On Windows

If you are on a Windows machine running Bash that comes with Git clone this repository

+ Start Bash
+ clone this repository
+ change to the repository directory
+ and you're ready to regenerate the website

These are the command I'd enter in Bash

```shell
    git clone https://github.com/caltechlibrary/AuthorCarpentry
    cd AuthorCarpentry
    ./mk-website.bash
```

You should now be able run the [mkpage](https://caltechlibrary.github.io/mkpage) command using the *./mk-website.bash* script should work.

### On a Mac

+ Open the Terminal application
+ clone this repository
+ change to the repository folder
+ and you're ready to regenerate the website

These are the command I enter after starting Terminal

```shell
    git clone https://github.com/caltechlibrary/AuthorCarpentry
    cd AuthorCarpentry
    ./mk-website.bash
```

You should now be able run the [mkpage](https://caltechlibrary.github.io/mkpage) command and the *./mk-website.bash* script should work.

---


## On going work

Once you have your repositories cloned on going authoring is a little easier. When you start
your Bash session you source the appropriate setup file and then you can get to work.

### Workflow for Mac, Windows and Linux

You need to let Bash know where to find *shorthand*. The easiest way is 

1. Start Bash (on a Mac you launch the "Terminal" application)
2. Change to your repository directory

Then you're in the repository directory in Bash do

```shell
    cd AuthorCarpentry
    ./mk-website.bash
```

You should be ready to continue working. The workflow is

+ edit markdown files in a text editor
+ run 
    + `./mk-website.bash`
+ check the HTML (e.g. view them in your web browser)
    + the [ws](https://caltechlibrary.github.io/ws) web server is a convient way to make this happen
    + you can also just do a "file open" from your web browser on the individual HTML files
+ make edits, rerun 
    + `./mk-website.bash`
    + repeat steps as needed

When you have the site the way you want it you can run the `./publish.bash` script. This copies updates the contents of the *gh-pages* branch based on the current *master* branch.

If you've forked the AuthorCarpentry repository from https://github.com/caltechlibrary/AuthorCarpentry you can submit a pull request.

#### Workflow steps

1. Create, write and edit your content in Markdown files
2. For each level of the website you can customize the navigation links in *nav.md* as need
    + e.g. add additional links to pages or lessons
3. In the root of your repository directory run `./mk-website.bash` to re-generate all the HTML content from your markdown
4. Check the HTML versions and see if they are what you like
    + e.g. ws
5. repeat from 2 as needed
6. Commit your changes master
7. Push your changes to master
8. When you're ready to publish run the publish script
    + ./publish.bash


---

## How it works

The website is being generated using a tool call [mkpage](https://caltechlibrary.github.io/mkpage). It renders plain text, Markdown 
and JSON using a simple template engine developed at Google.  Typical you need very few templates to build a website (this site 
needed only one). Layout is controlled from CSS as well as the markup in your template. *mkpage* is very friendly to Bash scripts
and `./mk-website.bash` is a good example of using a *mkpage* and common Unix command in a simple Bash script to render a 
multi-directory website.

When you commit and push your changes to Github's gh-pages branch then your website hosted at Github updates. This lets you iterate
easily working on the website without disruption to the public. When everything checks out the way you want, push your changes to 
the *master* branch, pull *master* into the *gh-pages* branch and push those up to Github's *gh-pages* branch. There is an easy
to use script call `./publish.bash` so you don't have to remember those details.

