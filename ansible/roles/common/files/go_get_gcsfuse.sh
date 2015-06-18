#!/bin/bash
export GOPATH=$HOME/go
export PATH=$PATH:/usr/local/go/bin
export PATH=$PATH:$GOPATH/bin
if [ ! -d "/home/trubetsk/go/src/github.com/googlecloudplatform/gcsfuse" ]; then
  /usr/local/go/bin/go get -u github.com/googlecloudplatform/gcsfuse
fi
