firefox_bin=/usr/bin/firefox
chrome_bin=/usr/bin/chromium

all: compile ci

deps:
	cd $(CURDIR)
	npm install --deps

watch: compile
	export CHROME_BIN=$(chrome_bin) && export FIREFOX_BIN=$(firefox_bin) && \
	$(CURDIR)/node_modules/.bin/grunt --config $(CURDIR)/Gruntfile.coffee testacular & \
	$(CURDIR)/node_modules/.bin/grunt --config $(CURDIR)/Gruntfile.coffee run

compile:
	mkdir -p $(CURDIR)/build
	$(CURDIR)/node_modules/.bin/grunt --config $(CURDIR)/Gruntfile.coffee compile

ci:
	export PHANTOMJS_BIN=$(CURDIR)/node_modules/phantomjs/bin/phantomjs && \
	$(CURDIR)/node_modules/.bin/grunt --config $(CURDIR)/Gruntfile.coffee ci

clean:
	rm -rf $(CURDIR)/build
