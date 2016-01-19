#!/bin/bash -xe

cd arduino-builder
# DO NOT source setup_go_env_vars
export GOPATH=$(pwd)
go get github.com/go-errors/errors
go get github.com/stretchr/testify
go get github.com/jstemmer/go-junit-report
go get golang.org/x/codereview/patch
go get golang.org/x/tools/cmd/vet
go build
exec /bin/bash $*
