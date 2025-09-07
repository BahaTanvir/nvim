# VSCode Extensions for Your Neovim Setup

## **Essential Extensions**

### 🔧 **Core Neovim Integration**
- `asvetliakov.vscode-neovim` - **VSCode Neovim** (REQUIRED)
- `ms-vscode-remote.remote-wsl` - **WSL** (for your WSL2 setup)

### 🎨 **Themes (matching your colorscheme collection)**
- `enkia.tokyo-night` - **Tokyo Night** (matches your tokyonight fallback)
- `GitHub.github-vscode-theme` - **GitHub Theme** (light/dark variants)
- `dracula-theme.theme-dracula` - **Dracula** (matches your dracula.nvim)
- `jdinhlife.gruvbox` - **Gruvbox** (matches your gruvbox.nvim)
- `Catppuccin.catppuccin-vscode` - **Catppuccin** (matches your catppuccin)

## **Language Support (matching your LSP setup)**

### 🐍 **Python** (matching your basedpyright + ruff)
- `ms-python.python` - **Python**
- `ms-python.vscode-pylance` - **Pylance** (or use basedpyright)
- `charliermarsh.ruff` - **Ruff** (matches your ruff setup)

### 🌐 **Web Development**
- `ms-vscode.vscode-typescript-next` - **TypeScript**
- `bradlc.vscode-tailwindcss` - **Tailwind CSS**
- `esbenp.prettier-vscode` - **Prettier**

### 🦀 **Rust** (if you use it)
- `rust-lang.rust-analyzer` - **Rust Analyzer**

### 🔧 **Lua** (for your Neovim config)
- `JohnnyMorganz.stylua` - **StyLua** (matches your stylua.toml)
- `sumneko.lua` - **Lua Language Server**

## **Development Tools**

### 📁 **File Management**
- `alefragnani.project-manager` - **Project Manager**
- `ms-vscode.vscode-json` - **JSON** support

### 🔍 **Search & Navigation** (complementing your telescope setup)
- `ms-vscode.vscode-fuzzy-search` - **Fuzzy Search**
- `usernamehw.errorlens` - **Error Lens** (inline diagnostics)

### 🔄 **Git** (complementing your git workflow)
- `eamodio.gitlens` - **GitLens** (enhanced git features)
- `mhutchie.git-graph` - **Git Graph**
- `donjayamanne.githistory` - **Git History**

### 🐛 **Debugging**
- `ms-vscode.vscode-js-debug` - **JavaScript Debugger**
- `ms-python.debugpy` - **Python Debugger**

## **Productivity (matching your workflow)**

### ⚡ **Performance & Utilities**
- `ms-vscode.vscode-typescript-next` - **TypeScript** (faster than built-in)
- `bradlc.vscode-tailwindcss` - **Tailwind** (if you use it)
- `ms-vscode.live-server` - **Live Server**

### 📝 **Documentation**
- `yzhang.markdown-all-in-one` - **Markdown All in One**
- `DavidAnson.vscode-markdownlint` - **Markdown Lint**

### 🎯 **Focus & Zen Mode**
- `johnpapa.vscode-peacock` - **Peacock** (workspace colors)
- `oderwat.indent-rainbow` - **Indent Rainbow**

## **Optional but Useful**

### 🔧 **DevOps**
- `ms-vscode-remote.remote-containers` - **Dev Containers**
- `ms-kubernetes-tools.vscode-kubernetes-tools` - **Kubernetes**
- `ms-vscode.vscode-docker` - **Docker**

### 🎨 **UI Enhancements**
- `PKief.material-icon-theme` - **Material Icon Theme**
- `antfu.icons-carbon` - **Carbon Icons**

## **Installation Commands**

```bash
# Essential extensions
code --install-extension asvetliakov.vscode-neovim
code --install-extension ms-vscode-remote.remote-wsl
code --install-extension enkia.tokyo-night

# Language support
code --install-extension ms-python.python
code --install-extension charliermarsh.ruff
code --install-extension JohnnyMorganz.stylua

# Git tools
code --install-extension eamodio.gitlens
code --install-extension mhutchie.git-graph

# Productivity
code --install-extension esbenp.prettier-vscode
code --install-extension usernamehw.errorlens
```

## **Extensions to AVOID** (conflicts with Neovim)
- ❌ **Vim** extension (conflicts with vscode-neovim)
- ❌ **IntelliCode** (can interfere with Neovim completion)
- ❌ **Bracket Pair Colorizer** (built-in now, causes performance issues)