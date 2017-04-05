#!/bin/bash

# common.sh


command_exists() {
	type "$1" &> /dev/null ;
}

detect_os() {
	if [ "$OSTYPE" == "darwin"* ]; then
		return "macos"
	elif [ "$OSTYPE" == "linux"* ]; then
		return "linux"
	elif [ "$OSTYPE" == "bsd"* ]; then
		return "bsd"
	fi
	return "unknown"
}

write_log() {
	echo "$1"
}

