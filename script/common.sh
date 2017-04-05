#!/bin/bash

# common.sh


command_exists() {
	type "$1" &> /dev/null ;
}

detect_os() {
	if [ "$OSTYPE" -eq "darwin"* ]; then
		return "macos"
	elif [ "$OSTYPE" -eq "linux"* ]; then
		return "linux"
	elif [ "$OSTYPE" -eq "bsd"* ]; then
		return "bsd"
	fi
	return "unknown"
}

write_log() {
	echo "$1"
}

