# Complete Neovim Keymaps & Shortcuts Reference

**🎯 Leader Key: `<Space>` (Space bar)**

This is the **COMPLETE** list of ALL keymaps available in your Neovim configuration, including LazyVim defaults, custom configurations, and plugin-specific shortcuts.

---

## 🚀 Basic Navigation & Movement

### Cursor Movement (Enhanced)

| Key      | Mode | Action             | Description                            |
| -------- | ---- | ------------------ | -------------------------------------- |
| `j`      | n,x  | `gj` (if no count) | Down (display line aware)              |
| `k`      | n,x  | `gk` (if no count) | Up (display line aware)                |
| `<Down>` | n,x  | `gj` (if no count) | Down (display line aware)              |
| `<Up>`   | n,x  | `gk` (if no count) | Up (display line aware)                |
| `h`      | n    | Left               | Left (with cowboy protection)          |
| `l`      | n    | Right              | Right (with cowboy protection)         |
| `+`      | n    | Next line          | Next line (with cowboy protection)     |
| `-`      | n    | Previous line      | Previous line (with cowboy protection) |

### Window Navigation

| Key       | Mode | Action   | Description                   |
| --------- | ---- | -------- | ----------------------------- |
| `<C-h>`   | n    | `<C-w>h` | Go to Left Window             |
| `<C-j>`   | n    | `<C-w>j` | Go to Lower Window            |
| `<C-k>`   | n    | `<C-w>k` | Go to Upper Window            |
| `<C-l>`   | n    | `<C-w>l` | Go to Right Window            |
| `<Left>`  | n    | `<C-w>h` | Move to window left (custom)  |
| `<Right>` | n    | `<C-w>l` | Move to window right (custom) |
| `<Up>`    | n    | `<C-w>k` | Move to window above (custom) |
| `<Down>`  | n    | `<C-w>j` | Move to window below (custom) |

### Window Resizing

| Key         | Mode | Action               | Description            |
| ----------- | ---- | -------------------- | ---------------------- |
| `<C-Up>`    | n    | `resize +2`          | Increase Window Height |
| `<C-Down>`  | n    | `resize -2`          | Decrease Window Height |
| `<C-Left>`  | n    | `vertical resize -2` | Decrease Window Width  |
| `<C-Right>` | n    | `vertical resize +2` | Increase Window Width  |

### Line Movement

| Key     | Mode | Action               | Description                  |
| ------- | ---- | -------------------- | ---------------------------- |
| `<A-j>` | n    | `move .+1`           | Move Line Down               |
| `<A-k>` | n    | `move .-2`           | Move Line Up                 |
| `<A-j>` | i    | `<esc>m .+1<cr>==gi` | Move Line Down (insert mode) |
| `<A-k>` | i    | `<esc>m .-2<cr>==gi` | Move Line Up (insert mode)   |
| `<A-j>` | v    | Move selection down  | Move Selection Down          |
| `<A-k>` | v    | Move selection up    | Move Selection Up            |

---

## 📁 File & Buffer Management

### Buffer Navigation

| Key          | Mode | Action               | Description           |
| ------------ | ---- | -------------------- | --------------------- |
| `<S-h>`      | n    | `bprevious`          | Previous Buffer       |
| `<S-l>`      | n    | `bnext`              | Next Buffer           |
| `[b`         | n    | `bprevious`          | Previous Buffer       |
| `]b`         | n    | `bnext`              | Next Buffer           |
| `<leader>bb` | n    | Buffer picker        | Switch to Buffer      |
| `<leader>bd` | n    | Buffer delete        | Delete Buffer         |
| `<leader>bD` | n    | Buffer delete others | Delete Other Buffers  |
| `<leader>bl` | n    | Last buffer          | Switch to Last Buffer |
| `<leader>bp` | n    | Buffer pin           | Pin/Unpin Buffer      |

### File Operations

| Key          | Mode | Action             | Description                |
| ------------ | ---- | ------------------ | -------------------------- |
| `<leader>fn` | n    | New file           | New File                   |
| `<leader>ff` | n    | Find files         | Find Files                 |
| `<leader>fr` | n    | Recent files       | Recent Files               |
| `<leader>fR` | n    | Recent files (cwd) | Recent Files (Current Dir) |
| `<leader>fc` | n    | Find config        | Find Config Files          |
| `<leader>fg` | n    | Find in files      | Find in Files (Grep)       |
| `<leader>fw` | n    | Find word          | Find Word Under Cursor     |
| `<leader>fW` | n    | Find word (cwd)    | Find Word (Current Dir)    |
| `<leader>fs` | n    | Save file          | Save File                  |
| `<leader>fS` | n    | Save all           | Save All Files             |

