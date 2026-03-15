# ============================================
# Visual AI/ML Hub - Makefile
# ============================================
# Quick commands for local development
# Usage: make [target]
# ============================================

.PHONY: help setup-node install start dev build serve clean test check

# Default target
.DEFAULT_GOAL := help

# Colors
BLUE := \033[0;34m
GREEN := \033[0;32m
YELLOW := \033[1;33m
NC := \033[0m

help: ## Show this help message
	@echo "$(BLUE)╔════════════════════════════════════════╗$(NC)"
	@echo "$(BLUE)║     Visual AI/ML Hub - Makefile        ║$(NC)"
	@echo "$(BLUE)╚════════════════════════════════════════╝$(NC)"
	@echo ""
	@echo "Usage: make [target]"
	@echo ""
	@grep -E '^[a-zA-Z_-]+:.*?## .*$$' $(MAKEFILE_LIST) | sort | awk 'BEGIN {FS = ":.*?## "}; {printf "  $(GREEN)%-15s$(NC) %s\n", $$1, $$2}'
	@echo ""

setup-node: ## Install Node.js 22 via nvm
	./scripts/local-dev.sh setup-node

install: ## Install npm dependencies
	npm install

start: ## Start development server (hot reload) at localhost:3000
	npm run start

dev: start ## Alias for 'start'

build: ## Build for production
	npm run build

serve: ## Serve production build locally
	npm run serve

clean: ## Clear Docusaurus cache
	npm run clear

test: clean build serve ## Full test: clear → build → serve

check: ## Check Node.js and npm versions
	@echo "$(YELLOW)Checking prerequisites...$(NC)"
	@node -v
	@npm -v
	@echo "$(GREEN)✅ Prerequisites OK$(NC)"

# Quick workflow shortcuts
fresh: clean install start ## Fresh start: clean → install → start

prod-test: clean install build serve ## Production test: clean → install → build → serve
