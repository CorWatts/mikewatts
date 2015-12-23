MAIN=.
src=$(MAIN)/dev
materialize = $(MAIN)/node_modules/materialize-css
uglifydir = $(MAIN)/node_modules/uglifyjs/bin
nodesassdir = $(MAIN)/node_modules/node-sass/bin

all: css/app.css js/app.js fonts/*

css/app.css:
	$(nodesassdir)/node-sass --output-style compressed $(src)/app.scss > $(MAIN)/css/app.css

js/app.js:
	$(uglifydir)/uglifyjs $(materialize)/bin/materialize.js $(src)/app.js > $(MAIN)/js/app.js
	cp -r $(src)/audiojs $(MAIN)/js/audiojs

fonts/*:
	cp $(materialize)/font/roboto/* $(MAIN)/font/roboto/

clean:
	rm -rf $(MAIN)/css/*
	rm -rf $(MAIN)/js/*
	rm -rf $(MAIN)/fonts/*

build: movecss movejs movefonts

movecss:
	$(nodesassdir)/node-sass $(src)/app.scss > $(MAIN)/css/app.css

movejs:
	cat $(materialize)/bin/materialize.js $(src)/app.js > $(MAIN)/js/app.js
	cp -r $(src)/audiojs $(MAIN)/js/audiojs

movefonts:
	cp $(materialize)/font/roboto/* $(MAIN)/font/roboto/
