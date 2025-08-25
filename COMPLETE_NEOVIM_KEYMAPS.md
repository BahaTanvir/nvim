# Complete Neovim Keymaps & Shortcuts Reference

Leader Key: <Space>

This is the complete list of keymaps provided by this config, including:
- Your custom Dvorak mappings
- Custom user keymaps
- Plugin keymaps declared in this repo
- Core LazyVim defaults (summarized)

Tip: Inside Neovim, run :WhichKey to see the active keymaps in the current context.

---

Dvorak-specific remaps (always on)

Motion and navigation
- Normal/Visual
  - h -> gj  down by display line
  - u -> gk  up by display line
  - w -> e   end of word
  - W -> E   end of WORD
  - e -> ge  end of previous word
  - j -> l   move right
  - J -> h   move left
  - t -> w   next word
  - T -> W   next WORD
  - o (operator-pending)
    - t -> w
    - T -> W
- Jumps
  - l -> ``  jump back to last position
  - L -> `.  jump to last change
- Marks & undo
  - E -> `m  jump to mark m
  - i -> u   undo
  - I -> U   undo line
- Insert alternatives
  - n -> i   insert before cursor
  - N -> I   insert at beginning of line
- Paragraph helpers
  - { -> {ge  previous paragraph, end of word
  - } -> }w   next paragraph, start of word
- Search navigation
  - k -> n   next search match
  - K -> N   previous search match
- Delete without yanking (black-hole register)
  - Normal/Visual
    - x -> "_x  delete char/selection
    - X -> "_X  backward delete
    - d -> "_d  delete
    - D -> "_D  delete to EOL / lines

LSP navigation (Dvorak overrides)
- Prefer Telescope if available, fallback to built-in LSP
  - gd -> definitions (Telescope or vim.lsp.buf.definition)
  - gr -> references (Telescope or vim.lsp.buf.references)
  - gn -> implementations (Telescope or vim.lsp.buf.implementation)
  - gy -> type definitions (Telescope or vim.lsp.buf.type_definition)

---

Basic navigation & windows

Window navigation (custom)
- Normal
  - <Up> -> <C-w>k  go to above window
  - <Down> -> <C-w>j  go to below window
  - <Left> -> <C-w>h  go to left window
  - <Right> -> <C-w>l  go to right window

Other movement helpers
- Normal
  - <C-c> -> ciw  change inner word (convenience)

Cowboy protection
- Rapid repeats of h/j/k/l/+/− show a "Hold it Cowboy!" warning and throttle for 2s

---

Files, buffers, pickers

Snacks pickers
- Normal
  - <leader><space> -> Smart Open (starts in normal mode)
  - <leader>dd -> Debug Searcher (grep for bt/dd in Lua)
  - <leader>t -> Snacks scratch: Todo (~/dot/TODO.md)
  - <leader>dpd -> Debug profiler (toggle)

Telescope (optional spec, loads when telescope present)
- Normal
  - <leader>fp -> Find Plugin File (in lazy root)
  - <leader>sp -> Search Plugin Spec (live grep)

LazyVim defaults (highlights)
- Find files/grep/recent, etc., are available via LazyVim’s default mappings; most are accessible under <leader>f and <leader>s. Use :WhichKey for the live list.

Snacks picker window keys
- In picker list window
  - <C-i> -> toggle_input (also works in insert mode)
- In picker input window
  - <C-i> -> toggle_input
  - <C-l> -> toggle_lua (for grep filters)

---

Editing, alignment, comments

Alignment
- mini.align
  - ga (n,v) -> Align
  - gA (n,v) -> Align with preview

Treesj
- J (n) -> TSJToggle  split/join code blocks

Comments (ts-comments)
- Standard gcc/gc style mappings (via LazyVim/ts-comments)
  - gcc (n) -> toggle comment line
  - gc (n,v) -> toggle comment
  - gcO/gco/gcA (n) -> add comment above/below/end-of-line

Selection & visual helpers
- <C-a>/<C-x> (n,v) -> increment/decrement numbers
- < (v) -> unindent (keeps selection)
- > (v) -> indent (keeps selection)

---

LSP (beyond Dvorak overrides)

