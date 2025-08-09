--[[
  Core Neovim Options Configuration
  
  This file contains all the essential Neovim options for a modern development environment.
  Options are organized by category for easy maintenance and customization.
--]]

local opt = vim.opt

-- ============================================================================
-- APPEARANCE & UI
-- ============================================================================

-- Line numbers
opt.number = true              -- Show absolute line numbers
opt.relativenumber = true      -- Show relative line numbers
opt.numberwidth = 4            -- Set number column width

-- Cursor and visual aids
opt.cursorline = true          -- Highlight current line
opt.cursorcolumn = false       -- Don't highlight current column (performance)
-- opt.colorcolumn = "80,120"     -- Show column guides at 80 and 120 characters
opt.signcolumn = "yes"         -- Always show sign column to prevent text shifting

-- Colors and themes
opt.termguicolors = true       -- Enable 24-bit RGB colors
opt.background = "dark"        -- Set dark background

-- Window behavior
opt.splitright = true          -- Vertical splits open to the right
opt.splitbelow = true          -- Horizontal splits open below
opt.winminwidth = 5            -- Minimum window width
opt.winminheight = 1           -- Minimum window height (changed from 5 to 1)

-- ============================================================================
-- EDITING BEHAVIOR
-- ============================================================================

-- Indentation
opt.tabstop = 2                -- Number of spaces a tab represents
opt.shiftwidth = 2             -- Number of spaces for each indentation level
opt.expandtab = true           -- Convert tabs to spaces
opt.autoindent = true          -- Copy indent from current line when starting new line
opt.smartindent = true         -- Smart autoindenting for new lines
opt.breakindent = true         -- Maintain indent when wrapping lines

-- Text wrapping
opt.wrap = false               -- Don't wrap lines by default
opt.linebreak = true           -- Break lines at word boundaries when wrap is on
opt.showbreak = "↪ "           -- String to show at the beginning of wrapped lines

-- Backspace behavior
opt.backspace = "indent,eol,start"  -- Allow backspace over everything in insert mode

-- ============================================================================
-- SEARCH BEHAVIOR
-- ============================================================================

opt.ignorecase = true          -- Ignore case in search patterns
opt.smartcase = true           -- Override ignorecase if search contains uppercase
opt.hlsearch = true            -- Highlight search results
opt.incsearch = true           -- Show search matches as you type
opt.wrapscan = true            -- Searches wrap around end of file

-- ============================================================================
-- FILE HANDLING
-- ============================================================================

-- Backup and swap files
opt.swapfile = false           -- Don't create swap files
opt.backup = false             -- Don't create backup files
opt.writebackup = false        -- Don't create backup before overwriting

-- Undo
opt.undofile = true            -- Enable persistent undo
opt.undodir = vim.fn.stdpath("state") .. "/undo"  -- Set undo directory
opt.undolevels = 10000         -- Maximum number of changes that can be undone

-- File encoding
opt.fileencoding = "utf-8"     -- File encoding for new files
-- Note: encoding option is read-only after startup, so we don't set it here

-- ============================================================================
-- PERFORMANCE & TIMING
-- ============================================================================

opt.updatetime = 250           -- Time to wait before triggering events (ms)
opt.timeoutlen = 300           -- Time to wait for mapped sequence (ms)
opt.redrawtime = 10000         -- Time to wait for redraw (ms)
opt.ttimeoutlen = 10           -- Time to wait for key code sequence (ms)

-- Completion
opt.completeopt = "menu,menuone,noselect"  -- Completion options
opt.pumheight = 10             -- Maximum number of items in popup menu

-- ============================================================================
-- SCROLLING & NAVIGATION
-- ============================================================================

opt.scrolloff = 8              -- Keep 8 lines above/below cursor when scrolling
opt.sidescrolloff = 8          -- Keep 8 columns left/right of cursor when scrolling
opt.smoothscroll = true        -- Enable smooth scrolling (Neovim 0.10+)

-- Mouse support
opt.mouse = "a"                -- Enable mouse in all modes
opt.mousefocus = false         -- Don't focus window on mouse hover

-- ============================================================================
-- CLIPBOARD & SYSTEM INTEGRATION
-- ============================================================================

