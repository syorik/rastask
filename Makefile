.PHONY: build run

build:
	wails build

run: build
	./build/bin/rastask

default: run
