# Makefile for building and running rasptask

# Go compiler
GO := go

# Binary output directory
BIN_DIR := ./bin

# Binary name
BINARY_NAME := rasptask

# Build target
$(BIN_DIR)/$(BINARY_NAME): cmd/rastask.go
	@mkdir -p $(BIN_DIR)
	$(GO) build -o $(BIN_DIR)/$(BINARY_NAME) cmd/rastask.go

# Run target
run: $(BIN_DIR)/$(BINARY_NAME)
	$(BIN_DIR)/$(BINARY_NAME)

# Clean target
clean:
	rm -rf $(BIN_DIR)

.PHONY: run clean
