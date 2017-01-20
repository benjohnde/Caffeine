#!/bin/bash

xcodebuild -scheme Caffeine -target Caffeine \
    -configuration Release \
    CONFIGURATION_BUILD_DIR=./build
/bin/cp -r ./build/Caffeine.app /Applications
