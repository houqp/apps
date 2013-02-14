firefox_bin=/usr/bin/firefox
chrome_bin=/usr/bin/chromium
coffee=$(CURDIR)/node_modules/coffee-script/bin/coffee

all: compile

deps:
	cd $(CURDIR)
	npm install --deps

watch: compile
	$(coffee) --compile --watch --output $(CURDIR)/build/app app/ & \
	$(coffee) --compile --watch --output $(CURDIR)/build/tests tests/ & \
	$(CURDIR)/node_modules/.bin/grunt --config $(CURDIR)/Gruntfile.coffee run

test:
	export CHROME_BIN=$(chrome_bin) && export FIREFOX_BIN=$(firefox_bin) && \
	$(CURDIR)/node_modules/.bin/grunt --config $(CURDIR)/Gruntfile.coffee testacular

compile:
	mkdir -p $(CURDIR)/build/app
	mkdir -p $(CURDIR)/build/tests
	$(coffee) --compile --output $(CURDIR)/build/app app/
	$(coffee) --compile --output $(CURDIR)/build/tests tests/
	$(CURDIR)/node_modules/.bin/grunt --config $(CURDIR)/Gruntfile.coffee compile

ci: compile
	export PHANTOMJS_BIN=$(CURDIR)/node_modules/phantomjs/bin/phantomjs && \
	$(CURDIR)/node_modules/.bin/grunt --config $(CURDIR)/Gruntfile.coffee ci

clean:
	rm -rf $(CURDIR)/build
	rm -rf $(CURDIR)/test-results.xml
