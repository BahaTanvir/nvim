#!/bin/bash

# Ultimate Neovim Setup Installation Script
# This script installs all dependencies and sets up the configuration

set -e

echo "🚀 Installing Ultimate Neovim Setup..."

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
NC='\033[0m' # No Color

# Function to print colored output
print_status() {
    echo -e "${BLUE}[INFO]${NC} $1"
}

print_success() {
    echo -e "${GREEN}[SUCCESS]${NC} $1"
}

print_warning() {
    echo -e "${YELLOW}[WARNING]${NC} $1"
}

print_error() {
    echo -e "${RED}[ERROR]${NC} $1"
}

# Check if running on macOS or Linux
if [[ "$OSTYPE" == "darwin"* ]]; then
    OS="macos"
    PACKAGE_MANAGER="brew"
elif [[ "$OSTYPE" == "linux-gnu"* ]]; then
    OS="linux"
    if command -v apt-get &> /dev/null; then
        PACKAGE_MANAGER="apt"
    elif command -v yum &> /dev/null; then
        PACKAGE_MANAGER="yum"
    elif command -v pacman &> /dev/null; then
        PACKAGE_MANAGER="pacman"
    else
        print_error "Unsupported Linux distribution"
        exit 1
    fi
else
    print_error "Unsupported operating system"
    exit 1
fi

print_status "Detected OS: $OS with package manager: $PACKAGE_MANAGER"

# Install dependencies based on OS and package manager
install_dependencies() {
    print_status "Installing dependencies..."
    
    case $PACKAGE_MANAGER in
        "brew")
            brew install neovim ripgrep fd fzf git lazygit node python3 go rust
            ;;
        "apt")
            sudo apt update
            sudo apt install -y neovim ripgrep fd-find fzf git nodejs npm python3 python3-pip
            # Install Go
            if ! command -v go &> /dev/null; then
                print_status "Installing Go..."
                wget -q https://golang.org/dl/go1.21.0.linux-amd64.tar.gz
                sudo tar -C /usr/local -xzf go1.21.0.linux-amd64.tar.gz
                echo 'export PATH=$PATH:/usr/local/go/bin' >> ~/.bashrc
                rm go1.21.0.linux-amd64.tar.gz
            fi
            # Install Rust
            if ! command -v cargo &> /dev/null; then
                print_status "Installing Rust..."
                curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh -s -- -y
                source ~/.cargo/env
            fi
            # Install lazygit
            if ! command -v lazygit &> /dev/null; then
                print_status "Installing lazygit..."
                LAZYGIT_VERSION=$(curl -s "https://api.github.com/repos/jesseduffield/lazygit/releases/latest" | grep -Po '"tag_name": "v\K[^"]*')
                curl -Lo lazygit.tar.gz "https://github.com/jesseduffield/lazygit/releases/latest/download/lazygit_${LAZYGIT_VERSION}_Linux_x86_64.tar.gz"
                tar xf lazygit.tar.gz lazygit
                sudo install lazygit /usr/local/bin
                rm lazygit lazygit.tar.gz
            fi
            ;;
        "pacman")
            sudo pacman -S --noconfirm neovim ripgrep fd fzf git nodejs npm python python-pip go rust
            # Install lazygit from AUR or manually
            if ! command -v lazygit &> /dev/null; then
                print_warning "Please install lazygit manually or from AUR"
            fi
            ;;
        *)
            print_error "Unsupported package manager: $PACKAGE_MANAGER"
            exit 1
            ;;
    esac
}

# Backup existing Neovim configuration
backup_config() {
    if [ -d "$HOME/.config/nvim" ]; then
        print_status "Backing up existing Neovim configuration..."
        mv "$HOME/.config/nvim" "$HOME/.config/nvim.backup.$(date +%Y%m%d_%H%M%S)"
        print_success "Backup created"
    fi
}

# Install Neovim configuration
install_config() {
    print_status "Installing Neovim configuration..."
    
    # Create config directory
    mkdir -p "$HOME/.config"
    
    # Clone or copy configuration
    if [ -d "$(pwd)/lua" ]; then
        # If running from the config directory
        cp -r "$(pwd)" "$HOME/.config/nvim"
    else
        print_error "Please run this script from the Neovim configuration directory"
        exit 1
    fi
    
    print_success "Configuration installed"
}

# Install additional tools
install_additional_tools() {
    print_status "Installing additional development tools..."
    
    # Install language servers and tools via npm
    if command -v npm &> /dev/null; then
        npm install -g typescript-language-server vscode-langservers-extracted prettier eslint_d
    fi
    
    # Install Python tools
    if command -v pip3 &> /dev/null; then
        pip3 install --user black isort ruff mypy
    fi
    
    print_success "Additional tools installed"
}

# Main installation process
main() {
    print_status "Starting Ultimate Neovim Setup installation..."
    
    # Check if Neovim is already installed
    if ! command -v nvim &> /dev/null; then
        install_dependencies
    else
        print_success "Neovim is already installed"
    fi
    
    backup_config
    install_config
    install_additional_tools
    
    print_success "Installation complete!"
    print_status "Please restart your terminal and run 'nvim' to complete the setup"
    print_status "The first startup will install all plugins automatically"
    
    echo ""
    echo "🎉 Welcome to your Ultimate Neovim Setup!"
    echo "📚 Check the README.md for keybindings and usage instructions"
    echo "🔧 Run ':checkhealth' in Neovim to verify everything is working"
}

# Run main function
main "$@"