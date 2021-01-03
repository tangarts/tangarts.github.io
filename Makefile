PY?=python3
PELICAN?=pelican
PELICANOPTS=

BASEDIR=$(CURDIR)
INPUTDIR=$(BASEDIR)/content
OUTPUTDIR=$(BASEDIR)/output
CONFFILE=$(BASEDIR)/pelicanconf.py
PUBLISHCONF=$(BASEDIR)/publishconf.py

GITHUB_PAGES_BRANCH=gh-pages
PAGESDIR=$(INPUTDIR)/pages
DATE := $(shell date +'%Y-%m-%d %H:%M:%S')
SLUG := $(shell echo '${NAME}' | sed -e 's/[^[:alnum:]]/-/g' | tr -s '-' | tr A-Z a-z)
EXT ?= md


DEBUG ?= 0
ifeq ($(DEBUG), 1)
	PELICANOPTS += -D
endif

RELATIVE ?= 0
ifeq ($(RELATIVE), 1)
	PELICANOPTS += --relative-urls
endif

help:
	@echo 'Makefile for a pelican Web site                                             '
	@echo '                                                                            '
	@echo 'Usage:                                                                      '
	@echo '   make html                           (re)generate the web site            '
	@echo '   make clean                          remove the generated files           '
	@echo '   make regenerate                     regenerate files upon modification   '
	@echo '   make publish                        generate using production settings   '
	@echo '   make serve [PORT=8000]              serve site at http://localhost:8000  '
	@echo '   make serve-global [SERVER=0.0.0.0]  serve (as root) to $(SERVER):80      '
	@echo '   make devserver [PORT=8000]          serve and regenerate together        '
	@echo '   make ssh_upload                     upload the web site via SSH          '
	@echo '   make rsync_upload                   upload the web site via rsync+ssh    '
	@echo '   make github                         upload the web site via gh-pages     '
	@echo '   make newpost                        create new post in content directory ' 
	@echo '   make editpost                       edit post in content directory       '
	@echo '   make newpage                        create new page in content directory '
	@echo '   make editpage                       edit new page in content directory   '
	@echo '                                                                            '
	@echo 'Set the DEBUG variable to 1 to enable debugging, e.g. make DEBUG=1 html     '
	@echo 'Set the RELATIVE variable to 1 to enable relative urls                      '
	@echo '                                                                            '

html:
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)
	
clean:
	[ ! -d $(OUTPUTDIR) ] || rm -rf $(OUTPUTDIR)

regenerate:
	$(PELICAN) -r $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)

serve:
ifdef PORT
	$(PELICAN) -l $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS) -p $(PORT)
else
	$(PELICAN) -l $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)
endif

serve-global:
ifdef SERVER
	$(PELICAN) -l $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS) -p $(PORT) -b $(SERVER)
else
	$(PELICAN) -l $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS) -p $(PORT) -b 0.0.0.0
endif

devserver:
ifdef PORT
	$(PELICAN) -lr $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS) -p $(PORT)
else
	$(PELICAN) -lr $(INPUTDIR) -o $(OUTPUTDIR) -s $(CONFFILE) $(PELICANOPTS)
endif

publish:
	$(PELICAN) $(INPUTDIR) -o $(OUTPUTDIR) -s $(PUBLISHCONF) $(PELICANOPTS)

ssh_upload: publish
	scp -P $(SSH_PORT) -r $(OUTPUTDIR)/* $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR)

rsync_upload: publish
	rsync -e "ssh -p $(SSH_PORT)" -P -rvzc --delete $(OUTPUTDIR)/ $(SSH_USER)@$(SSH_HOST):$(SSH_TARGET_DIR) --cvs-exclude

github: publish
	ghp-import -m "Generate Pelican site" -b $(GITHUB_PAGES_BRANCH) $(OUTPUTDIR)
	git push origin $(GITHUB_PAGES_BRANCH)

newpost:
ifdef NAME
	echo "---" 		 >  $(INPUTDIR)/$(SLUG).$(EXT)
	echo "title: $(NAME)"    >> $(INPUTDIR)/$(SLUG).$(EXT)
	echo "slug: $(SLUG)"     >> $(INPUTDIR)/$(SLUG).$(EXT)
	echo "date: $(DATE)"     >> $(INPUTDIR)/$(SLUG).$(EXT)
	echo "modified: $(DATE)" >> $(INPUTDIR)/$(SLUG).$(EXT)
	echo "status: "          >> $(INPUTDIR)/$(SLUG).$(EXT)
	echo "---"               >> $(INPUTDIR)/$(SLUG).$(EXT)
	echo ""                  >> $(INPUTDIR)/$(SLUG).$(EXT)
	echo ""                  >> $(INPUTDIR)/$(SLUG).$(EXT)
	${EDITOR} ${INPUTDIR}/${SLUG}.${EXT}
else
	@echo 'Variable NAME is not defined.'
	@echo 'Do make newpost NAME='"'"'Post Name'"'"
endif

editpost:
ifdef NAME
	${EDITOR} ${INPUTDIR}/${SLUG}.${EXT}
else
	@echo 'Variable NAME is not defined.'
	@echo 'Do make editpost NAME='"'"'Post Name'"'"
endif

newpage:
ifdef NAME
	echo "title: $(NAME)" >  $(PAGESDIR)/$(SLUG).$(EXT)
	echo "slug: $(SLUG)" >> $(PAGESDIR)/$(SLUG).$(EXT)
	echo "status: "     >> $(INPUTDIR)/$(SLUG).$(EXT)
	echo ""              >> $(PAGESDIR)/$(SLUG).$(EXT)
	echo ""              >> $(PAGESDIR)/$(SLUG).$(EXT)
	${EDITOR} ${PAGESDIR}/${SLUG}.$(EXT)
else
	@echo 'Variable NAME is not defined.'
	@echo 'Do make newpage NAME='"'"'Page Name'"'"
endif

editpage:
ifdef NAME
	${EDITOR} ${PAGESDIR}/${SLUG}.$(EXT)
else
	@echo 'Variable NAME is not defined.'
	@echo 'Do make editpage NAME='"'"'Page Name'"'"
endif

.PHONY: html help clean regenerate serve serve-global devserver stopserver publish ssh_upload rsync_upload github
