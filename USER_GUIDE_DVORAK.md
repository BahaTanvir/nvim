# 📚 Ultimate Neovim User Guide - Dvorak Edition

**Welcome to Neovim with Dvorak keyboard support!** This comprehensive guide will help you master your new 10/10 Neovim setup specifically configured for Dvorak keyboard users.

## 🎹 Dvorak Layout Integration

Your Neovim setup has been specially configured to work seamlessly with the Dvorak keyboard layout while maintaining all the power and efficiency of Vim's modal editing.

## 📖 Table of Contents

1. [Dvorak-Specific Setup](#-dvorak-specific-setup)
2. [Dvorak Movement Keys](#-dvorak-movement-keys)
3. [Essential Dvorak Mappings](#-essential-dvorak-mappings)
4. [File Management (Dvorak)](#-file-management-dvorak)
5. [Editing with Dvorak](#-editing-with-dvorak)
6. [Development Features (Dvorak)](#-development-features-dvorak)
7. [AI-Powered Coding (Dvorak)](#-ai-powered-coding-dvorak)
8. [Git Integration (Dvorak)](#-git-integration-dvorak)
9. [Terminal Usage (Dvorak)](#-terminal-usage-dvorak)
10. [Dvorak-Specific Tips](#-dvorak-specific-tips)
11. [Troubleshooting Dvorak Setup](#-troubleshooting-dvorak-setup)

---

## 🎹 Dvorak-Specific Setup

### Key Philosophy

Your Dvorak setup maintains Vim's efficiency while adapting to the Dvorak layout:

- **Movement keys** are remapped to comfortable Dvorak positions
- **Common operations** remain intuitive on Dvorak
- **Muscle memory** from QWERTY Vim is preserved through logical remapping
- **All plugins** work seamlessly with Dvorak mappings

### Toggle Between Layouts

| Command         | Action                                    |
| --------------- | ----------------------------------------- |
| `:DvorakToggle` | Switch between Dvorak and QWERTY mappings |
| `<leader>td`    | Toggle Dvorak mappings                    |

---

## 🧭 Dvorak Movement Keys

### Basic Movement (Dvorak Layout)

Instead of QWERTY `hjkl`, use these Dvorak-optimized keys:

| Dvorak Key | Movement | QWERTY Equivalent |
| ---------- | -------- | ----------------- |
| `q`        | Left     | `h`               |
| `h`        | Down     | `j`               |
| `u`        | Up       | `k`               |
| `j`        | Right    | `l`               |

### Word Movement (Dvorak)

| Dvorak Key | Movement          | Description               |
| ---------- | ----------------- | ------------------------- |
| `t`        | Next word start   | More comfortable than `w` |
| `T`        | Next WORD start   | Skips punctuation         |
| `w`        | Next word end     | Natural Dvorak position   |
| `W`        | Next WORD end     | Skips punctuation         |
| `e`        | Previous word end | Backward word movement    |

### Line Movement (Dvorak)

| Key  | Movement                  |
| ---- | ------------------------- |
| `0`  | Beginning of line         |
| `^`  | First non-blank character |
| `$`  | End of line               |
| `gg` | Top of file               |
| `G`  | Bottom of file            |

### Screen Movement (Dvorak)

| Key      | Movement                 |
| -------- | ------------------------ |
| `Ctrl+d` | Scroll down half page    |
| `Ctrl+u` | Scroll up half page      |
| `_`      | Move to bottom of screen |

---

## 💡 Essential Dvorak Mappings

### Mode Switching (Dvorak-Optimized)

| Key  | Action           | Description                 |
| ---- | ---------------- | --------------------------- |
| `-`  | Exit Insert      | Escape key (in insert mode) |
| `\`  | Insert dash      | Type `-` character          |
| `,\` | Insert backslash | Type `\` character          |

### Insert Mode (Dvorak)

| Key | Action                      | QWERTY Equivalent |
| --- | --------------------------- | ----------------- |
| `n` | Insert before cursor        | `i`               |
| `N` | Insert at beginning of line | `I`               |
| `a` | Insert after cursor         | `a`               |
| `A` | Insert at end of line       | `A`               |
| `o` | New line below              | `o`               |
| `O` | New line above              | `O`               |

### Undo/Redo (Dvorak)

| Key      | Action    | QWERTY Equivalent |
| -------- | --------- | ----------------- |
| `i`      | Undo      | `u`               |
| `I`      | Undo line | `U`               |
| `Ctrl+r` | Redo      | `Ctrl+r`          |

### Search (Dvorak)

| Key        | Action          | QWERTY Equivalent |
| ---------- | --------------- | ----------------- |
| `/pattern` | Search forward  | `/pattern`        |
| `?pattern` | Search backward | `?pattern`        |
| `k`        | Next match      | `n`               |
| `K`        | Previous match  | `N`               |

### Character Finding (Dvorak)

| Key | Action                       | QWERTY Equivalent |
| --- | ---------------------------- | ----------------- |
| `l` | Find character (before)      | `t`               |
| `L` | Find character backward      | `T`               |
| `f` | Find character (on)          | `f`               |
| `F` | Find character backward (on) | `F`               |

---

## 📁 File Management (Dvorak)

### Telescope (Fuzzy Finder) - Dvorak Optimized

| Key          | Action       | Description                            |
| ------------ | ------------ | -------------------------------------- |
| `<leader>ff` | Find Files   | Search files by name                   |
| `<leader>fr` | Recent Files | Recently opened files                  |
| `<leader>fg` | Live Grep    | Search in files (Dvorak: 'g' for grep) |
| `<leader>fb` | Buffers      | Switch between open files              |
| `<leader>fh` | Help         | Search help documentation              |

### File Explorer (Dvorak)

| Key          | Action                    |
| ------------ | ------------------------- |
| `<leader>ee` | Toggle file tree          |
| `<leader>ef` | Find current file in tree |
| `<leader>ec` | Collapse all folders      |

### Buffer Management (Dvorak)

| Key          | Action          |
| ------------ | --------------- |
| `Shift+h`    | Previous buffer |
| `Shift+j`    | Next buffer     |
| `<leader>bd` | Delete buffer   |

---

## ✏️ Editing with Dvorak

### Delete Operations (No Yanking)

Your setup includes special delete operations that don't interfere with the clipboard:

| Key | Action                          |
| --- | ------------------------------- |
| `x` | Delete character (no yank)      |
| `X` | Delete backward (no yank)       |
| `d` | Delete motion (no yank)         |
| `D` | Delete to end of line (no yank) |

### Visual Selection (Dvorak)

1. Press `v` to start visual mode
2. Use Dvorak movement keys (`q`, `h`, `u`, `j`)
3. Perform action (`d` delete, `y` copy, etc.)

### Text Objects (Work with Dvorak)

| Command | Action                                                  |
| ------- | ------------------------------------------------------- |
| `dnt`   | Delete next word (Dvorak: `n` for insert, `t` for word) |
| `dn"`   | Delete inside quotes                                    |
| `da"`   | Delete around quotes                                    |
| `dnp`   | Delete inner paragraph                                  |

---

## 💻 Development Features (Dvorak)

### LSP Navigation (Dvorak-Optimized)

| Key  | Action                | Description             |
| ---- | --------------------- | ----------------------- |
| `gd` | Go to definition      | Jump to definition      |
| `gr` | Show references       | Show all references     |
| `gn` | Go to implementation  | Jump to implementation  |
| `gt` | Go to type definition | Jump to type definition |

### Code Actions (Dvorak)

| Key          | Action                                 |
| ------------ | -------------------------------------- |
| `<leader>ca` | Code actions                           |
| `<leader>rk` | Rename symbol (Dvorak: 'k' for rename) |
| `K`          | Show hover documentation               |

### Diagnostics (Dvorak)

| Key          | Action                |
| ------------ | --------------------- |
| `[d`         | Previous diagnostic   |
| `]d`         | Next diagnostic       |
| `<leader>e`  | Show line diagnostics |
| `<leader>xx` | Toggle Trouble        |

---

## 🤖 AI-Powered Coding (Dvorak)

### GitHub Copilot (Dvorak-Friendly)

| Key      | Action                                    |
| -------- | ----------------------------------------- |
| `Ctrl+j` | Accept suggestion (comfortable on Dvorak) |
| `Ctrl+h` | Next suggestion                           |
| `Ctrl+u` | Previous suggestion                       |
| `Ctrl+\` | Dismiss suggestion                        |

### CopilotChat (Dvorak)

| Key           | Action         |
| ------------- | -------------- |
| `<leader>ccq` | Quick chat     |
| `<leader>cce` | Explain code   |
| `<leader>ccr` | Review code    |
| `<leader>cct` | Generate tests |

---

## 🌿 Git Integration (Dvorak)

### Git Operations (Dvorak-Optimized)

| Key          | Action           |
| ------------ | ---------------- |
| `<leader>gg` | Open Lazygit     |
| `<leader>gd` | Git diff view    |
| `<leader>gh` | Git file history |

### Git Hunks (Dvorak)

| Key          | Action        |
| ------------ | ------------- |
| `]h`         | Next hunk     |
| `[h`         | Previous hunk |
| `<leader>hs` | Stage hunk    |
| `<leader>hr` | Reset hunk    |

---

## 🖥️ Terminal Usage (Dvorak)

### Terminal Operations

| Key          | Action                   |
| ------------ | ------------------------ |
| `Ctrl+\`     | Toggle floating terminal |
| `<leader>tf` | Floating terminal        |
| `<leader>tv` | Vertical terminal        |
| `<leader>th` | Horizontal terminal      |

### Terminal Navigation (Dvorak)

In terminal mode:
| Key | Action |
|-----|--------|
| `-` | Exit terminal mode (Dvorak escape) |
| `Ctrl+q/h/u/j` | Navigate between windows |

---

## 🎯 Dvorak-Specific Tips

### Building Muscle Memory

1. **Start with movement**: Master `q`, `h`, `u`, `j` for basic navigation
2. **Practice insert mode**: Use `n` instead of `i` for insert
3. **Use the toggle**: Switch to QWERTY if you need to reference standard docs
4. **Gradual adoption**: Learn one section at a time

### Dvorak Advantages in Vim

1. **Better finger placement**: Common operations are on home row
2. **Reduced finger travel**: Movement keys are more accessible
3. **Natural flow**: Dvorak's design complements Vim's efficiency
4. **Less strain**: More comfortable for extended coding sessions

### Common Dvorak Patterns

#### Text Navigation Flow

```
t w e    (word movements: next start, next end, previous end)
q h u j  (directional: left, down, up, right)
```

#### Editing Flow

```
n        (insert)
-        (escape)
i        (undo)
```

#### Search Flow

```
/pattern (search)
k        (next match)
K        (previous match)
```

---

## 🔧 Troubleshooting Dvorak Setup

### Common Issues

#### Keys Not Working as Expected

1. Check if Dvorak mappings are loaded:
   ```vim
   :verbose map q
   ```
2. Toggle Dvorak mode:
   ```vim
   :DvorakToggle
   ```

#### Plugin Conflicts

Some plugins might override Dvorak mappings. Use:

```vim
:map <key>
```

to see what a key is mapped to.

#### Switching Between Layouts

If you need to use QWERTY temporarily:

```vim
:DvorakToggle
" Use QWERTY mappings
:DvorakToggle  " Switch back to Dvorak
```

### Customizing Dvorak Mappings

Edit `lua/config/dvorak-keymaps.lua` to modify mappings:

```lua
-- Example: Change escape key from '-' to 'jk'
keymap.set("i", "jk", "<Esc>", { desc = "Exit insert mode" })
```

---

## 🚀 Dvorak Quick Reference

### Essential Movement (Dvorak)

```
q h u j     ← ↓ ↑ →
t w e       word movements
0 ^ $       line movements
gg G        file movements
```

### Essential Commands (Dvorak)

```
n a o       enter insert mode
v V Ctrl+v  visual modes
d y p       delete, yank, paste
i Ctrl+r    undo, redo
/ k K       search, next, previous
```

### Essential Leader Commands (Dvorak)

```
<leader>ff  find files
<leader>fg  search in files (grep)
<leader>ee  file explorer
<leader>gg  git interface
<leader>xx  diagnostics
<leader>w   save file
<leader>q   quit
```

---

## 🎮 Dvorak Learning Path

### Week 1: Basic Movement

- Master `q`, `h`, `u`, `j` for navigation
- Practice `-` for escape
- Learn `n` for insert mode

### Week 2: Word Movement

- Use `t`, `w`, `e` for word navigation
- Practice search with `k`, `K`
- Master undo with `i`

### Week 3: Advanced Editing

- Text objects with Dvorak keys
- Visual mode operations
- File management with Telescope

### Week 4: Development Features

- LSP navigation (`gd`, `gr`, `gn`, `gt`)
- Git operations (`<leader>gg`)
- AI features (`<leader>cc*`)

---

## 💡 Pro Tips for Dvorak Users

### 1. Leverage Dvorak's Strengths

- Home row advantage: Many operations are now on home row
- Natural finger flow: Dvorak's design reduces finger travel
- Comfortable coding: Less strain during long sessions

### 2. Customize Further

- Adjust mappings in `dvorak-keymaps.lua`
- Create your own leader key combinations
- Set up Dvorak-specific snippets

### 3. Share Configurations

- Your Dvorak setup can be toggled off for pair programming
- Document your custom mappings for team members
- Consider creating workspace-specific toggles

---

**Congratulations!** You now have a comprehensive guide to mastering Neovim with Dvorak keyboard layout. The setup maintains all the power of Vim while being comfortable and efficient for Dvorak users.

**Happy Dvorak coding!** 🎹✨

---

_💡 Tip: Use `:DvorakToggle` whenever you need to switch between Dvorak and QWERTY mappings. This is especially useful when pair programming or following QWERTY-based tutorials._

