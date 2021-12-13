Using the TLDR linter, the page will be linted for errors and flag any, then, if there are no errors reported from the linter, the page will be staged onto a new branch, committed and pushed to origin with appropriate names.

Initialize a local git repo with your fork of tldr-pages set as origin,
then run this script as shown below, then submit the pull request in github.

Usage:

- Lint and submit a new page:

`$ bash new_command.sh {{command.md}}`

- Lint and submit a new page, exiting if tldr isn't installed:

`$ bash new_command.sh -l {{command.md}}`

