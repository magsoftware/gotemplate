all: test vet fmt build

deps:
	mkdir -p ./bin
.PHONY: deps

test:
	go test -cover -v ./...
.PHONY: test

vet:
	go vet ./...
.PHONY: vet

fmt:
	go list -f '{{.Dir}}' ./... | grep -v /vendor/ | xargs -L1 gofmt -l
	test -z $$(go list -f '{{.Dir}}' ./... | grep -v /vendor/ | xargs -L1 gofmt -l)
.PHONY: fmt

build: deps
	go build -o bin/greeter ./cmd/greeter
.PHONY: build

clean:
	rm -fr ./bin
.PHONY: clean

docker-build:
	docker build -t greet_test:latest .
.PHONY: docker-build

docker-run:
	docker-compose up
.PHONY: docker-run

docker-run-build:
	docker-compose up --build
.PHONY: docker-run-build
