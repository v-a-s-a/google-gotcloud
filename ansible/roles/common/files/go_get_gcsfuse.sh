#!/bin/bash
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
/usr/local/go/bin/go get -u github.com/googlecloudplatform/gcsfuse
