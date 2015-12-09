FROM phusion/baseimage:0.9.17 

# Use baseimage-docker's init system. 
CMD ["/sbin/my_init"]

ENV SWIFT_VERSION 2.2-SNAPSHOT-2015-12-01-b 
ENV SWIFT_PLATFORM ubuntu14.04 

# Install related packages 
RUN apt-get update && \
    apt-get install -y build-essential wget clang libedit-dev python2.7 python2.7-dev libicu52 rsync && \
    apt-get clean && \
    rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
# Install Swift keys 

RUN wget -q -O - https://swift.org/keys/all-keys.asc | gpg --import - && \
    gpg --keyserver hkp://pool.sks-keyservers.net --refresh-keys Swift
# Install Swift Ubuntu 14.04 Snapshot 

RUN SWIFT_ARCHIVE_NAME=swift-$SWIFT_VERSION-$SWIFT_PLATFORM && \
    SWIFT_URL=https://swift.org/builds/$(echo "$SWIFT_PLATFORM" | tr -d .)/swift-$SWIFT_VERSION/$SWIFT_ARCHIVE_NAME.tar.gz && \
    wget $SWIFT_URL && \
    wget $SWIFT_URL.sig && \
    gpg --verify $SWIFT_ARCHIVE_NAME.tar.gz.sig && \
    tar -xvzf $SWIFT_ARCHIVE_NAME.tar.gz --directory / --strip-components=1 && \
    rm -rf $SWIFT_ARCHIVE_NAME* /tmp/* /var/tmp/*
# Set Swift Path 

ENV PATH /usr/bin:$PATH

