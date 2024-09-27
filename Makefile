# Flutter Makefile for desktop development

# Build for Windows
build-windows:
	flutter build windows

# Build for Linux using Nix shell
build-linux:
	nix-shell --run "flutter build linux"

# Run in development mode
run-dev:
	flutter run -d desktop

# Default target
all: build-windows build-linux

.PHONY: build-windows build-linux run-dev all
