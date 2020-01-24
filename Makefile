.PHONY: build fmt lint run test vendor_clean vendor_get vendor_update vet list

BINARY=gloss

VERSION=v0.1
BUILD=`git rev-parse HEAD`

LDFLAGS=-ldflags "-X main.version=${VERSION} -X main.build=${BUILD}"

.DEFAULT_GOAL: build

build:
	go build ${LDFLAGS} -o ${BINARY} ./*.go

all: osx linux windows
.PHONY: all

osx:
	GOOS="darwin" GOARCH="amd64" go build ${LDFLAGS} -o ${BINARY}-osx ./*.go

linux:
	GOOS="linux" GOARCH="amd64" go build ${LDFLAGS} -o ${BINARY}-linux ./*.go

#windows:
#	GOOS="windows" GOARCH="amd64" go build ${LDFLAGS} -o ${BINARY}.exe ./*.go
