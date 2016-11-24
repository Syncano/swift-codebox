#!/bin/bash

set -e

SWIFT_BRANCH=swift-3.0.1-release
SWIFT_VERSION=3.0.1-RELEASE
SWIFT_PLATFORM=ubuntu14.04

# Install Swift keys
wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import -
gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift

# Install Swift Ubuntu 14.04 Snapshot
mkdir /swift
SWIFT_ARCHIVE_NAME=swift-$SWIFT_VERSION-$SWIFT_PLATFORM
SWIFT_URL=https://swift.org/builds/$SWIFT_BRANCH/$(echo "$SWIFT_PLATFORM" | tr -d .)/swift-$SWIFT_VERSION/$SWIFT_ARCHIVE_NAME.tar.gz
wget $SWIFT_URL
wget $SWIFT_URL.sig
gpg --verify $SWIFT_ARCHIVE_NAME.tar.gz.sig
tar -xvzf $SWIFT_ARCHIVE_NAME.tar.gz --directory /swift --strip-components=1
chmod -R +rx /swift
rm -rf $SWIFT_ARCHIVE_NAME* /tmp/* /var/tmp/*
