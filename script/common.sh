#!/bin/bash

# common.sh

command_exists() {
	type "$1" &> /dev/null ;
}

detect_os() {
	local L_OS
	if [ "$OSTYPE" == "darwin"* ]; then
		L_OS="macos"
	elif [ "$OSTYPE" == "linux"* ]; then
		L_OS="linux"
	elif [ "$OSTYPE" == "bsd"* ]; then
		L_OS="bsd"
	fi
	L_OS="unknown"
	eval "$1='$L_OS'"
}

write_log() {
	echo "$1"
}

