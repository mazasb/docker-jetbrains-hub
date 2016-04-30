#!/bin/sh

if [ ! -e $APP_HOME/conf ];
then
	echo "first run: starting configure"
	mv ./conf $APP_HOME/
	ln -s $APP_HOME/conf ./conf
	bin/hub.sh configure \
		--backups-dir $APP_HOME/backups \
		--data-dir    $APP_HOME/data \
		--logs-dir    $APP_HOME/log \
		--temp-dir    $APP_HOME/tmp \
		--listen-port $APP_PORT \
		--base-url    http://localhost/
else
	rm -rf ./conf
	ln -s $APP_HOME/conf ./conf
fi

bin/hub.sh run
