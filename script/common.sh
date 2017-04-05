#!/bin/bash

# common.sh

command_exists() {
	type "$1" &> /dev/null ;
}

detect_os() {
	if [ "$OSTYPE" == "darwin"* ]; then
		PLATFORM="macos"
	elif [ "$OSTYPE" == "linux"* ]; then
		PLATFORM="linux"
	elif [ "$OSTYPE" == "bsd"* ]; then
		PLATFORM="bsd"
	fi
	PLATFORM="unknown"
}

write_log() {
	echo "$1"
}

