#!/bin/bash

# This script deploys the Hugo website from the public folder to the GitHub repository (esadr.github.io).
# It preserves the CNAME file and ensures other files are updated interactively.

# Define directories
SOURCE_DIR="/home/esfp/dev/contents/personal_website_source/public"
TARGET_DIR="/home/esfp/dev/contents/esadr.github.io"

# Navigate to the target directory
if [ -d "$TARGET_DIR/.git" ]; then
  cd "$TARGET_DIR"
else
  echo "Error: Target directory is not a Git repository. Please initialize it with 'git init'."
  exit 1
fi

# print current directory path
echo "workig in target directory which is:" 
pwd



echo "Deploying Hugo website"
echo "from: $SOURCE_DIR"
echo "to $TARGET_DIR"

# Ensure the CNAME file is preserved
if [ -f CNAME ]; then
  echo "Preserving CNAME file..."
  cp CNAME /tmp/CNAME_backup
fi


# Remove all files in the target directory except .git and CNAME
# find . -mindepth 1 -not -name '.git' -not -name 'CNAME' -exec rm -rf {} +
shopt -s extglob  # Enable advanced pattern matching
rm -rf !(.git|CNAME)  # Deletes everything except .git and CNAME
shopt -u extglob  # Disable advanced pattern matching


# Copy new files from the source directory
cp -r "$SOURCE_DIR"/* "$TARGET_DIR"/

# Restore the CNAME file if it exists
if [ -f /tmp/CNAME_backup ]; then
  echo "Restoring CNAME file..."
  mv /tmp/CNAME_backup "$TARGET_DIR/CNAME"
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