-- Clipboard configuration for different environments
if vim.fn.has("wsl") == 1 then
  -- WSL2 specific clipboard configuration
  if vim.fn.executable("win32yank.exe") == 1 then
    vim.g.clipboard = {
      name = "win32yank-wsl",
      copy = {
        ["+"] = "win32yank.exe -i --crlf",
        ["*"] = "win32yank.exe -i --crlf",
      },
      paste = {
        ["+"] = "win32yank.exe -o --lf",
        ["*"] = "win32yank.exe -o --lf",
      },
      cache_enabled = 0,
    }
  elseif vim.fn.executable("wslclip") == 1 then
    vim.g.clipboard = {
      name = "wslclip",
      copy = {
        ["+"] = "wslclip",
        ["*"] = "wslclip",
      },
      paste = {
        ["+"] = "wslclip -p",
        ["*"] = "wslclip -p",
      },
      cache_enabled = 0,
    }
  elseif vim.fn.executable("clip.exe") == 1 then
    vim.g.clipboard = {
      name = "clip.exe",
      copy = {
        ["+"] = "clip.exe",
        ["*"] = "clip.exe",
      },
      paste = {
        ["+"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
        ["*"] = "powershell.exe -c [Console]::Out.Write($(Get-Clipboard -Raw).tostring().replace(\"`r\", \"\"))",
      },
      cache_enabled = 0,
    }
  end
else
  -- Standard clipboard for non-WSL systems
  opt.clipboard:append("unnamedplus")  -- Use system clipboard
end

-- ============================================================================
-- FOLDING
-- ============================================================================

opt.foldmethod = "expr"        -- Use expression for folding
opt.foldexpr = "nvim_treesitter#foldexpr()"  -- Use treesitter for folding
opt.foldenable = false         -- Don't fold by default
opt.foldlevel = 99             -- High fold level to keep most folds open

-- ============================================================================
-- COMMAND LINE & MESSAGES
-- ============================================================================

opt.cmdheight = 1              -- Height of command line
opt.showcmd = true             -- Show command in status line
opt.showmode = false           -- Don't show mode (we have statusline for that)
opt.shortmess:append("c")      -- Don't show completion messages

-- ============================================================================
-- WILDMENU & COMPLETION
-- ============================================================================

opt.wildmenu = true            -- Enable wildmenu
opt.wildmode = "longest:full,full"  -- Wildmenu completion mode
opt.wildoptions = "pum"        -- Show wildmenu as popup

-- Ignore these file patterns in wildmenu
opt.wildignore:append({
  "*.o,*.obj,*.dylib,*.bin,*.dll,*.exe",
  "*/.git/*,*/.svn/*,*/.DS_Store",
  "*/node_modules/*,*/target/*,*/build/*",
  "*.jpg,*.png,*.jpeg,*.gif,*.ico,*.svg",
  "*.pyc,*.pyo,*.pyd,__pycache__",
  "*.class,*.jar,*.war,*.ear",
})

-- ============================================================================
-- LANGUAGE-SPECIFIC SETTINGS
-- ============================================================================

-- These will be overridden by autocmds for specific file types
-- but provide good defaults

-- Python (only set if python3 is available)
if vim.fn.executable("python3") == 1 then
  vim.g.python3_host_prog = vim.fn.exepath("python3")
end

-- Node.js (only set if node is available)
if vim.fn.executable("node") == 1 then
  vim.g.node_host_prog = vim.fn.exepath("node")
end

-- ============================================================================
-- NEOVIM-SPECIFIC OPTIONS
-- ============================================================================

-- Note: filetype detection is handled automatically by modern Neovim

-- Set grep program if available
if vim.fn.executable("rg") == 1 then
  opt.grepprg = "rg --vimgrep --smart-case --follow"
  opt.grepformat = "%f:%l:%c:%m"
elseif vim.fn.executable("ag") == 1 then
  opt.grepprg = "ag --vimgrep"
  opt.grepformat = "%f:%l:%c:%m,%f:%l:%m"
end

-- ============================================================================
-- DIAGNOSTIC CONFIGURATION
-- ============================================================================

-- Configure diagnostic display
vim.diagnostic.config({
  virtual_text = {
    prefix = "●",
    source = "if_many",
  },
  float = {
    source = "always",
    border = "rounded",
  },
  signs = true,
  underline = true,
  update_in_insert = false,
  severity_sort = true,
})