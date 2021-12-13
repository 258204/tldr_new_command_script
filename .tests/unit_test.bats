#!/usr/bin/env bats

# usage
# $ bats unit_test.sh

setup() {
	branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')
}

@test "Check if pass.md works" {
  result="$(tldrl pass.md)"
  [ "$result" == "" ]
}

@test "Check if fail.md works" {
  run tldrl fail.md
  [ $status -eq 1 ]
}

@test "tldrl fail" {
  run bash ../new_command.sh fail.md
  [ $status -eq 1 ]
  [[ $(git ls-remote --heads origin fail) == "" ]]
}

@test "tldrl pass" {
  run bash ../new_command.sh pass.md
  [ $status -eq 0 ]
  [[ $(git ls-remote --heads origin pass) != "" ]]
}

@test "shell check" {
	shellcheck ../new_command.sh
}

teardown() {
  # clean up the mess git makes
  pass=$(git ls-remote --heads origin pass)
  if [[ $pass != "" ]]; then
    git checkout $branch
    git branch -d pass
    git push origin --delete pass
    cp pass.md.bak pass.md
  fi

  fail=$(git ls-remote --heads origin fail)
  if [[ $fail != "" ]]; then
    git checkout $branch
    git branch -D fail
    git push origin --delete fail
    cp fail.md.bak fail.md
  fi
}
