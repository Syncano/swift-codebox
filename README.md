# swift-codebox

This repository contains Dockerfile for Swift 2.2 image.

You can build the image yourself:

```
$ docker build -t quay.io/syncano/swift-codebox .
```

or pull it from Docker registry:

```
$ docker pull quay.io/syncano/swift-codebox
```

Then you can run Swift code inside Docker container:

```
$ docker run -it -v `pwd`/test.swift:/tmp/source.swift \
    quay.io/syncano/swift-codebox swift -f /tmp/source.swift
```
