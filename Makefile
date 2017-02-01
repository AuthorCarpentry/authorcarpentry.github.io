#
# Simple Makefile for generate website with shorthand and md2slides
#

BRANCH = $(shell git branch | grep '* ' | cut -d\  -f 2)

build: *.md
	./mk-website.bash

status:
	git status

save:
	./mk-website.bash
	git commit -am "Quick Save"
	git push origin $(BRANCH)

website:
	./mk-website.bash

publish:
	./publish.bash

