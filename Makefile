REPORTER = spec

test:
	@NODE_ENV=test ./node_modules/.bin/mocha test/*-test.js $(OPT) --reporter $(REPORTER)

test-bail:
	$(MAKE) test OPT=--bail

test-cov:
	$(MAKE) lib-cov
	@APISERVER_ROUTER_COV=1 $(MAKE) test REPORTER=html-cov > coverage.html
	@open -g coverage.html

lib-cov:
	@rm -rf lib-cov
	@jscoverage lib lib-cov

.PHONY: test test-ba test-cov lib-cov