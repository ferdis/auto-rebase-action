#!/usr/bin/env bash

git fetch origin

BRANCHES=$(git branch --all --list '*feature*' | cut -d'/' -f3)

for branch in $BRANCHES; do
    git checkout $branch
    git rebase --stat origin/master &&
        git push origin HEAD:$branch -f || 
        git rebase --abort
done

