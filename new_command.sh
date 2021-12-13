#!/usr/bin/env bash
# Lints, commits, and  pushes a new command to an appropriately named branch.

display_usage() {
	echo -e "\nUsage:\n bash $0 {{command.md}} \n"
	}

force_lint=false

while getopts :hl option; do
        case $option in
                h) display_usage
                        exit 0;;
		l) force_lint=true;;
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


if command -v tldrl >/dev/null ; 
then
	if ! tldrl "$1"; 
	then
		echo "Lint error!"
		exit 1
	fi
else 
		echo "TLDR linter not installed!"
		if $force_lint:
	       	then
			exit 1
		fi
fi


base="$(basename "$1" .md)"
git checkout -b "$base"
git add "$1"
git commit -m "$base: add page"
git push origin "$base"
