#!/bin/bash

echo -e "\033[0;32mDeploying updates to GitHub...\033[0m"


msg="rebuilding site `date`"
if [ $# -eq 1 ]
  then msg="$1"
fi

git add .
git commit -m "$msg"
git push origin master

# Build the project.
hugo -t introduction # if using a theme, replace with `hugo -t <YOURTHEME>`

# Go To Public folder
cd public
# Add changes to git.
git add .

# Commit changes.
git commit -m "$msg"

# Push source and build repos.
git push origin master

# Come Back up to the Project Root
cd ..
