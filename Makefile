test:
	npx eslint --color --quiet *.js
	node --pending-deprecation --trace-deprecation --throw-deprecation --trace-warnings test.js

publish:
	git push -u --tags origin master
	npm publish

update:
	npx updates -u
	rm -rf node_modules
	npm i --no-package-lock

patch:
	$(MAKE) test
	npx ver patch
	$(MAKE) publish

minor:
	$(MAKE) test
	npx ver minor
	$(MAKE) publish

major:
	$(MAKE) test
	npx ver major
	$(MAKE) publish

.PHONY: test publish update patch minor major
