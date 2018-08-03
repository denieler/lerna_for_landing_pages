#!/bin/bash

changed_projects=$(./node_modules/.bin/lerna changed --json | awk '{print $0}')
projects=$(echo $changed_projects | jq -r '.[] | .name')

for project in $projects; do
    ./node_modules/.bin/lerna run --scope $project deploy
done

./node_modules/.bin/lerna publish --conventional-commits --skip-npm --yes

