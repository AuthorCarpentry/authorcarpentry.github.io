#
# Simple Makefile for generate website with shorthand and md2slides
#
build: *.md
	./mk-website.bash

save:
	./mk-website.bash
	git commit -am "Quick Save"
	git push origin master

website:
	./mk-website.bash

publish:
	./publish.bash

