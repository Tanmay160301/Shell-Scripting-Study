#!/usr/bin/env bash

set -e  # Exit on any error
set -o pipefail

# === Configuration ===
REPO_URL="https://your_github_repo.git"
BRANCH="main"
BUILD_DIR="/path/to/build/dir"
TARGET_DIR="/path/to/deployment/dir"
JAR_OUTPUT_DIR="/path/to/build/dir/target"
TOMCAT_WEBAPPS_DIR="/opt/tomcat/webapps"
DEPLOY_USER="tomcat"  # optional: user who owns the deployment dir

# === Logging Function ===
log() {
    echo "[INFO] $1"
}

error_exit() {
    echo "[ERROR] $1" >&2
    exit 1
}

# === Step 1: Update Code from Repo ===
# -d stands for if the directory does not exists
log "Updating the code from $REPO_URL on branch $BRANCH"
if [ ! -d "$TARGET_DIR/.git" ]; then
    log "Cloning repository for the first time"
    git clone --branch "$BRANCH" "$REPO_URL" "$TARGET_DIR" || error_exit "Git clone failed"
else
    cd "$TARGET_DIR" || error_exit "Target dir not found"
    git pull origin "$BRANCH" || error_exit "Git pull failed"
fi

# === Step 2: Build the Project ===
log "Building the Java project"
cd "$BUILD_DIR" || error_exit "Build dir not found"

# Optional: Add your build tool (Maven/Gradle)
if [ -f "pom.xml" ]; then
    mvn clean install || error_exit "Maven build failed"
elif [ -f "build.gradle" ]; then
    ./gradlew build || error_exit "Gradle build failed"
else
    error_exit "No known build file found (pom.xml or build.gradle)"
fi

# === Step 3: Deploy the JAR ===
# -t means sort by newest first and if any error is there
# Redirects stderr (error output) to /dev/null.

# This suppresses errors like:
# "ls: cannot access '*.jar': No such file or directory"
# head -n 1: Shows only the first line
log "Deploying the application"
latest_jar=$(ls -t "$JAR_OUTPUT_DIR"/*.jar 2>/dev/null | head -n 1)

#-z will check whether the string is empty or not
if [ -z "$latest_jar" ]; then
    error_exit "No .jar file found to deploy"
fi

cp "$latest_jar" "$TOMCAT_WEBAPPS_DIR" || error_exit "Failed to copy JAR to Tomcat"

# Optional: Adjust permissions
chown "$DEPLOY_USER":"$DEPLOY_USER" "$TOMCAT_WEBAPPS_DIR/$(basename "$latest_jar")"

log "✅ Deployment successful: $(basename "$latest_jar")"
