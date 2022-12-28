#!/usr/bin/env sh

# Vite deploy script

OUTDIR="dist"

USER="majamin"
REPO="mentor-multi-step-form"
DEPLOY_BRANCH="gh-pages"
DT="$(date +%s)"

# abort on errors
set -e

# build
npm run build -- --outDir "${OUTDIR}" --base "/${REPO}/"

# navigate into the build output directory
cd "${OUTDIR}"

# place .nojekyll to bypass Jekyll processing
echo > .nojekyll

# OPTION: deploy to a custom domain
# echo 'www.example.com' > CNAME

git init
git checkout -b "$DEPLOY_BRANCH"
git add -A
git commit -m "deploy $DT"

# OPTION 1: You are deploying to https://<USERNAME>.github.io
# git push -f git@github.com:${USERNAME}/${USERNAME}.github.io.git "${MAIN_BRANCH}"

# OPTION 2: You are deploying to https://<USERNAME>.github.io/<REPO>
git push -f git@github.com:${USER}/${REPO}.git ${DEPLOY_BRANCH}

cd -

# NOTE FOR OPTION 2: go to https://<USERNAME>.github.io/<REPO>, Settings, and point
# "pages" to your BRANCH
