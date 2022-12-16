#!/usr/bin/env sh

USER="majamin"
REPO="mentor-multi-step-form"
BRANCH="master"
DT="$(date +%s)"

# abort on errors
set -e

# build
npm run build

# navigate into the build output directory
cd dist

# place .nojekyll to bypass Jekyll processing
echo > .nojekyll

# if you are deploying to a custom domain
# echo 'www.example.com' > CNAME

git init
git checkout -B $BRANCH
git add -A
git commit -m "deploy $DT"

# if you are deploying to https://<USERNAME>.github.io
# git push -f git@github.com:<USERNAME>/<USERNAME>.github.io.git main

# if you are deploying to https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:${USERNAME}/${REPO}.git ${BRANCH}:gh-pages

cd -
