MODULES = express ejs dotenv
MODULES_DEV = nodemon

nope:
	@echo 'Do nothing !'

all: install

init: package.json
	mkdir -p views/partials

package.json:
	pnpm init

install: package.json
	pnpm install $(MODULES)
	pnpm install -D $(MODULES_DEV)

start:
	npm start

.PHONY: install init all start nope
