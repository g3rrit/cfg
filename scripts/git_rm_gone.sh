#!/bin/bash
#
# Remove all merged and rebased local branches
########################################################################################################################

git fetch --all >/dev/null 2>&1

for branch in $(git branch | sed 's/^\s*//' | grep -v 'master$' | grep -v 'release.*' | grep -v '*'); do
  commit_msg=$(git log --oneline --format=%f master..$branch | tail -1)
  if [[ -z $commit_msg ]]; then
    continue
  fi
  if [[ "$(git log --oneline --format=%f origin/master | grep $commit_msg | wc -l)" -eq 1 ]]; then
    echo "git branch -D \"$branch\""
  fi
done