Navigation & info (LazyVim defaults)
- gD -> declaration
- gK -> signature help
- K -> hover
- gI -> implementation (also covered by gn in Dvorak overrides)

Code actions & formatting (LazyVim defaults)
- <leader>ca (n,v) -> code action
- <leader>cA (n) -> source action
- <leader>cc (n) -> run codelens
- <leader>cC (n) -> refresh + display codelens
- <leader>cr (n) -> rename
- <leader>cR (n) -> rename file
- <leader>cf (n,v) -> format document/range
- <leader>cF (n) -> format injected languages

Diagnostics (LazyVim defaults)
- <leader>cd (n) -> line diagnostics
- <leader>cD (n) -> workspace diagnostics
- ]d/[d -> next/prev diagnostic
- ]e/[e -> next/prev error
- ]w/[w -> next/prev warning

---

Git (LazyVim defaults and plugins)

Git operations
- <leader>gg -> Lazygit (root)
- <leader>gG -> Lazygit (cwd)
- <leader>gb -> blame line
- <leader>gB -> blame file
- <leader>gf -> Lazygit file history
- <leader>gl -> Lazygit log
- <leader>gL -> Lazygit log (cwd)
- <leader>gB (n,v) -> Git browse (Snacks gitbrowse)

Git hunks (gitsigns)
- ]h/[h -> next/prev hunk
- <leader>ghs (n,v) -> stage hunk
- <leader>ghr (n,v) -> reset hunk
- <leader>ghS (n) -> stage buffer
- <leader>ghu (n) -> undo stage hunk
- <leader>ghR (n) -> reset buffer
- <leader>ghp (n) -> preview hunk
- <leader>ghd (n,v) -> diff this
- <leader>ghD (n) -> diff this ~

---

Terminal (LazyVim defaults)
- <leader>tt -> terminal (root)
- <leader>tT -> terminal (cwd)
- <leader>tf -> terminal float
- <C-/> or <C-_> (n) -> terminal (root)
- <esc><esc> (t) -> normal mode
- <C-/> or <C-_> (t) -> hide terminal

---

Tabs & windows (LazyVim defaults)

Tabs
- <leader><tab><tab> -> new tab
- <leader><tab>] / <leader><tab>[ -> next/prev tab
- <leader><tab>f -> first tab
- <leader><tab>l -> last tab
- <leader><tab>o -> close other tabs
- <leader><tab>d -> close tab

Windows
- <leader>ww -> other window
- <leader>wd -> delete window
- <leader>w- / <leader>- -> split below
- <leader>w| / <leader>| -> split right

---

Plugin management & tooling

Lazy.nvim
- <leader>l -> :Lazy
- <leader>li -> install
- <leader>lu -> update
- <leader>lc -> clean
- <leader>ls -> sync
- <leader>lx -> extras
- <leader>lr -> restore
- <leader>lp -> profile

Mason
- <leader>cm -> :Mason

Sessions (persistence.nvim)
- <leader>qs -> restore session
- <leader>ql -> restore last session
- <leader>qd -> don’t save current session

Messages & notifications (noice)
- <leader>un -> dismiss notifications (Snacks)
- <leader>sn -> Noice
- <leader>snl -> Noice last
- <leader>snh -> Noice history
- <leader>sna -> Noice all
- <leader>snd -> Noice dismiss

---

Insert & command mode helpers (LazyVim defaults)

Insert
- <C-h>/<C-l>/<C-j>/<C-k> -> delete char left/right, new line, delete to EOL
- Completion (blink.cmp)
  - <Tab>/<S-Tab> -> next/prev item or accept
  - <C-Space> -> show completion
  - <C-e> -> close completion
  - <CR> -> confirm

Command-line
- <C-a>/<C-e> -> beginning/end
- <C-f> -> command window

---

Global helpers (init.lua)
- dd(...) -> debug inspect
- bt() -> backtrace
- p(...) -> profile
- :DvorakReapply -> re-apply your Dvorak keymaps on demand

Notes
- Some defaults come from LazyVim and its extras; they load contextually. Use :WhichKey to explore everything live.
- Smart Open and Debug Searcher open their pickers with input blurred (normal mode) for consistency.
