#!/bin/bash

# ============================================
# Visual AI/ML Hub - Local Development Script
# ============================================
# This script helps run and test the site locally
# Usage: ./scripts/local-dev.sh [command]
# ============================================

set -e  # Exit on error

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Project root directory
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

cd "$PROJECT_ROOT"

# Display banner
banner() {
    echo -e "${BLUE}"
    echo "╔════════════════════════════════════════╗"
    echo "║     Visual AI/ML Hub - Local Dev       ║"
    echo "╚════════════════════════════════════════╝"
    echo -e "${NC}"
}

# Install Node.js via nvm
install_nodejs() {
    echo -e "${YELLOW}📥 Installing Node.js...${NC}"
    
    # Check if nvm is installed
    if [ -s "$HOME/.nvm/nvm.sh" ]; then
        echo -e "${GREEN}✅ nvm already installed${NC}"
        source "$HOME/.nvm/nvm.sh"
    else
        echo -e "${YELLOW}   Installing nvm (Node Version Manager)...${NC}"
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash
        
        # Load nvm
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        
        echo -e "${GREEN}✅ nvm installed${NC}"
    fi
    
    # Install Node.js 22 LTS
    echo -e "${YELLOW}   Installing Node.js 22 LTS...${NC}"
    nvm install 22
    nvm use 22
    nvm alias default 22
    
    echo -e "${GREEN}✅ Node.js $(node -v) installed${NC}"
    echo -e "${GREEN}✅ npm $(npm -v) installed${NC}"
    echo ""
    echo -e "${BLUE}ℹ️  To use Node.js in new terminals, run:${NC}"
    echo -e "${BLUE}   source ~/.nvm/nvm.sh${NC}"
    echo -e "${BLUE}   Or restart your terminal${NC}"
    echo ""
}

# Check prerequisites
check_prerequisites() {
    echo -e "${YELLOW}🔍 Checking prerequisites...${NC}"
    
    # Check Node.js
    if ! command -v node &> /dev/null; then
        echo -e "${RED}❌ Node.js is not installed.${NC}"
        echo -e "${YELLOW}   Run: ./scripts/local-dev.sh setup-node${NC}"
        exit 1
    fi
    
    NODE_VERSION=$(node -v | cut -d'v' -f2 | cut -d'.' -f1)
    if [ "$NODE_VERSION" -lt 22 ]; then
        echo -e "${RED}❌ Node.js version must be >= 22.0. Current: $(node -v)${NC}"
        echo -e "${YELLOW}   Run: ./scripts/local-dev.sh setup-node${NC}"
        exit 1
    fi
    echo -e "${GREEN}✅ Node.js $(node -v)${NC}"
    
    # Check npm
    if ! command -v npm &> /dev/null; then
        echo -e "${RED}❌ npm is not installed${NC}"
        exit 1
    fi
    echo -e "${GREEN}✅ npm $(npm -v)${NC}"
    
    echo ""
}

# Install dependencies
install_deps() {
    echo -e "${YELLOW}📦 Installing dependencies...${NC}"
    npm install
    echo -e "${GREEN}✅ Dependencies installed${NC}"
    echo ""
}

# Clear cache
clear_cache() {
    echo -e "${YELLOW}🧹 Clearing Docusaurus cache...${NC}"
    npm run clear
    echo -e "${GREEN}✅ Cache cleared${NC}"
    echo ""
}

# Start development server
start_dev() {
    echo -e "${YELLOW}🚀 Starting development server...${NC}"
    echo -e "${BLUE}   Server will be available at: http://localhost:3000${NC}"
    echo -e "${BLUE}   Press Ctrl+C to stop${NC}"
    echo ""
    npm run start
}

# Build for production
build_prod() {
    echo -e "${YELLOW}🔨 Building for production...${NC}"
    npm run build
    echo -e "${GREEN}✅ Build complete! Output in ./build directory${NC}"
    echo ""
}

# Serve production build
serve_build() {
    echo -e "${YELLOW}🌐 Serving production build...${NC}"
    echo -e "${BLUE}   Server will be available at: http://localhost:3000${NC}"
    echo -e "${BLUE}   Press Ctrl+C to stop${NC}"
    echo ""
    npm run serve
}

# Full local test (build + serve)
full_test() {
    check_prerequisites
    install_deps
    clear_cache
    build_prod
    serve_build
}

# Show help
show_help() {
    banner
    echo "Usage: ./scripts/local-dev.sh [command]"
    echo ""
    echo "Commands:"
    echo "  setup-node  Install Node.js 22 via nvm (if not installed)"
    echo "  install     Install npm dependencies"
    echo "  start       Start development server (hot reload)"
    echo "  build       Build for production"
    echo "  serve       Serve production build locally"
    echo "  clear       Clear Docusaurus cache"
    echo "  test        Full test: install → clear → build → serve"
    echo "  check       Check prerequisites only"
    echo "  help        Show this help message"
    echo ""
    echo "Quick start:"
    echo "  ./scripts/local-dev.sh setup-node  # Install Node.js first (if needed)"
    echo "  ./scripts/local-dev.sh start       # Development with hot reload"
    echo "  ./scripts/local-dev.sh test        # Test production build"
    echo ""
}

# Main
banner

case "${1:-start}" in
    setup-node)
        install_nodejs
        ;;
    install)
        check_prerequisites
        install_deps
        ;;
    start)
        check_prerequisites
        start_dev
        ;;
    build)
        check_prerequisites
        build_prod
        ;;
    serve)
        serve_build
        ;;
    clear)
        clear_cache
        ;;
    test)
        full_test
        ;;
    check)
        check_prerequisites
        echo -e "${GREEN}✅ All prerequisites met!${NC}"
        ;;
    help|--help|-h)
        show_help
        ;;
    *)
        echo -e "${RED}Unknown command: $1${NC}"
        echo ""
        show_help
        exit 1
        ;;
esac
