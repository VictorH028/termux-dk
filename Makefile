# 
OS := $(shell uname)

#  
PREFIX := $(shell echo $$PREFIX)
FILE := $(PREFIX)/etc/apt/sources.list.d/demon-termux-packages.list
URL := https://raw.githubusercontent.com/VictorH028/victorh028.github.io/refs/heads/main/key/demon-termux-packages.list

# Objetivo por defecto
all: check_key check_os run_setup

# 
check_key:
	@if [ -f $(FILE) ]; then \
		echo " "; \
	else \
		echo "Downloading from $(URL)..."; \
		curl -o $(FILE) $(URL); \
		echo "File  downloading."; \
	fi

# Verificar si el sistema operativo es Linux
check_os:
	@if [ "$(OS)" != "Linux" ]; then \
		echo "Just for  Linux."; \
		exit 1; \
	fi

# Ejecutar el script setup.sh
run_setup:
	@echo "Running setup.sh..."
	@chmod +x setup.sh  
	@./setup.sh

clean:
	@echo "Remove..."

.PHONY: all check_os run_setup
