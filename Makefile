SRC = $(shell find lib -type f -name "*.js")
TESTS = test/*.js
TESTTIMEOUT = 10000
REPORTER = spec

test:
	@NODE_ENV=test ./node_modules/mocha/bin/mocha \
		--reporter $(REPORTER) --timeout $(TESTTIMEOUT) $(TESTS)

test-cov: lib-cov
	@JSCOV=1 $(MAKE) test REPORTER=html-cov > coverage.html && open coverage.html

lib-cov:
	@rm -rf ./$@
	@jscoverage lib $@

clean:
	rm -rf lib-cov
	rm -f coverage.html

.PHONY: test test-cov lib-cov clean
