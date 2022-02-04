#!/bin/bash

# remove existing folder
rm -rf ./apps/local

# start build
yarn build

# move build to folder
mv ./dist ./apps/local