# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Repository Overview

This is a Homebrew tap for the `gitws` Git worktree manager. The tap provides the formula definition that allows users to install `gitws` via Homebrew.

## Key Commands

### Testing and Validation
```bash
# Style check
brew style morooka-akira/gitws

# Audit check  
brew audit --except=installed --tap=morooka-akira/gitws

# Syntax check
brew readall --aliases --os=all --arch=all morooka-akira/gitws

# Test bot commands (used in CI)
brew test-bot --only-tap-syntax
brew test-bot --only-formulae
brew test-bot --only-cleanup-before
brew test-bot --only-setup
```

### Formula Updates
When updating to a new version, calculate SHA256 hashes for all platforms:
```bash
curl -sL https://github.com/morooka-akira/gitws/releases/download/v{VERSION}/gitws-aarch64-apple-darwin | shasum -a 256
curl -sL https://github.com/morooka-akira/gitws/releases/download/v{VERSION}/gitws-x86_64-apple-darwin | shasum -a 256
curl -sL https://github.com/morooka-akira/gitws/releases/download/v{VERSION}/gitws-x86_64-unknown-linux-gnu | shasum -a 256
curl -sL https://github.com/morooka-akira/gitws/releases/download/v{VERSION}/gitws-aarch64-unknown-linux-gnu | shasum -a 256
```

## Architecture

The repository follows standard Homebrew tap conventions:
- `Formula/gitws.rb` - Main formula definition with platform-specific binary downloads
- Multi-platform support (macOS ARM/Intel, Linux ARM/Intel)
- Uses pre-compiled binaries (`:nounzip`) rather than source compilation
- GitHub Actions CI/CD for automated testing and publishing

## Formula Architecture

The formula supports 4 platforms:
- macOS ARM64 (`aarch64-apple-darwin`)
- macOS Intel (`x86_64-apple-darwin`) 
- Linux x86_64 (`x86_64-unknown-linux-gnu`)
- Linux ARM64 (`aarch64-unknown-linux-gnu`)

Key formula requirements:
- `using: :nounzip` is required for binary files without extensions
- `chmod "+x"` ensures executable permissions on Linux
- URLs point to GitHub releases with exact version tags
- SHA256 hashes must be accurate for security

Installation process: downloads binary, makes executable, installs to `bin/gitws`.

## Update Process

1. New binaries must be available on GitHub releases
2. Calculate SHA256 for all 4 platform binaries
3. Update `Formula/gitws.rb` with new version URLs and hashes
4. Update version assertion in test block
5. Run validation commands before committing
6. Use branch naming: `update-to-v{VERSION}`

## Important Notes

- SHA256 hashes in the formula contain Japanese placeholder text that must be updated with actual checksums when releasing
- The formula test verifies `gitws --version` returns the expected version
- CI runs on Ubuntu 22.04, macOS 13, and macOS 15