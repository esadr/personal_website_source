#!/usr/bin/env bash

# Update HugoBlox Theme and Dependencies

echo "🚀 Updating Hugo modules..."
hugo mod get -u
hugo mod tidy

echo "✅ Update complete! Restart Hugo server if needed."
