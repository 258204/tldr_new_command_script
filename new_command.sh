#!/usr/bin/env bash
# Lints, commits, and  pushes a new command to an appropriately named branch.

display_usage() {
	echo -e "\nUsage: $0 {{command.md}} \n"
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

tldrl $1
if [ $? ] then;
then
	echo "Lint error!\n"
	exit 1
fi

echo base="$(basename $1 .md)"
echo git checkout -b $base
echo git add $1
echo git commit -S -m "$base: add page"
echo git push origin $base
