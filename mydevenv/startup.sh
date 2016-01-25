#!/bin/bash -xe

# Check-out sources
[ ! -d arduino-builder ] && git clone https://github.com/arduino/arduino-builder

cd arduino-builder
# DO NOT source setup_go_env_vars
export GOPATH=$(pwd)
go get github.com/go-errors/errors
go get github.com/stretchr/testify
go get github.com/jstemmer/go-junit-report
go get golang.org/x/codereview/patch
go get golang.org/x/tools/cmd/vet
go build
#
# Add test steps
go test -v ./src/arduino.cc/builder/test/...
exec /bin/bash $*
