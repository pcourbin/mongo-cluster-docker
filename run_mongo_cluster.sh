#!/bin/bash
set -e

function start() {
	# Start
	docker-compose -f docker-compose.1.yml -f docker-compose.2.yml  -f docker-compose.cnf.yml -f docker-compose.shard.yml up -d
}

function logs() {
	# Display logs
	docker-compose -f docker-compose.1.yml -f docker-compose.2.yml  -f docker-compose.cnf.yml -f docker-compose.shard.yml logs -f
}

function stop() {
	docker-compose -f docker-compose.1.yml -f docker-compose.2.yml  -f docker-compose.cnf.yml -f docker-compose.shard.yml stop
}

function rm() {
	docker-compose -f docker-compose.1.yml -f docker-compose.2.yml  -f docker-compose.cnf.yml -f docker-compose.shard.yml rm -f
}

if [ "$1" = "start" ]; then
	start
elif [ "$1" = "logs" ]; then
	logs
elif [ "$1" = "stop" ]; then
	stop
elif [ "$1" = "rm" ]; then
	rm
else
	echo "Error: start, logs, stop or rm!"
fi

