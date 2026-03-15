# Local Development Guide

Quick reference for running the Visual AI/ML Hub locally.

## Prerequisites

- **Node.js** >= 22.0
- **npm** (comes with Node.js)

## Quick Start

### Option 1: Using Make (Recommended)

```bash
# Install Node.js 22 (if not installed)
make setup-node

# Install dependencies and start dev server
make start

# Or fresh start with clean install
make fresh
```

### Option 2: Using Bash Script

```bash
# Install Node.js 22 (if not installed)
./scripts/local-dev.sh setup-node

# Start development server
./scripts/local-dev.sh start

# Full production test
./scripts/local-dev.sh test
```

### Option 3: Direct npm commands

```bash
npm install        # Install dependencies
npm run start      # Dev server at localhost:3000
npm run build      # Production build
npm run serve      # Serve production build
```

## Available Commands

| Command | Make | Script | Description |
|---------|------|--------|-------------|
| Setup Node | `make setup-node` | `./scripts/local-dev.sh setup-node` | Install Node.js 22 via nvm |
| Install deps | `make install` | `./scripts/local-dev.sh install` | Install npm packages |
| Dev server | `make start` | `./scripts/local-dev.sh start` | Hot reload at :3000 |
| Build | `make build` | `./scripts/local-dev.sh build` | Production build |
| Serve build | `make serve` | `./scripts/local-dev.sh serve` | Test prod build |
| Clear cache | `make clean` | `./scripts/local-dev.sh clear` | Clear Docusaurus cache |
| Full test | `make test` | `./scripts/local-dev.sh test` | Build → Serve |

## Troubleshooting

**Port 3000 in use?**
```bash
# Kill process on port 3000
kill -9 $(lsof -t -i:3000)
```

**Build errors?**
```bash
make clean        # Clear cache first
make fresh        # Then fresh install
```

**Check environment:**
```bash
make check        # Verify Node.js/npm versions
```
