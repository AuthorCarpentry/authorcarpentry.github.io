#!/bin/bash
BRANCH=$(git branch | grep '*' | cut -d \  -f 2)
if [ "$BRANCH" = "gh-pages" ]; then
    echo "You're already in the gh-pages branch. Stopping"
    exit 1
fi
git commit -am snapshot
git push origin "$BRANCH"
git checkout gh-pages
git pull "$BRANCH" gh-pages
git commit -am "merge from origin gh-pages"
git pull origin master
git commit -am "merge from origin $BRANCH"
git push origin gh-pages
git checkout "$BRANCH"
