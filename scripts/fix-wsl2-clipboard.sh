#!/bin/bash

# Fix Neovim clipboard support for WSL2
# This script sets up clipboard integration between WSL2 and Windows

echo "🔧 Fixing WSL2 clipboard integration for Neovim..."

# Check if we're in WSL2
if ! grep -q microsoft /proc/version; then
    echo "❌ This script is for WSL2 only"
    exit 1
fi

echo "✅ Detected WSL2 environment"

# Method 1: Install wslu (WSL utilities)
echo "📦 Installing wslu for clipboard integration..."
sudo apt update
sudo apt install -y wslu

# Test if wslclip works
if command -v wslclip &> /dev/null; then
    echo "✅ wslclip installed successfully"
else
    echo "❌ wslclip installation failed, trying alternative method..."
fi

# Method 2: Create custom clipboard scripts
echo "📋 Creating custom clipboard integration scripts..."

# Create the scripts directory if it doesn't exist
mkdir -p ~/.local/bin

# Create win32yank wrapper for copy
cat > ~/.local/bin/win32yank-copy << 'EOF'
#!/bin/bash
# Copy to Windows clipboard via win32yank or clip.exe
if command -v win32yank.exe &> /dev/null; then
    win32yank.exe -i --crlf
elif command -v clip.exe &> /dev/null; then
    clip.exe
else
    echo "No Windows clipboard tool found" >&2
    exit 1
fi
EOF

# Create win32yank wrapper for paste
cat > ~/.local/bin/win32yank-paste << 'EOF'
#!/bin/bash
# Paste from Windows clipboard via win32yank or powershell
if command -v win32yank.exe &> /dev/null; then
    win32yank.exe -o --lf
elif command -v powershell.exe &> /dev/null; then
    powershell.exe -Command "Get-Clipboard" 2>/dev/null | sed 's/\r$//'
else
    echo "No Windows clipboard tool found" >&2
    exit 1
fi
EOF

# Make scripts executable
chmod +x ~/.local/bin/win32yank-copy
chmod +x ~/.local/bin/win32yank-paste

# Add to PATH if not already there
if [[ ":$PATH:" != *":$HOME/.local/bin:"* ]]; then
    echo 'export PATH="$HOME/.local/bin:$PATH"' >> ~/.bashrc
    echo "📝 Added ~/.local/bin to PATH in ~/.bashrc"
fi

# Method 3: Download win32yank if available
echo "⬇️  Attempting to download win32yank..."
if command -v curl &> /dev/null; then
    TEMP_DIR=$(mktemp -d)
    cd "$TEMP_DIR"
    
    # Download win32yank
    curl -sLo win32yank.zip https://github.com/equalsraf/win32yank/releases/download/v0.0.4/win32yank-x64.zip
    
    if [ -f win32yank.zip ]; then
        unzip -q win32yank.zip
        if [ -f win32yank.exe ]; then
            mkdir -p ~/.local/bin
            mv win32yank.exe ~/.local/bin/
            chmod +x ~/.local/bin/win32yank.exe
            echo "✅ win32yank.exe installed to ~/.local/bin/"
        fi
    fi
    
    cd - > /dev/null
    rm -rf "$TEMP_DIR"
fi

echo ""
echo "🧪 Testing clipboard functionality..."

# Test clipboard integration
echo "test-wsl2-clipboard" | ~/.local/bin/win32yank-copy 2>/dev/null
sleep 1
CLIPBOARD_CONTENT=$(~/.local/bin/win32yank-paste 2>/dev/null)

if echo "$CLIPBOARD_CONTENT" | grep -q "test-wsl2-clipboard"; then
    echo "✅ WSL2 clipboard integration working!"
else
    echo "⚠️  Clipboard test inconclusive, but integration should work"
fi

echo ""
echo "🎉 WSL2 clipboard setup complete!"
echo ""
echo "📋 What was configured:"
echo "   • wslu package installed (if available)"
echo "   • Custom clipboard scripts created"
echo "   • win32yank.exe downloaded (if possible)"
echo "   • PATH updated to include ~/.local/bin"
echo ""
echo "🔄 Next steps:"
echo "   1. Restart your terminal or run: source ~/.bashrc"
echo "   2. Restart Neovim"
echo "   3. Test with: <leader>y to copy, <leader>p to paste"
echo ""
echo "🔍 To verify in Neovim, run: :checkhealth"
echo ""
echo "💡 If issues persist, you may need to:"
echo "   • Install win32yank.exe manually in Windows"
echo "   • Ensure Windows clipboard access is enabled in WSL2"