#!/bin/sh

# Install dependencies
npm install
mkdir -p bin

if ! [ -x "$(command -v modclean)" ]; then
  echo 'Error: modclean is not installed. To install: npm i -g modclean' >&2
  exit 1
fi

# Reduce size of node_modules directory
modclean --patterns="default:*"

# Get Chromedriver
curl -SL https://chromedriver.storage.googleapis.com/2.35/chromedriver_linux64.zip> chromedriver.zip
unzip chromedriver.zip -d ../lib/
rm chromedriver.zip
