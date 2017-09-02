main=.
src=$(main)/dev
materialize = $(main)/node_modules/materialize-css
#uglifydir = $(main)/node_modules/.binuglifyjs/bin
nodesassdir = $(main)/node_modules/node-sass/bin

all: css/app.css js/app.js fonts/*
build: movecss movejs movefonts

# compile & minify shiz
css/app.css:
	$(nodesassdir)/node-sass --output-style compressed $(src)/app.scss > $(main)/css/app.css

js/app.js:
	npx uglifyjs $(materialize)/bin/materialize.js $(src)/app.js > $(main)/js/app.js
	cp -r $(src)/audiojs $(main)/js/audiojs

fonts/*:
	cp $(materialize)/fonts/roboto/* $(main)/font/roboto/

# compile but don't minify shiz
movecss:
	$(nodesassdir)/node-sass $(src)/app.scss > $(main)/css/app.css

movejs:
	cat $(materialize)/bin/materialize.js $(src)/app.js > $(main)/js/app.js
	cp -r $(src)/audiojs $(main)/js/audiojs

movefonts:
	cp $(materialize)/fonts/roboto/* $(main)/font/roboto/

# clean shiz
clean:
	rm -rf $(main)/css/*
	rm -rf $(main)/js/*
	rm -rf $(main)/fonts/*
