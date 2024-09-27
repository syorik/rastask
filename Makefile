build-windows:
	flutter build windows

build-linux:
	flutter build linux

run-dev:
	flutter run -d desktop

all: build-windows build-linux

.PHONY: build-windows build-linux run-dev all
