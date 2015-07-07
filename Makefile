BIN=node_modules/.bin

MOCHA_ARGS= --compilers js:babel/register \
		--recursive \
		--require src/__tests__/init.js
MOCHA_TARGET=src/**/*-test.js

build:
	$(BIN)/babel src --out-dir lib
	mv lib/react.js react.js

clean:
	rm -rf lib
	rm -f react.js

test: lint
	NODE_ENV=test $(BIN)/mocha $(MOCHA_ARGS) $(MOCHA_TARGET)

test-watch: lint
	NODE_ENV=test $(BIN)/mocha $(MOCHA_ARGS) -w $(MOCHA_TARGET)

lint:
	$(BIN)/eslint src

PHONY: build clean test test-watch lint
