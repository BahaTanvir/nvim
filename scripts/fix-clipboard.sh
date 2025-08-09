#!/bin/bash

# Fix Neovim clipboard support
# This script installs the appropriate clipboard provider for your system

echo "🔧 Fixing Neovim clipboard support..."

# Detect the system
if command -v apt-get &> /dev/null; then
    PACKAGE_MANAGER="apt"
elif command -v yum &> /dev/null; then
    PACKAGE_MANAGER="yum"
elif command -v pacman &> /dev/null; then
    PACKAGE_MANAGER="pacman"
elif command -v brew &> /dev/null; then
    PACKAGE_MANAGER="brew"
else
    echo "❌ Unsupported package manager"
    exit 1
fi

echo "📦 Detected package manager: $PACKAGE_MANAGER"

# Check if we're in Wayland or X11
if [ -n "$WAYLAND_DISPLAY" ]; then
    echo "🖥️  Detected Wayland session"
    CLIPBOARD_TOOL="wl-clipboard"
else
    echo "🖥️  Detected X11 session"
    CLIPBOARD_TOOL="xclip"
fi

echo "📋 Installing clipboard provider: $CLIPBOARD_TOOL"

# Install the appropriate clipboard tool
case $PACKAGE_MANAGER in
    "apt")
        if [ "$CLIPBOARD_TOOL" = "wl-clipboard" ]; then
            sudo apt update && sudo apt install -y wl-clipboard
        else
            sudo apt update && sudo apt install -y xclip xsel
        fi
        ;;
    "yum")
        if [ "$CLIPBOARD_TOOL" = "wl-clipboard" ]; then
            sudo yum install -y wl-clipboard
        else
            sudo yum install -y xclip xsel
        fi
        ;;
    "pacman")
        if [ "$CLIPBOARD_TOOL" = "wl-clipboard" ]; then
            sudo pacman -S --noconfirm wl-clipboard
        else
            sudo pacman -S --noconfirm xclip xsel
        fi
        ;;
    "brew")
        # macOS already has pbcopy/pbpaste
        echo "✅ macOS clipboard already available"
        ;;
esac

echo "🧪 Testing clipboard functionality..."

# Test clipboard
if command -v wl-copy &> /dev/null; then
    echo "test" | wl-copy
    if wl-paste | grep -q "test"; then
        echo "✅ Wayland clipboard working!"
    else
        echo "❌ Wayland clipboard test failed"
    fi
elif command -v xclip &> /dev/null; then
    echo "test" | xclip -selection clipboard
    if xclip -selection clipboard -o | grep -q "test"; then
        echo "✅ X11 clipboard working!"
    else
        echo "❌ X11 clipboard test failed"
    fi
elif command -v pbcopy &> /dev/null; then
    echo "test" | pbcopy
    if pbpaste | grep -q "test"; then
        echo "✅ macOS clipboard working!"
    else
        echo "❌ macOS clipboard test failed"
    fi
else
    echo "❌ No clipboard tool found after installation"
    exit 1
fi

echo ""
echo "🎉 Clipboard support fixed!"
echo "💡 Restart Neovim to use system clipboard"
echo ""
echo "📋 Available clipboard commands in Neovim:"
echo "   <leader>y  - Copy to system clipboard"
echo "   <leader>Y  - Copy line to system clipboard"
echo "   \"+y       - Copy to system clipboard (alternative)"
echo "   \"+p       - Paste from system clipboard"
echo ""
echo "🔍 To verify in Neovim, run: :checkhealth"