### Custom File Pickers (Snacks)

| Key               | Mode | Action         | Description                       |
| ----------------- | ---- | -------------- | --------------------------------- |
| `<leader><space>` | n    | Smart picker   | Smart Open (files/buffers/recent) |
| `<leader>fp`      | n    | Plugin files   | Find Plugin Files                 |
| `<leader>sp`      | n    | Search plugins | Search Plugin Specs               |

---

## 🔍 Search & Replace

### Search Operations

| Key          | Mode | Action                  | Description                      |
| ------------ | ---- | ----------------------- | -------------------------------- |
| `<leader>sg` | n    | Live grep               | Search with Grep                 |
| `<leader>sw` | n    | Search word             | Search Word Under Cursor         |
| `<leader>sW` | n    | Search word (cwd)       | Search Word (Current Dir)        |
| `<leader>sr` | n    | Search replace          | Search and Replace               |
| `<leader>sR` | n    | Search replace (cwd)    | Search and Replace (Current Dir) |
| `<leader>ss` | n    | Goto symbol             | Goto Symbol                      |
| `<leader>sS` | n    | Goto symbol (workspace) | Goto Symbol (Workspace)          |
| `<leader>sc` | n    | Command history         | Command History                  |
| `<leader>sC` | n    | Commands                | Commands                         |
| `<leader>sh` | n    | Help tags               | Help Tags                        |
| `<leader>sH` | n    | Search highlights       | Search Highlight Groups          |
| `<leader>sk` | n    | Key maps                | Key Maps                         |
| `<leader>sM` | n    | Man pages               | Man Pages                        |
| `<leader>sm` | n    | Jump to mark            | Jump to Mark                     |
| `<leader>so` | n    | Options                 | Options                          |
| `<leader>sj` | n    | Jumplist                | Jumplist                         |
| `<leader>sl` | n    | Location list           | Location List                    |
| `<leader>sq` | n    | Quickfix list           | Quickfix List                    |

### Custom Search (Snacks)

| Key          | Mode | Action       | Description                     |
| ------------ | ---- | ------------ | ------------------------------- |
| `<leader>dd` | n    | Debug search | Search Debug Statements (bt/dd) |

---

## 🛠️ LSP (Language Server Protocol)

### Navigation

| Key  | Mode | Action                | Description           |
| ---- | ---- | --------------------- | --------------------- |
| `gd` | n    | Go to definition      | Go to Definition      |
| `gr` | n    | References            | References            |
| `gI` | n    | Go to implementation  | Go to Implementation  |
| `gy` | n    | Go to type definition | Go to Type Definition |
| `gD` | n    | Go to declaration     | Go to Declaration     |
| `K`  | n    | Hover                 | Hover Documentation   |
| `gK` | n    | Signature help        | Signature Help        |

### Code Actions

| Key          | Mode | Action           | Description                |
| ------------ | ---- | ---------------- | -------------------------- |
| `<leader>ca` | n,v  | Code action      | Code Action                |
| `<leader>cA` | n    | Source action    | Source Action              |
| `<leader>cc` | n    | Run codelens     | Run Codelens               |
| `<leader>cC` | n    | Refresh codelens | Refresh & Display Codelens |
| `<leader>cr` | n    | Rename           | Rename                     |
| `<leader>cR` | n    | Rename file      | Rename File                |
| `<leader>cf` | n,v  | Format           | Format Document/Range      |
| `<leader>cF` | n    | Format injected  | Format Injected Languages  |

### Diagnostics

| Key          | Mode | Action                | Description           |
| ------------ | ---- | --------------------- | --------------------- |
| `<leader>cd` | n    | Line diagnostics      | Line Diagnostics      |
| `<leader>cD` | n    | Workspace diagnostics | Workspace Diagnostics |
| `]d`         | n    | Next diagnostic       | Next Diagnostic       |
| `[d`         | n    | Previous diagnostic   | Previous Diagnostic   |
| `]e`         | n    | Next error            | Next Error            |
| `[e`         | n    | Previous error        | Previous Error        |
| `]w`         | n    | Next warning          | Next Warning          |
| `[w`         | n    | Previous warning      | Previous Warning      |

---

## 🎨 Code Editing & Formatting

### Text Manipulation

