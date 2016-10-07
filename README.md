# swift-codebox

This repository contains Dockerfile for Swift 2.2 image.

You can build the image yourself (requires Ansible 2.1.0):

```
$ ./create_swift_image.sh
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
