# Makefile for Personal Manager App

# Python interpreter
PYTHON = python3

# Main application file
MAIN = main.py

# Run the application
run:
	$(PYTHON) $(MAIN)

# Install dependencies
install:
	pip install tkinter customtkinter

# Clean up generated files
clean:
	find . -type f -name '*.pyc' -delete
	find . -type d -name '__pycache__' -delete

# Default target
.DEFAULT_GOAL := run

.PHONY: run install clean