| Key     | Mode | Action             | Description                   |
| ------- | ---- | ------------------ | ----------------------------- |
| `<C-c>` | n    | `ciw`              | Change Inner Word (custom)    |
| `ga`    | n,v  | Align              | Align Text                    |
| `gA`    | n,v  | Align with preview | Align with Preview            |
| `J`     | n    | TSJToggle          | Toggle Split/Join Code Blocks |

### Comments

| Key   | Mode | Action              | Description             |
| ----- | ---- | ------------------- | ----------------------- |
| `gcc` | n    | Toggle comment      | Toggle Comment Line     |
| `gc`  | n,v  | Toggle comment      | Toggle Comment          |
| `gcO` | n    | Comment above       | Add Comment Above       |
| `gco` | n    | Comment below       | Add Comment Below       |
| `gcA` | n    | Comment end of line | Add Comment End of Line |

### Selection & Visual Mode

| Key     | Mode | Action    | Description      |
| ------- | ---- | --------- | ---------------- |
| `<C-a>` | n,v  | Increment | Increment Number |
| `<C-x>` | n,v  | Decrement | Decrement Number |
| `<`     | v    | Unindent  | Unindent         |
| `>`     | v    | Indent    | Indent           |

---

## 🌳 Git Integration

### Git Operations

| Key          | Mode | Action               | Description                |
| ------------ | ---- | -------------------- | -------------------------- |
| `<leader>gg` | n    | Lazygit              | Open Lazygit               |
| `<leader>gG` | n    | Lazygit (cwd)        | Open Lazygit (Current Dir) |
| `<leader>gb` | n    | Git blame line       | Git Blame Line             |
| `<leader>gB` | n    | Git blame file       | Git Blame File             |
| `<leader>gf` | n    | Lazygit file history | Lazygit File History       |
| `<leader>gl` | n    | Lazygit log          | Lazygit Log                |
| `<leader>gL` | n    | Lazygit log (cwd)    | Lazygit Log (Current Dir)  |

### Git Hunks

| Key           | Mode | Action          | Description       |
| ------------- | ---- | --------------- | ----------------- |
| `]h`          | n    | Next hunk       | Next Git Hunk     |
| `[h`          | n    | Previous hunk   | Previous Git Hunk |
| `<leader>ghs` | n,v  | Stage hunk      | Stage Hunk        |
| `<leader>ghr` | n,v  | Reset hunk      | Reset Hunk        |
| `<leader>ghS` | n    | Stage buffer    | Stage Buffer      |
| `<leader>ghu` | n    | Undo stage hunk | Undo Stage Hunk   |
| `<leader>ghR` | n    | Reset buffer    | Reset Buffer      |
| `<leader>ghp` | n    | Preview hunk    | Preview Hunk      |
| `<leader>ghd` | n,v  | Diff this       | Diff This         |
| `<leader>ghD` | n    | Diff this ~     | Diff This ~       |

### Git Browse

| Key          | Mode | Action     | Description           |
| ------------ | ---- | ---------- | --------------------- |
| `<leader>gB` | n,v  | Git browse | Browse Git Repository |

---

## 🔧 Plugin Management

### Lazy.nvim

| Key          | Mode | Action       | Description     |
| ------------ | ---- | ------------ | --------------- |
| `<leader>l`  | n    | Lazy         | Open Lazy       |
| `<leader>li` | n    | Lazy install | Install Plugins |
| `<leader>lu` | n    | Lazy update  | Update Plugins  |
| `<leader>lc` | n    | Lazy clean   | Clean Plugins   |
| `<leader>ls` | n    | Lazy sync    | Sync Plugins    |
| `<leader>lx` | n    | Lazy extras  | Lazy Extras     |
| `<leader>lr` | n    | Lazy restore | Restore Plugins |
| `<leader>lp` | n    | Lazy profile | Profile Startup |

### Mason (LSP/Tool Management)

| Key          | Mode | Action | Description |
| ------------ | ---- | ------ | ----------- |
| `<leader>cm` | n    | Mason  | Open Mason  |

---

## 🖥️ Terminal

### Terminal Operations

| Key          | Mode | Action          | Description            |
| ------------ | ---- | --------------- | ---------------------- |
| `<leader>tt` | n    | Terminal (root) | Terminal (Root Dir)    |
| `<leader>tT` | n    | Terminal (cwd)  | Terminal (Current Dir) |
| `<leader>tf` | n    | Terminal float  | Terminal Float         |
| `<C-/>`      | n    | Terminal (root) | Terminal (Root Dir)    |
| `<C-_>`      | n    | Terminal (root) | Terminal (Root Dir)    |
| `<esc><esc>` | t    | Normal mode     | Exit Terminal Mode     |
| `<C-/>`      | t    | Hide            | Hide Terminal          |
| `<C-_>`      | t    | Hide            | Hide Terminal          |

