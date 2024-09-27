# Makefile for building and running rasptask

# Go compiler
GO := go

# Binary name
BINARY_NAME := rasptask

# Build command
build:
	$(GO) build -o ./bin/$(BINARY_NAME) cmd/rastask.go

# Run command
run:
	$(GO) run cmd/rastask.go

# Clean command
clean:
	rm -f ./bin/$(BINARY_NAME)

.PHONY: build run clean
