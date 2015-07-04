#!/bin/bash

git push origin master

APP="test"
DG="test"
COMMIT="$(git log | head -n1 | awk '{print $2}')"
REPO="https://github.com/milos-test/codedeploy-app"

aws deploy create-deployment \
   --application-name "$APP" \
   --deployment-group-name "$DG" \
   --github-location commitId="$COMMIT",repository="$REPO"