---

## 🎛️ UI & Interface

### UI Toggles

| Key          | Mode | Action                       | Description                  |
| ------------ | ---- | ---------------------------- | ---------------------------- |
| `<leader>uf` | n    | Toggle format                | Toggle Auto Format (Global)  |
| `<leader>uF` | n    | Toggle format (buffer)       | Toggle Auto Format (Buffer)  |
| `<leader>us` | n    | Toggle spelling              | Toggle Spelling              |
| `<leader>uw` | n    | Toggle wrap                  | Toggle Word Wrap             |
| `<leader>uL` | n    | Toggle relative line numbers | Toggle Relative Line Numbers |
| `<leader>ul` | n    | Toggle line numbers          | Toggle Line Numbers          |
| `<leader>ud` | n    | Toggle diagnostics           | Toggle Diagnostics           |
| `<leader>uc` | n    | Toggle conceallevel          | Toggle Conceallevel          |
| `<leader>uh` | n    | Toggle inlay hints           | Toggle Inlay Hints           |
| `<leader>uT` | n    | Toggle treesitter            | Toggle Treesitter Highlight  |
| `<leader>ub` | n    | Toggle background            | Toggle Background            |
| `<leader>ug` | n    | Toggle signcolumn            | Toggle Signcolumn            |
| `<leader>ui` | n    | Inspect pos                  | Inspect Position             |
| `<leader>uI` | n    | Inspect tree                 | Inspect Tree                 |

### Notifications & Messages

| Key           | Mode | Action                | Description               |
| ------------- | ---- | --------------------- | ------------------------- |
| `<leader>un`  | n    | Dismiss notifications | Dismiss All Notifications |
| `<leader>sn`  | n    | Noice                 | Noice                     |
| `<leader>snl` | n    | Noice last            | Noice Last Message        |
| `<leader>snh` | n    | Noice history         | Noice History             |
| `<leader>sna` | n    | Noice all             | Noice All                 |
| `<leader>snd` | n    | Noice dismiss         | Dismiss All               |

---

## 🗂️ Tabs & Windows

### Tab Management

| Key                  | Mode | Action           | Description      |
| -------------------- | ---- | ---------------- | ---------------- |
| `<leader><tab>l`     | n    | Last tab         | Last Tab         |
| `<leader><tab>o`     | n    | Close other tabs | Close Other Tabs |
| `<leader><tab>f`     | n    | First tab        | First Tab        |
| `<leader><tab><tab>` | n    | New tab          | New Tab          |
| `<leader><tab>]`     | n    | Next tab         | Next Tab         |
| `<leader><tab>d`     | n    | Close tab        | Close Tab        |
| `<leader><tab>[`     | n    | Previous tab     | Previous Tab     |

### Window Management

| Key          | Mode | Action        | Description        |
| ------------ | ---- | ------------- | ------------------ |
| `<leader>ww` | n    | Other window  | Other Window       |
| `<leader>wd` | n    | Delete window | Delete Window      |
| `<leader>w-` | n    | Split below   | Split Window Below |
| `<leader>w   | `    | n             | Split right        |
| `<leader>-`  | n    | Split below   | Split Window Below |
| `<leader>    | `    | n             | Split right        |

---

## 🔍 Quickfix & Location Lists

### Navigation

| Key          | Mode | Action            | Description       |
| ------------ | ---- | ----------------- | ----------------- |
| `<leader>xl` | n    | Location list     | Location List     |
| `<leader>xq` | n    | Quickfix list     | Quickfix List     |
| `[q`         | n    | Previous quickfix | Previous Quickfix |
| `]q`         | n    | Next quickfix     | Next Quickfix     |

---

## 💾 Session Management

### Sessions

| Key          | Mode | Action               | Description                |
| ------------ | ---- | -------------------- | -------------------------- |
| `<leader>qs` | n    | Restore session      | Restore Session            |
| `<leader>ql` | n    | Restore last session | Restore Last Session       |
| `<leader>qd` | n    | Don't save session   | Don't Save Current Session |

---

## 🎯 Custom Utilities & Tools

### Development Tools

| Key           | Mode | Action         | Description           |
| ------------- | ---- | -------------- | --------------------- |
| `<leader>t`   | n    | Todo scratch   | Todo List (Snacks)    |
| `<leader>dpd` | n    | Debug profiler | Toggle Debug Profiler |

