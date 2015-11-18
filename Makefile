SLIDES_MD = presentation.md
GENERATED_SLIDES = index.html

PWD = $(shell pwd)
SHELL = /bin/bash

REVEALJS_VERSION = 2.6.2
REVEALJS_DIR = reveal.js
REVEALJS_FILENAME = $(REVEALJS_VERSION).tar.gz
REVEALJS_THEME = solarized
REVEALJS_THEME_URL = https://gist.github.com/shamrt/109d01b5e99812722002/download
REVEALJS_THEME_DIR = $(REVEALJS_DIR)/css/theme

REMOTE_HOST = [update with server hostname]
REMOTE_DIR = [update with remote directory]

default: slideshow

init: mkdir get_revealjs

mkdir:
	mkdir -p cache

get_revealjs:
	@echo "Downloading reveal.js to cache ..."
	wget --no-verbose --directory-prefix=cache \
		https://github.com/hakimel/reveal.js/archive/$(REVEALJS_FILENAME)

	@echo "Unpacking reveal.js ..."
	tar -x -f cache/$(REVEALJS_FILENAME) -C .
	mv ./reveal.js-$(REVEALJS_VERSION) ./$(REVEALJS_DIR)

slideshow:
	pandoc --standalone --smart --to=revealjs \
		--variable revealjs-url:. \
		--variable theme:$(REVEALJS_THEME) \
		--variable center:false \
		 $(SLIDES_MD) -o $(REVEALJS_DIR)/$(GENERATED_SLIDES)

sync:
	rsync \
		-au --progress --compressed \
		$(GENERATED_SLIDES) \
		$(REMOTE_HOST):$(REMOTE_DIR)/.
