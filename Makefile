all: local_time.js

node_modules:
	npm install coffee-script

local_time.js: node_modules local_time-master
	cat local_time-master/app/assets/javascripts/local_time.js.coffee | \
	    ./node_modules/.bin/coffee -sc \
	    > $@

master.zip:
	wget https://github.com/basecamp/local_time/archive/master.zip

local_time-master: master.zip
	unzip $<

clean:
	rm -rf local_time-master/ master.zip local_time.js node_modules/
