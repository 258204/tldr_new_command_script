Using the TLDR linter, the page will be linted for errors and flag any, then, if there are no errors reported from the linter, the page will be staged onto a new branch, committed and pushed to origin with appropriate names.

Initialize a local git repo with your fork of tldr-pages set as origin,
then run this script as shown below, then submit the pull request in github.

Usage:

`$ bash new_command.sh {{command.md}}`
