GO111MODULE=on
BINARY_NAME=webhook
RIMRAF=rm -rf
PACKAGE_NAME=go.sirus.dev/webhook-debuger

# setup OS variables
ifeq ($(OS), Windows_NT)
	BINARY_NAME=webhook.exe
endif

.PHONY: all test docs

all:
	make init
	make build

init:
	make clean
	go mod tidy

build:
	go build -o $(BINARY_NAME) -v

run:
	go run $(PACKAGE_NAME) server

build-cross-linux:
	make init
	make lint
	CGO_ENABLED=0 GOOS=linux GOARCH=amd64 go build -o $(BINARY_NAME) -v

clean:
	$(RIMRAF) $(BINARY_NAME)
