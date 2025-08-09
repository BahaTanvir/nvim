# 📚 Ultimate Neovim User Guidelines

**Welcome to Neovim!** This comprehensive guide will help you master your new 10/10 Neovim setup, whether you're completely new to Vim/Neovim or transitioning from other editors.

## 📖 Table of Contents

1. [Getting Started](#-getting-started)
2. [Neovim Basics](#-neovim-basics)
3. [Essential Concepts](#-essential-concepts)
4. [Navigation & Movement](#-navigation--movement)
5. [File Management](#-file-management)
6. [Editing Text](#-editing-text)
7. [Search & Replace](#-search--replace)
8. [Development Features](#-development-features)
9. [AI-Powered Coding](#-ai-powered-coding)
10. [Git Integration](#-git-integration)
11. [Terminal Usage](#-terminal-usage)
12. [Customization](#-customization)
13. [Troubleshooting](#-troubleshooting)
14. [Advanced Tips](#-advanced-tips)

---

## 🚀 Getting Started

### First Launch

1. **Open Neovim**:

   ```bash
   nvim
   ```

2. **First-time Setup**:
   - Plugins will automatically install (wait for completion)
   - You'll see the Alpha dashboard with menu options
   - Press `q` to quit if needed, or explore the menu

3. **Health Check**:
   ```vim
   :checkhealth
   ```
   This verifies all components are working correctly.

### Understanding the Interface

When you open Neovim, you'll see:

- **Alpha Dashboard**: Welcome screen with quick actions
- **Status Line** (bottom): Shows current mode, file info, git status
- **Buffer Line** (top): Shows open files as tabs
- **Sign Column** (left): Shows git changes, diagnostics, breakpoints

---

## 🎯 Neovim Basics

### Modes Explained

Neovim has different modes for different tasks:

#### **Normal Mode** (Default)

- **Purpose**: Navigate and manipulate text
- **Indicator**: Cursor is a block
- **How to enter**: Press `Esc` or `jk` or `kj`

#### **Insert Mode**

- **Purpose**: Type and edit text like a regular editor
- **Indicator**: Cursor is a line, status shows `-- INSERT --`
- **How to enter**: Press `i`, `a`, `o`, or `A`

#### **Visual Mode**

- **Purpose**: Select text for operations
- **Indicator**: Text is highlighted, status shows `-- VISUAL --`
- **How to enter**: Press `v` (character), `V` (line), or `Ctrl+v` (block)

#### **Command Mode**

- **Purpose**: Execute commands
- **Indicator**: `:` appears at bottom
- **How to enter**: Press `:` in Normal mode

### Basic Commands

| Command  | Action      | Description             |
| -------- | ----------- | ----------------------- |
| `:w`     | Save        | Write file to disk      |
| `:q`     | Quit        | Close current window    |
| `:wq`    | Save & Quit | Write and close         |
| `:q!`    | Force Quit  | Quit without saving     |
| `u`      | Undo        | Undo last change        |
| `Ctrl+r` | Redo        | Redo last undone change |

---

## 💡 Essential Concepts

### Leader Key

The **Leader Key** is your gateway to custom commands. In this setup, it's the **Spacebar**.

- Press `<Space>` and wait - you'll see a menu of available commands
- Example: `<Space>ff` opens file finder
- Example: `<Space>w` saves the file

### Buffers vs Windows vs Tabs

- **Buffer**: A file loaded in memory (like an open document)
- **Window**: A view into a buffer (like a pane)
- **Tab**: A collection of windows (like a workspace)

### File Explorer

- Press `<leader>ee` (Space + e + e) to toggle the file tree
- Use `j/k` to move up/down
- Press `Enter` to open files
- Press `a` to create new files/folders

---

## 🧭 Navigation & Movement

### Basic Movement

Instead of arrow keys, use:

| Key | Movement |
| --- | -------- |
| `h` | Left     |
| `j` | Down     |
| `k` | Up       |
| `l` | Right    |

### Word Movement

| Key | Movement                        |
| --- | ------------------------------- |
| `w` | Next word start                 |
| `e` | Next word end                   |
| `b` | Previous word start             |
| `W` | Next WORD (ignores punctuation) |

### Line Movement

| Key  | Movement                  |
| ---- | ------------------------- |
| `0`  | Beginning of line         |
| `^`  | First non-blank character |
| `$`  | End of line               |
| `gg` | Top of file               |
| `G`  | Bottom of file            |
| `5G` | Go to line 5              |

### Screen Movement

| Key      | Movement              |
| -------- | --------------------- |
| `Ctrl+d` | Scroll down half page |
| `Ctrl+u` | Scroll up half page   |
| `Ctrl+f` | Page down             |
| `Ctrl+b` | Page up               |
| `zz`     | Center current line   |

### Flash Navigation (Super Fast!)

This setup includes Flash.nvim for lightning-fast movement:

| Key | Action                       |
| --- | ---------------------------- |
| `s` | Jump to any visible location |
| `S` | Jump to treesitter nodes     |

**How to use Flash**:

1. Press `s`
2. Type 1-2 characters of where you want to go
3. Press the highlighted letter to jump there

---

## 📁 File Management

### Opening Files

#### Telescope (Fuzzy Finder)

| Key          | Action       | Description               |
| ------------ | ------------ | ------------------------- |
| `<leader>ff` | Find Files   | Search files by name      |
| `<leader>fr` | Recent Files | Recently opened files     |
| `<leader>fb` | Buffers      | Switch between open files |
| `<leader>fh` | Help         | Search help documentation |

**How to use Telescope**:

1. Press `<leader>ff`
2. Start typing filename
3. Use `Ctrl+j/k` to navigate results
4. Press `Enter` to open

#### File Explorer

| Key          | Action                    |
| ------------ | ------------------------- |
| `<leader>ee` | Toggle file tree          |
| `<leader>ef` | Find current file in tree |
| `<leader>ec` | Collapse all folders      |

### Managing Buffers (Open Files)

| Key          | Action             |
| ------------ | ------------------ |
| `Shift+h`    | Previous buffer    |
| `Shift+l`    | Next buffer        |
| `<leader>bd` | Delete buffer      |
| `<leader>ba` | Delete all buffers |

### Working with Multiple Files

#### Splits

| Key          | Action              |
| ------------ | ------------------- |
| `<leader>sv` | Split vertically    |
| `<leader>sh` | Split horizontally  |
| `<leader>se` | Make splits equal   |
| `<leader>sx` | Close current split |

#### Window Navigation

| Key      | Action             |
| -------- | ------------------ |
| `Ctrl+h` | Go to left window  |
| `Ctrl+j` | Go to down window  |
| `Ctrl+k` | Go to up window    |
| `Ctrl+l` | Go to right window |

---

## ✏️ Editing Text

### Entering Insert Mode

| Key | Action                      |
| --- | --------------------------- |
| `i` | Insert before cursor        |
| `a` | Insert after cursor         |
| `I` | Insert at beginning of line |
| `A` | Insert at end of line       |
| `o` | New line below              |
| `O` | New line above              |

### Exiting Insert Mode

| Key   | Action                       |
| ----- | ---------------------------- |
| `Esc` | Exit to Normal mode          |
| `jk`  | Exit to Normal mode (custom) |
| `kj`  | Exit to Normal mode (custom) |

### Basic Editing Commands

| Key  | Action                        |
| ---- | ----------------------------- |
| `x`  | Delete character under cursor |
| `dd` | Delete entire line            |
| `yy` | Copy (yank) entire line       |
| `p`  | Paste after cursor            |
| `P`  | Paste before cursor           |

### Text Objects

Text objects let you operate on logical units:

| Command | Action                                  |
| ------- | --------------------------------------- |
| `diw`   | Delete inner word                       |
| `daw`   | Delete a word (including spaces)        |
| `di"`   | Delete inside quotes                    |
| `da"`   | Delete around quotes (including quotes) |
| `dip`   | Delete inner paragraph                  |
| `dit`   | Delete inner tag (HTML/XML)             |

### Visual Selection

1. Press `v` to start visual mode
2. Move cursor to select text
3. Perform action (`d` delete, `y` copy, etc.)

#### Visual Mode Types

| Key      | Selection Type |
| -------- | -------------- |
| `v`      | Character-wise |
| `V`      | Line-wise      |
| `Ctrl+v` | Block-wise     |

### Advanced Editing

#### Surround Operations

| Key                | Action          |
| ------------------ | --------------- |
| `ys{motion}{char}` | Add surround    |
| `ds{char}`         | Delete surround |
| `cs{old}{new}`     | Change surround |

Examples:

- `ysiw"` - Surround word with quotes
- `ds"` - Delete surrounding quotes
- `cs"'` - Change double quotes to single quotes

#### Multiple Cursors (Visual Block)

1. Press `Ctrl+v` to enter visual block mode
2. Select multiple lines
3. Press `I` to insert at beginning of each line
4. Type your text
5. Press `Esc` to apply to all lines

---

## 🔍 Search & Replace

### Basic Search

| Key        | Action                              |
| ---------- | ----------------------------------- |
| `/pattern` | Search forward                      |
| `?pattern` | Search backward                     |
| `n`        | Next match                          |
| `N`        | Previous match                      |
| `*`        | Search word under cursor            |
| `#`        | Search word under cursor (backward) |

### Clear Search Highlighting

| Key          | Action                  |
| ------------ | ----------------------- |
| `<leader>nh` | Clear search highlights |

### Advanced Search with Telescope

| Key          | Action                      |
| ------------ | --------------------------- |
| `<leader>fs` | Live grep (search in files) |
| `<leader>fS` | Live grep with args         |
| `<leader>fc` | Find word under cursor      |

### Find and Replace

#### Current File

```vim
:%s/old/new/g        " Replace all in file
:%s/old/new/gc       " Replace with confirmation
:s/old/new/g         " Replace in current line
```

#### Multiple Files (with Spectre)

| Key          | Action                    |
| ------------ | ------------------------- |
| `<leader>sr` | Open search/replace panel |

### Replace Word Under Cursor

| Key         | Action                             |
| ----------- | ---------------------------------- |
| `<leader>s` | Replace word under cursor globally |

---

## 💻 Development Features

### Language Server Protocol (LSP)

LSP provides intelligent code features:

#### Navigation

| Key  | Action                |
| ---- | --------------------- |
| `gd` | Go to definition      |
| `gD` | Go to declaration     |
| `gi` | Go to implementation  |
| `gt` | Go to type definition |
| `gR` | Show references       |

#### Code Actions

| Key          | Action                   |
| ------------ | ------------------------ |
| `<leader>ca` | Code actions             |
| `<leader>rn` | Rename symbol            |
| `K`          | Show hover documentation |

#### Diagnostics

| Key          | Action                             |
| ------------ | ---------------------------------- |
| `[d`         | Previous diagnostic                |
| `]d`         | Next diagnostic                    |
| `<leader>e`  | Show line diagnostics              |
| `<leader>xx` | Toggle Trouble (diagnostics panel) |

### Code Completion

- Start typing - suggestions appear automatically
- Use `Ctrl+j/k` to navigate suggestions
- Press `Enter` to accept
- Press `Ctrl+e` to dismiss

### Formatting

| Key          | Action      |
| ------------ | ----------- |
| `<leader>mp` | Format file |

Auto-formatting happens on save for most file types.

### Testing

| Key          | Action                     |
| ------------ | -------------------------- |
| `<leader>tt` | Run tests for current file |
| `<leader>tr` | Run nearest test           |
| `<leader>ts` | Toggle test summary        |
| `<leader>to` | Show test output           |

### Debugging

| Key          | Action                   |
| ------------ | ------------------------ |
| `F5`         | Continue/Start debugging |
| `F10`        | Step over                |
| `F11`        | Step into                |
| `F12`        | Step out                 |
| `<leader>db` | Toggle breakpoint        |
| `<leader>du` | Toggle debug UI          |

---

## 🤖 AI-Powered Coding

### GitHub Copilot

#### In Insert Mode

| Key      | Action              |
| -------- | ------------------- |
| `Ctrl+l` | Accept suggestion   |
| `Ctrl+j` | Next suggestion     |
| `Ctrl+k` | Previous suggestion |
| `Ctrl+\` | Dismiss suggestion  |

#### How to Use Copilot

1. Start typing a comment or function
2. Copilot will suggest completions
3. Accept with `Ctrl+l` or continue typing

### CopilotChat (AI Assistant)

| Key           | Action              |
| ------------- | ------------------- |
| `<leader>ccq` | Quick chat          |
| `<leader>cce` | Explain code        |
| `<leader>ccr` | Review code         |
| `<leader>cct` | Generate tests      |
| `<leader>ccv` | Chat with selection |

#### How to Use CopilotChat

1. Select code (visual mode) or place cursor
2. Press `<leader>cce` to explain code
3. Or press `<leader>ccq` and type your question

### Refactoring

| Key          | Action                   |
| ------------ | ------------------------ |
| `<leader>re` | Extract function         |
| `<leader>rv` | Extract variable         |
| `<leader>ri` | Inline variable          |
| `<leader>rr` | Show refactoring options |

---

## 🌿 Git Integration

### Git Signs (In-Buffer)

| Key          | Action        |
| ------------ | ------------- |
| `]h`         | Next hunk     |
| `[h`         | Previous hunk |
| `<leader>hs` | Stage hunk    |
| `<leader>hr` | Reset hunk    |
| `<leader>hp` | Preview hunk  |
| `<leader>hb` | Blame line    |

### Lazygit (Full Git Interface)

| Key          | Action       |
| ------------ | ------------ |
| `<leader>gg` | Open Lazygit |

#### Lazygit Navigation

- `j/k` - Move up/down
- `Enter` - Select/Open
- `Space` - Stage/Unstage
- `c` - Commit
- `P` - Push
- `p` - Pull
- `q` - Quit

### Git with Telescope

| Key          | Action       |
| ------------ | ------------ |
| `<leader>gc` | Git commits  |
| `<leader>gb` | Git branches |
| `<leader>gs` | Git status   |

### Advanced Git

| Key          | Action                          |
| ------------ | ------------------------------- |
| `<leader>gd` | Git diff view                   |
| `<leader>gh` | Git file history                |
| `<leader>gn` | Neogit (advanced git interface) |

### Conflict Resolution

When you have merge conflicts:
| Key | Action |
|-----|--------|
| `<leader>gco` | Choose ours |
| `<leader>gct` | Choose theirs |
| `<leader>gcb` | Choose both |
| `]x` | Next conflict |
| `[x` | Previous conflict |

---

## 🖥️ Terminal Usage

### Opening Terminals

| Key          | Action                   |
| ------------ | ------------------------ |
| `Ctrl+\`     | Toggle floating terminal |
| `<leader>tf` | Floating terminal        |
| `<leader>tv` | Vertical terminal        |
| `<leader>th` | Horizontal terminal      |

### Terminal Navigation

| Key            | Action                   |
| -------------- | ------------------------ |
| `Esc`          | Exit terminal mode       |
| `Ctrl+h/j/k/l` | Navigate between windows |

### Special Terminals

| Key          | Action      |
| ------------ | ----------- |
| `<leader>gg` | Lazygit     |
| `<leader>tn` | Node REPL   |
| `<leader>tp` | Python REPL |

---

## 🎨 Customization

### Changing Colorschemes

Available themes:

- Catppuccin (default)
- Tokyo Night
- Kanagawa
- Rose Pine
- Nightfox

To switch:

```vim
:colorscheme tokyonight
:colorscheme kanagawa
:colorscheme rose-pine
:colorscheme nightfox
```

### Session Management

| Key          | Action             |
| ------------ | ------------------ |
| `<leader>qs` | Restore session    |
| `<leader>ql` | Load last session  |
| `<leader>qd` | Don't save session |

### Useful Toggles

| Key          | Action                  |
| ------------ | ----------------------- |
| `<leader>uw` | Toggle word wrap        |
| `<leader>un` | Toggle line numbers     |
| `<leader>ur` | Toggle relative numbers |
| `<leader>us` | Toggle spell check      |
| `<leader>z`  | Toggle zen mode         |

### Plugin Management

| Command        | Action                  |
| -------------- | ----------------------- |
| `:Lazy`        | Open plugin manager     |
| `:Mason`       | Open LSP/tool installer |
| `:checkhealth` | Check system health     |

---

## 🔧 Troubleshooting

### Common Issues

#### "Command not found" errors

```vim
:Mason
```

Install missing tools through Mason.

#### LSP not working

```vim
:LspInfo
```

Check if language server is attached.

#### Slow startup

```vim
:StartupTime
```

Analyze startup performance.

#### Plugin issues

```vim
:Lazy
```

Update or reinstall plugins.

### Getting Help

| Command         | Action                     |
| --------------- | -------------------------- |
| `:help {topic}` | Get help on topic          |
| `<leader>fh`    | Search help with Telescope |
| `:checkhealth`  | System diagnostics         |

### Key Conflicts

If a key doesn't work:

1. Check which-key menu (`<leader>` and wait)
2. Use `:map {key}` to see what it's mapped to
3. Check `:help {key}` for default behavior

---

## 🚀 Advanced Tips

### Productivity Boosters

#### 1. Use Text Objects

Instead of: `ddddd` (delete 5 lines)
Use: `d4j` (delete down 4 lines)

#### 2. Combine Motions

- `c2w` - Change 2 words
- `d$` - Delete to end of line
- `y4j` - Copy 4 lines down

#### 3. Use Registers

- `"ay` - Copy to register 'a'
- `"ap` - Paste from register 'a'
- `"0p` - Paste last yanked text

#### 4. Macros

- `qa` - Start recording macro 'a'
- `q` - Stop recording
- `@a` - Play macro 'a'
- `@@` - Repeat last macro

#### 5. Marks

- `ma` - Set mark 'a'
- `'a` - Jump to mark 'a'
- `''` - Jump to previous position

### Workflow Tips

#### 1. Project Workflow

1. `<leader>fp` - Switch to project
2. `<leader>qs` - Restore session
3. `<leader>ee` - Open file tree
4. `<leader>ff` - Find files

#### 2. Coding Workflow

1. `<leader>ff` - Open file
2. `gd` - Go to definition
3. `<leader>ca` - Code actions
4. `<leader>tt` - Run tests

#### 3. Git Workflow

1. `<leader>gg` - Open Lazygit
2. Stage changes with `Space`
3. Commit with `c`
4. Push with `P`

### Learning Path

#### Week 1: Basics

- Master basic movement (`hjkl`)
- Learn modes (Normal, Insert, Visual)
- Practice file operations (`:w`, `:q`)

#### Week 2: Navigation

- Use Flash navigation (`s`)
- Master Telescope (`<leader>ff`, `<leader>fs`)
- Learn window management

#### Week 3: Editing

- Text objects (`diw`, `da"`)
- Visual mode operations
- Basic search and replace

#### Week 4: Development

- LSP features (`gd`, `<leader>ca`)
- Git integration (`<leader>gg`)
- AI features (`<leader>cc*`)

### Muscle Memory Tips

1. **Disable arrow keys** (already done in this config)
2. **Use `jk` instead of Esc** (configured)
3. **Practice daily** - even 10 minutes helps
4. **Use vimtutor**: Run `vimtutor` in terminal
5. **One new command per day** - don't overwhelm yourself

---

## 📚 Additional Resources

### Learning Vim/Neovim

- `:Tutor` - Built-in Vim tutorial
- [Vim Adventures](https://vim-adventures.com/) - Game to learn Vim
- [Practical Vim](https://pragprog.com/titles/dnvim2/practical-vim-second-edition/) - Excellent book

### Neovim-Specific

- [Neovim Documentation](https://neovim.io/doc/)
- [Awesome Neovim](https://github.com/rockerBOO/awesome-neovim) - Plugin list

### This Configuration

- Check `README.md` for setup details
- Use `:help` for built-in documentation
- Explore `lua/plugins/` for plugin configurations

---

## 🎨 Theme and Appearance Management

### Available Themes
Your Neovim setup comes with several beautiful themes:

- **Catppuccin** (default) - Modern, soothing pastel theme
  - Variants: `latte` (light), `frappe`, `macchiato`, `mocha` (dark)
- **Tokyo Night** - Dark theme inspired by Tokyo's neon lights
  - Variants: `night`, `storm`, `day`, `moon`
- **Kanagawa** - Theme inspired by famous Japanese artwork
- **Nightfox** - Highly customizable theme family
- **Rose Pine** - All natural pine, faux fur and a bit of soho vibes
  - Variants: `main`, `moon`, `dawn`

### Changing Themes

#### Method 1: Command Line (Temporary)
```vim
:colorscheme catppuccin
:colorscheme tokyonight
:colorscheme kanagawa
:colorscheme nightfox
:colorscheme rose-pine
```

#### Method 2: Permanent Change
Edit `lua/plugins/colorschemes.lua`:

1. **Change default theme:**
   ```lua
   -- Change line 54 from:
   vim.cmd.colorscheme("catppuccin")
   -- To your preferred theme:
   vim.cmd.colorscheme("tokyonight")
   ```

2. **Change Catppuccin variant:**
   ```lua
   -- Change line 7 from:
   flavour = "mocha", -- latte, frappe, macchiato, mocha
   -- To:
   flavour = "frappe", -- or latte, macchiato
   ```

3. **Change Tokyo Night variant:**
   ```lua
   -- In the tokyonight section, change:
   opts = { style = "storm" }, -- night, storm, day, moon
   ```

### Customizing Appearance

#### Remove Vertical Lines (Column Guides)
Edit `lua/config/options.lua` line 21:
```lua
-- Remove both lines:
opt.colorcolumn = ""

-- Keep only 80-character guide:
opt.colorcolumn = "80"

-- Custom positions:
opt.colorcolumn = "100,120"
```

#### Toggle Transparency
Edit `lua/plugins/colorschemes.lua` line 12:
```lua
transparent_background = true,  -- Enable transparency
```

#### Customize Line Numbers
Edit `lua/config/options.lua`:
```lua
opt.number = true              -- Absolute line numbers
opt.relativenumber = false     -- Disable relative numbers
-- or
opt.number = false             -- No line numbers
opt.relativenumber = true      -- Only relative numbers
```

### Theme-Related Keymaps

| Key | Action | Description |
|-----|--------|-------------|
| `<leader>th` | `:Telescope colorscheme<CR>` | Browse and preview themes |
| `<leader>tb` | Toggle background | Switch between light/dark |

### Quick Theme Switching Function
Add this to your `lua/config/keymaps.lua` for quick theme cycling:

```lua
-- Theme cycling function
local themes = {"catppuccin", "tokyonight", "kanagawa", "nightfox", "rose-pine"}
local current_theme = 1

vim.keymap.set("n", "<leader>tn", function()
  current_theme = current_theme % #themes + 1
  vim.cmd.colorscheme(themes[current_theme])
  vim.notify("Theme: " .. themes[current_theme])
end, { desc = "Next theme" })
```

### Troubleshooting Themes

#### Theme Not Loading
1. Check if theme is installed: `:Lazy`
2. Reload configuration: `:source %`
3. Check for errors: `:messages`

#### Colors Look Wrong
1. Ensure terminal supports true colors
2. Check `termguicolors` setting: `:set termguicolors?`
3. For WSL/SSH: Configure terminal emulator properly

#### Performance Issues
1. Disable transparency if using
2. Reduce integrations in theme config
3. Use simpler themes like default vim colors

## 🎯 Quick Reference Card

### Essential Movements

```
h j k l     ← ↓ ↑ →
w e b       word movements
0 ^ $       line movements
gg G        file movements
Ctrl+d/u    page movements
```

### Essential Commands

```
i a o       enter insert mode
v V Ctrl+v  visual modes
d y p       delete, yank, paste
u Ctrl+r    undo, redo
/ n N       search, next, previous
```

### Essential Leader Commands

```
<leader>ff  find files
<leader>fs  search in files
<leader>ee  file explorer
<leader>gg  git interface
<leader>xx  diagnostics
<leader>w   save file
<leader>q   quit
```

---

**Congratulations!** You now have a comprehensive guide to mastering your ultimate Neovim setup. Remember: Neovim has a learning curve, but the productivity gains are enormous. Start with the basics and gradually incorporate more advanced features.

**Happy coding!** 🚀✨

---

_💡 Tip: Keep this guide handy and refer to it often. Bookmark sections you use frequently, and don't try to learn everything at once. Focus on one section per week for the best learning experience._