### Snacks Picker Keys (Within Picker Interface)

| Key     | Mode | Action       | Description       |
| ------- | ---- | ------------ | ----------------- |
| `<C-i>` | n,i  | Toggle input | Toggle Input Mode |
| `<C-l>` | n,i  | Toggle lua   | Toggle Lua Filter |

### AI & Completion (Disabled)

| Key     | Mode | Action              | Description                                 |
| ------- | ---- | ------------------- | ------------------------------------------- |
| `<Tab>` | i    | Accept completion   | Accept AI Completion (minuet-ai - disabled) |
| `<A-a>` | i    | Accept line         | Accept One Line (minuet-ai - disabled)      |
| `<A-z>` | i    | Accept n lines      | Accept N Lines (minuet-ai - disabled)       |
| `<A-[>` | i    | Previous completion | Previous Completion (minuet-ai - disabled)  |
| `<A-]>` | i    | Next completion     | Next Completion (minuet-ai - disabled)      |
| `<A-e>` | i    | Dismiss completion  | Dismiss Completion (minuet-ai - disabled)   |

---

## 🚫 Disabled Features

### Currently Disabled Plugins/Features

- **peek.nvim**: `<leader>cp` - Markdown preview (requires deno)
- **zen-mode.nvim**: `<leader>z` - Zen mode (commented out)
- **codecompanion.nvim**: AI code companion (disabled)
- **minuet-ai.nvim**: AI completion (disabled)

---

## 🎮 Special Functions & Features

### Cowboy Protection

- Prevents rapid `hjkl+-` key presses (shows "Hold it Cowboy!" warning)
- Automatically resets after 2 seconds of inactivity

### Custom Functions Available Globally

- `dd(...)` - Debug inspect function
- `bt()` - Backtrace function
- `p(...)` - Profile function

### QMK Keyboard Support

- Automatic keymap visualization for `.keymap` files
- Custom key symbols and layout preview

---

## 📝 Insert Mode Shortcuts

### Basic Insert Mode

| Key     | Mode | Action      | Description               |
| ------- | ---- | ----------- | ------------------------- |
| `<C-h>` | i    | Delete char | Delete Character Backward |
| `<C-l>` | i    | Delete char | Delete Character Forward  |
| `<C-j>` | i    | New line    | New Line                  |
| `<C-k>` | i    | Delete line | Delete to End of Line     |

### Completion (blink.cmp)

| Key         | Mode | Action           | Description                    |
| ----------- | ---- | ---------------- | ------------------------------ |
| `<Tab>`     | i    | Accept/Next      | Accept Completion or Next Item |
| `<S-Tab>`   | i    | Previous         | Previous Completion Item       |
| `<C-Space>` | i    | Show completion  | Show Completion Menu           |
| `<C-e>`     | i    | Close completion | Close Completion Menu          |
| `<CR>`      | i    | Confirm          | Confirm Completion             |

---

## 🔧 Command Mode Shortcuts

### Command Line

| Key     | Mode | Action         | Description         |
| ------- | ---- | -------------- | ------------------- |
| `<C-a>` | c    | Beginning      | Go to Beginning     |
| `<C-e>` | c    | End            | Go to End           |
| `<C-f>` | c    | Command window | Open Command Window |

---

## 🎨 Visual Mode Shortcuts

### Visual Selection

| Key | Mode | Action   | Description           |
| --- | ---- | -------- | --------------------- |
| `<` | v    | Unindent | Unindent and Reselect |
| `>` | v    | Indent   | Indent and Reselect   |
| `p` | v    | Paste    | Paste Without Yanking |
| `P` | v    | Paste    | Paste Without Yanking |

---

## 🏃‍♂️ Quick Reference Summary

### Most Used Shortcuts

- `<Space>` - Leader key
- `<leader><space>` - Smart file picker
- `<leader>ff` - Find files
- `<leader>fg` - Find in files (grep)
- `<leader>bb` - Switch buffers
- `<C-h/j/k/l>` - Navigate windows
- `gd` - Go to definition
- `gr` - Find references
- `<leader>ca` - Code actions
- `gcc` - Toggle comment
- `<leader>gg` - Open Lazygit

### Emergency Exits

- `<Esc><Esc>` - Exit terminal mode
- `:q!` - Quit without saving
- `:qa!` - Quit all without saving
- `<C-c>` - Cancel operation

---

*This configuration uses LazyVim as the base with custom modifications. Use `:help` for built-in Vim help or `:WhichKey` to see available keymaps interactively.*