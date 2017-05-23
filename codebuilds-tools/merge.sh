#!/bin/bash
set -e;
chmod 600 deploy-key;
mv deploy-key ~/.ssh/merge_rsa;
git remote add master git@github.com:headmelted/codebuilds.git;
git remote add upstream https://github.com/Microsoft/vscode.git;
merge_tag_id=$(date +%Y%m%d%H%M%S);
git pull origin master;
git fetch upstream master;
git merge upstream/master -s recursive -X ours;
git add .;
git commit -m "Merging for $merge_tag_id";
git tag -a "$merge_tag_id" -m "Merging for $merge_tag_id";
git push origin master;
git push origin master --tags;
