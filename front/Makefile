NPM = pnpm

MODULES = express dotenv
MODULES_DEV = nodemon

all:

init: views/partials get-modules

views/partials:
	mkdir -p $@

package.json:
	$(NPM) init

get-modules: package.json
	$(NPM) install $(MODULES)
	$(NPM) install -D $(MODULES_DEV)

start:
	$(NPM) start

.PHONY: init all start
