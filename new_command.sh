#!/usr/bin/env bash
# Lints, commits, and  pushes a new command to an appropriately named branch.

display_usage() {
	echo -e "\nUsage:\n bash $0 {{command.md}} \n"
	}

while getopts :h option; do
	case $option in
		h) display_usage
			exit 0;;
		?) echo "Invalid option -- $OPTARG"
			display_usage
			exit 1;;
	esac
done

if ! [[ $# -eq 1 ]];
then
	display_usage
	exit 1
fi


if command -v tldrl >/dev/null ; then
	tldrl $1 
	
	else 
		echo "TLDR linter not installed!"

	if [ $? -ne 0 ];
	then
		echo "Lint error!"
		exit 1
	fi
fi

if [ $? -ne 0 ];
then
	echo "Lint error!"
	exit 1
fi

base="$(basename $1 .md)"
git checkout -b $base
git add $1
git commit -m "$base: add page"
git push origin $base
