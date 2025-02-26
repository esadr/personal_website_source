#!/bin/bash

# This script builds the Hugo website and deploys it to the GitHub repository (esadr.github.io).
# It preserves the CNAME file and ensures other files are updated interactively.

# Get the absolute path of the current directory
CURRENT_DIR="$(pwd)"
SOURCE_DIR="$CURRENT_DIR/public"
TARGET_DIR="$(dirname "$CURRENT_DIR")/esadr.github.io"

echo "Source directory: $SOURCE_DIR"
echo "Target directory: $TARGET_DIR"

# Build the Hugo site
echo "Building Hugo site..."
hugo --minify

# Check if Hugo build was successful
if [ $? -ne 0 ]; then
    echo "Error: Hugo build failed"
    exit 1
fi

# Verify target directory exists and is a git repository
if [ ! -d "$TARGET_DIR" ]; then
    echo "Error: Target directory $TARGET_DIR does not exist"
    exit 1
fi

if [ ! -d "$TARGET_DIR/.git" ]; then
    echo "Error: $TARGET_DIR is not a Git repository. Please initialize it with 'git init'."
    exit 1
fi

cd "$TARGET_DIR"

# print current directory path
echo "working in target directory which is:" 
pwd

echo "Deploying Hugo website"
echo "from: $SOURCE_DIR"
echo "to: $TARGET_DIR"

# Ensure the CNAME file is preserved
if [ -f CNAME ]; then
    echo "Preserving CNAME file..."
    cp CNAME /tmp/CNAME_backup
fi

# Remove all files in the target directory except .git directory and CNAME
shopt -s extglob
rm -rf !(CNAME|.git)

# Copy new files from the source directory
cp -r "$SOURCE_DIR/"* .

# Restore the CNAME file if it exists
if [ -f /tmp/CNAME_backup ]; then
    echo "Restoring CNAME file..."
    mv /tmp/CNAME_backup CNAME
fi

# Add changes to Git
git add -A

git status 

# Commit changes
read -p "Enter commit message: " commit_message
git commit -m "$commit_message"

# Push to GitHub
read -p "Do you want to push the changes to GitHub? (y/n): " push_confirm
if [[ "$push_confirm" == "y" || "$push_confirm" == "Y" ]]; then
  git push origin master
else
  echo "Push aborted."
fi

echo "Deployment complete."