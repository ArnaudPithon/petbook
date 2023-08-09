backdir := back
frontdir := front

MAKE = /usr/bin/make

all: back front

init: back-init front-init

back-init:
	$(MAKE) -C $(backdir) init

front-init:
	$(MAKE) -C $(frontdir) init

.PHONY: install init all start database tables populate
