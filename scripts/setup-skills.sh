#!/bin/bash

# Setup script to install all skills using npx skills
# This script requires Node.js to be installed

echo "Setting up Keywe skills..."

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo "Error: Node.js is required but not installed."
    echo "Please install Node.js from https://nodejs.org/"
    exit 1
fi

# Check if npx is available
if ! command -v npx &> /dev/null; then
    echo "Error: npx is required but not installed."
    echo "Please install Node.js which includes npx."
    exit 1
fi

# Install skills using npx skills from the skills-lock.json
echo "Installing skills from skills-lock.json..."
npx skills install

echo "Skills installation completed successfully!"
echo "You can now build and run the application."