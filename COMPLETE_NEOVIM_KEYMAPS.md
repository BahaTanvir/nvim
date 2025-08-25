# Complete Neovim Keymaps & Shortcuts Reference

This document lists all custom keymaps and shortcuts in this Neovim configuration.

## Quick Reference Index

**Movement & Navigation (Dvorak)**
- [Dvorak Layout Adaptations](#dvorak-layout-adaptations)

**Editing & Text Operations**
- [Basic Editing](#basic-editing)
- [Alignment & Comments](#alignment-comments)

**File Operations & Pickers**
- [Files, Buffers, Pickers](#files-buffers-pickers)

**LSP & Code Intelligence**
- [LSP Operations](#lsp-operations)

**Git Integration**
- [Git Operations](#git-operations)

**Terminal & System**
- [Terminal Operations](#terminal-operations)

**Window & Buffer Management**
- [Window Management](#window-management)

**Custom Utilities**
- [Debug & Development](#debug--development)

---

## Dvorak Layout Adaptations

This configuration is designed for Dvorak keyboard layout users. The mappings adapt Vim's default movement keys to be more comfortable on Dvorak.

### Core Movement (remapped for Dvorak)
- h -> Move down (visual line)
- u -> Move up (visual line)  
- j -> Move right
- J -> Move left
- t -> Next word
- T -> Next WORD
- w -> End of word
- W -> End of WORD
- e -> End of previous word

### Position Jumps & Navigation
- l -> Jump back to last position (``)
- L -> Jump to last change (``.)
- E -> Jump to mark m (`m)
- k -> Next search match (n)
- K -> Previous search match (N)

### Insert Mode Alternatives
- n -> Insert before cursor (i)
- N -> Insert at beginning of line (I)
- i -> Undo (u)
- I -> Undo line (U)

### Special Escape Mappings (Insert Mode)
- `-` -> Escape (with completion abort)
- `ht` -> Fast escape chord
- `<M-->` -> Insert actual dash character

### Delete Operations (without yanking)
- x -> Delete char without yanking (`"_x`)
- X -> Backward delete without yanking (`"_X`)
- d -> Delete without yanking (`"_d`)
- D -> Delete to EOL/lines without yanking (`"_D`)

### Enhanced Paragraph Navigation
- { -> Previous paragraph + end of word (`{ge`)
- } -> Next paragraph + start of word (`}w`)

### LSP Navigation (Dvorak-adapted)
- gd -> Go to definition (telescope or builtin)
- gr -> References (telescope or builtin)
- gn -> Implementation (telescope or builtin)
- gy -> Type definition (telescope or builtin)

---

## Files, buffers, pickers

### Snacks pickers
- `<leader><space>` (n) -> Smart Open (Normal Mode)
- `<leader>,` (n) -> Buffers (Normal Mode)
- `<leader>dd` (n) -> Debug Searcher (grep for bt/dd function calls)

### Telescope pickers
- `<leader>fp` (n) -> Find Plugin File
- `<leader>sp` (n) -> Search Plugin Spec

### Snacks picker window keys
- In picker list window
  - `<C-i>` -> toggle_input (also works in insert mode)
- In picker input window
  - `<C-i>` -> toggle_input
  - `<C-l>` -> toggle_lua (for grep filters)

---

## Editing, alignment, comments

### Alignment
- mini.align
  - `ga` (n,v) -> Align
  - `gA` (n,v) -> Align with preview

### Treesj
- `J` (n) -> TSJToggle split/join code blocks

### Comments (ts-comments)
- Standard gcc/gc style mappings (via LazyVim/ts-comments)
  - `gcc` (n) -> toggle comment line
  - `gc` (n,v) -> toggle comment
  - `gcO`/`gco`/`gcA` (n) -> add comment above/below/end-of-line

### Selection & visual helpers
- `<C-a>`/`<C-x>` (n,v) -> increment/decrement numbers
- `<` (v) -> unindent (keeps selection)
- `>` (v) -> indent (keeps selection)

---

## LSP Operations

### Navigation & info (LazyVim defaults)
- `gD` -> declaration
- `gK` -> signature help
- `K` -> hover
- `gI` -> implementation (also covered by gn in Dvorak overrides)

### Code actions & formatting (LazyVim defaults)
- `<leader>ca` (n,v) -> code action
- `<leader>cA` (n) -> source action
- `<leader>cc` (n) -> run codelens
- `<leader>cC` (n) -> refresh + display codelens
- `<leader>cr` (n) -> rename
- `<leader>cR` (n) -> rename file
- `<leader>cf` (n,v) -> format document/range
- `<leader>cF` (n) -> format injected languages

### Diagnostics (LazyVim defaults)
- `<leader>cd` (n) -> line diagnostics
- `<leader>cD` (n) -> workspace diagnostics
- `]d`/`[d` -> next/prev diagnostic
- `]e`/`[e` -> next/prev error
- `]w`/`[w` -> next/prev warning

---

## Git Operations

### Git operations (LazyVim defaults)
- `<leader>gg` -> Lazygit (root)
- `<leader>gG` -> Lazygit (cwd)
- `<leader>gb` -> blame line
- `<leader>gB` -> blame file
- `<leader>gf` -> Lazygit file history
- `<leader>gl` -> Lazygit log
- `<leader>gL` -> Lazygit log (cwd)
- `<leader>gB` (n,v) -> Git browse (Snacks gitbrowse)

### Git hunks (gitsigns)
- `]h`/`[h` -> next/prev hunk
- `<leader>ghs` (n,v) -> stage hunk
- `<leader>ghr` (n,v) -> reset hunk
- `<leader>ghS` (n) -> stage buffer
- `<leader>ghu` (n) -> undo stage hunk
- `<leader>ghR` (n) -> reset buffer
- `<leader>ghp` (n) -> preview hunk
- `<leader>ghd` (n,v) -> diff this

---

## Terminal Operations

### Floaterm (floating terminals)
- `<leader>tt` (n) -> Toggle floating terminal
- `<F7>` (n,t,i) -> Toggle floating terminal
- `<leader>tN` (n) -> New floating terminal
- `<leader>te` (n) -> Previous terminal
- `<leader>tw` (n) -> Next terminal
- `<F9>` (n,t,i) -> Next Floaterm terminal
- `<leader>tk` (n) -> Kill current terminal
- `<leader>fa` (n) -> Open ranger file manager

### ToggleTerm
- `<leader>tf` (n) -> Toggle floating terminal (toggleterm)
- `<leader>tv` (n) -> Toggle vertical terminal (toggleterm)

### Terminal mode keymaps (in terminal buffers)
- `<Esc>` (t) -> Exit terminal mode
- `ht` (t) -> Quick exit terminal mode
- `<C-h>` (t) -> Move to left window
- `<C-t>` (t) -> Move to down window
- `<C-n>` (t) -> Move to up window
- `<C-s>` (t) -> Move to right window
- `<C-w>` (t) -> Terminal window prefix
- `q` (n) -> Close terminal (normal mode in terminal buffer)

### Terminal commands
- `:TermGitStatus` -> Open git status in floating terminal
- `:TermGitLog` -> Open git log in floating terminal
- `:TermNodeREPL` -> Open Node.js REPL in floating terminal
- `:TermPythonREPL` -> Open Python REPL in floating terminal

---

## Window Management

### Basic window navigation (overrides for Dvorak + arrow keys)
- `<Up>` (n) -> Move to window above
- `<Down>` (n) -> Move to window below
- `<Left>` (n) -> Move to window left
- `<Right>` (n) -> Move to window right

### WezTerm integration (if in WezTerm)
- `<C-h>`/`<Left>` (n) -> Navigate left (Neovim + WezTerm panes)
- `<C-t>`/`<Down>` (n) -> Navigate down (Neovim + WezTerm panes)
- `<C-n>`/`<Up>` (n) -> Navigate up (Neovim + WezTerm panes)
- `<C-s>`/`<Right>` (n) -> Navigate right (Neovim + WezTerm panes)

---

## File Operations & Saving

### File saving
- `<leader>a` (n) -> Save current file (with modifiable check)
- `<leader>A` (n) -> Save all modified files

### Basic editing shortcuts
- `<C-c>` (n) -> Change inner word (ciw)
- `<C-c>` (v) -> Copy to clipboard
- `<C-v>` (i) -> Paste from clipboard

---

## Debug & Development

### Debug tools
- `<leader>dpd` (n) -> Debug profiler (toggle Snacks profiler)
- `<leader>T` (n) -> Todo List (open scratch todo file)

### Development utilities
- `:DvorakReapply` -> Manual command to re-apply Dvorak mappings

### Preview tools (disabled by default)
- `<leader>cp` (n) -> Preview markdown (peek.nvim - currently disabled)

---

## Special Features & Notes

### Cowboy protection
- Rapid key repetition (h, gj, gk, l, +, -) triggers a "Hold it Cowboy!" warning after 10 rapid presses

### Smart pickers behavior
- Smart Open and Buffers pickers open with input blurred (normal mode) for consistency
- Debug Searcher opens in normal mode and searches for specific debug patterns

### Terminal integration
- WezTerm pane navigation seamlessly integrates with Neovim window navigation
- Terminal escape sequences work with both `<Esc>` and `ht` for Dvorak users
- Special terminal commands provide quick access to git and REPL environments

### File management
- Intelligent save operations check for modifiable buffers and provide feedback
- Buffer operations respect Neovim's buffer types and states