#!/usr/bin/env bash

# shellcheck disable=SC2034
REPO_URL="https://your_github_repo.git"
BRANCH="MAIN"
BUILD_DIR="/path/to/build/dir"
TARGET_DIR="/path/to/deployment/dir"

#Update the code from the repository
echo "Updating the code from the repo"
cd "$TARGET_DIR" || exit 1
git pull origin "$BRANCH"

#Build the project(if needed)
echo "building the project"
cd "$BUILD_DIR" || exit 1
# Insert build commands here

#Deploy the project
echo "Deploying the project"
cp /*jar /opt/tomcat/webapps
#Insert deployment commands here

echo "Deployment commands here"