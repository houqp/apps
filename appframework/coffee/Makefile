all: compile


deps:
	cd $(CURDIR)
	npm install --save-dev

watch: compile
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
