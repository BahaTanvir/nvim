--[[
  Key Mappings Configuration
  
  This file contains all custom key mappings organized by functionality.
  All mappings include descriptions for which-key integration.
--]]

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- ============================================================================
-- GENERAL MAPPINGS
-- ============================================================================

-- Better escape
keymap.set("i", "jk", "<ESC>", { desc = "Exit insert mode" })
keymap.set("i", "kj", "<ESC>", { desc = "Exit insert mode" })

-- Clear search highlights
keymap.set("n", "<leader>nh", "<cmd>nohlsearch<CR>", { desc = "Clear search highlights" })

-- Better save and quit
keymap.set("n", "<leader>w", "<cmd>write<CR>", { desc = "Save file" })
keymap.set("n", "<leader>q", "<cmd>quit<CR>", { desc = "Quit" })
keymap.set("n", "<leader>Q", "<cmd>quitall<CR>", { desc = "Quit all" })

-- ============================================================================
-- NUMBER OPERATIONS
-- ============================================================================

keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" })
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" })

-- ============================================================================
-- WINDOW MANAGEMENT
-- ============================================================================

-- Split windows
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" })
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" })
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" })
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" })

-- Navigate windows
keymap.set("n", "<C-h>", "<C-w>h", { desc = "Go to left window" })
keymap.set("n", "<C-j>", "<C-w>j", { desc = "Go to lower window" })
keymap.set("n", "<C-k>", "<C-w>k", { desc = "Go to upper window" })
keymap.set("n", "<C-l>", "<C-w>l", { desc = "Go to right window" })

-- Resize windows
keymap.set("n", "<C-Up>", "<cmd>resize +2<CR>", { desc = "Increase window height" })
keymap.set("n", "<C-Down>", "<cmd>resize -2<CR>", { desc = "Decrease window height" })
keymap.set("n", "<C-Left>", "<cmd>vertical resize -2<CR>", { desc = "Decrease window width" })
keymap.set("n", "<C-Right>", "<cmd>vertical resize +2<CR>", { desc = "Increase window width" })

-- ============================================================================
-- TAB MANAGEMENT
-- ============================================================================

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" })
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" })
keymap.set("n", "<leader>tn", "<cmd>tabnext<CR>", { desc = "Go to next tab" })
keymap.set("n", "<leader>tp", "<cmd>tabprevious<CR>", { desc = "Go to previous tab" })
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" })

-- ============================================================================
-- BUFFER MANAGEMENT
-- ============================================================================

-- Alt-based buffer switching (faster than Shift)
keymap.set("n", "<A-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<A-t>", "<cmd>bnext<CR>", { desc = "Next buffer" })

-- Quick buffer fuzzy finder
keymap.set("n", "<leader><leader>", "<cmd>Telescope buffers<cr>", { desc = "Find buffers (quick)" })

-- Legacy Shift mappings (if you still want them)
keymap.set("n", "<S-h>", "<cmd>bprevious<CR>", { desc = "Previous buffer" })
keymap.set("n", "<S-l>", "<cmd>bnext<CR>", { desc = "Next buffer" })
keymap.set("n", "<leader>bd", "<cmd>bdelete<CR>", { desc = "Delete buffer" })
keymap.set("n", "<leader>bD", "<cmd>bdelete!<CR>", { desc = "Force delete buffer" })
keymap.set("n", "<leader>ba", "<cmd>bufdo bdelete<CR>", { desc = "Delete all buffers" })

-- ============================================================================
-- TEXT MANIPULATION
-- ============================================================================

-- Move lines up/down
keymap.set("v", "J", ":move '>+1<CR>gv=gv", { desc = "Move selection down" })
keymap.set("v", "K", ":move '<-2<CR>gv=gv", { desc = "Move selection up" })
keymap.set("n", "<A-j>", ":move .+1<CR>==", { desc = "Move line down" })
keymap.set("n", "<A-k>", ":move .-2<CR>==", { desc = "Move line up" })

-- Better indenting
keymap.set("v", "<", "<gv", { desc = "Indent left" })
keymap.set("v", ">", ">gv", { desc = "Indent right" })

-- Join lines but keep cursor position
keymap.set("n", "J", "mzJ`z", { desc = "Join lines" })

-- ============================================================================
-- SCROLLING & NAVIGATION
-- ============================================================================

-- Keep cursor centered when scrolling
keymap.set("n", "<C-d>", "<C-d>zz", { desc = "Scroll down and center" })
keymap.set("n", "<C-u>", "<C-u>zz", { desc = "Scroll up and center" })

-- Keep search terms in the middle
keymap.set("n", "n", "nzzzv", { desc = "Next search result (centered)" })
keymap.set("n", "N", "Nzzzv", { desc = "Previous search result (centered)" })

-- Better page up/down
keymap.set("n", "<PageUp>", "<C-u>", { desc = "Page up" })
keymap.set("n", "<PageDown>", "<C-d>", { desc = "Page down" })

-- ============================================================================
-- CLIPBOARD OPERATIONS
-- ============================================================================

-- Better paste (don't lose clipboard content when pasting over selection)
keymap.set("x", "<leader>p", [["_dP]], { desc = "Paste without yanking" })

-- Copy to system clipboard
keymap.set({"n", "v"}, "<leader>y", [["+y]], { desc = "Copy to system clipboard" })
keymap.set("n", "<leader>Y", [["+Y]], { desc = "Copy line to system clipboard" })

-- Delete without yanking
keymap.set({"n", "v"}, "<leader>d", [["_d]], { desc = "Delete without yanking" })

-- Select all
keymap.set("n", "<C-a>", "ggVG", { desc = "Select all" })

-- ============================================================================
-- SEARCH & REPLACE
-- ============================================================================

-- Replace word under cursor
keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]], 
  { desc = "Replace word under cursor" })

-- Replace selection
keymap.set("v", "<leader>s", [[:s/\V<C-R>=escape(@",'/\')<CR>//g<Left><Left>]], 
  { desc = "Replace selection" })

-- ============================================================================
-- QUICKFIX & LOCATION LIST
-- ============================================================================

keymap.set("n", "<leader>qo", "<cmd>copen<CR>", { desc = "Open quickfix list" })
keymap.set("n", "<leader>qc", "<cmd>cclose<CR>", { desc = "Close quickfix list" })
keymap.set("n", "<leader>qn", "<cmd>cnext<CR>zz", { desc = "Next quickfix item" })
keymap.set("n", "<leader>qp", "<cmd>cprevious<CR>zz", { desc = "Previous quickfix item" })

keymap.set("n", "<leader>lo", "<cmd>lopen<CR>", { desc = "Open location list" })
keymap.set("n", "<leader>lc", "<cmd>lclose<CR>", { desc = "Close location list" })
keymap.set("n", "<leader>ln", "<cmd>lnext<CR>zz", { desc = "Next location list item" })
keymap.set("n", "<leader>lp", "<cmd>lprevious<CR>zz", { desc = "Previous location list item" })

-- ============================================================================
-- FILE OPERATIONS
-- ============================================================================

-- Make file executable
keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true, desc = "Make file executable" })

-- Source current file
keymap.set("n", "<leader>so", function()
  vim.cmd("source %")
  vim.notify("File sourced!")
end, { desc = "Source current file" })

-- Reload configuration
keymap.set("n", "<leader>R", function()
  vim.cmd("source $MYVIMRC")
  vim.notify("Configuration reloaded!")
end, { desc = "Reload configuration" })

-- ============================================================================
-- TERMINAL
-- ============================================================================

-- Terminal mappings
keymap.set("n", "<leader>tt", "<cmd>terminal<CR>", { desc = "Open terminal" })
keymap.set("n", "<leader>tv", "<cmd>vsplit | terminal<CR>", { desc = "Open terminal in vertical split" })
keymap.set("n", "<leader>th", "<cmd>split | terminal<CR>", { desc = "Open terminal in horizontal split" })

-- Terminal mode mappings
keymap.set("t", "<Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
keymap.set("t", "<C-h>", "<C-\\><C-n><C-w>h", { desc = "Go to left window" })
keymap.set("t", "<C-j>", "<C-\\><C-n><C-w>j", { desc = "Go to lower window" })
keymap.set("t", "<C-k>", "<C-\\><C-n><C-w>k", { desc = "Go to upper window" })
keymap.set("t", "<C-l>", "<C-\\><C-n><C-w>l", { desc = "Go to right window" })

-- ============================================================================
-- DIAGNOSTIC NAVIGATION
-- ============================================================================

keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Previous diagnostic" })
keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Next diagnostic" })
keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show line diagnostics" })
keymap.set("n", "<leader>E", vim.diagnostic.setloclist, { desc = "Show buffer diagnostics" })

-- ============================================================================
-- UTILITY MAPPINGS
-- ============================================================================

-- Disable Q (ex mode)
keymap.set("n", "Q", "<nop>")

-- Disable arrow keys in normal mode (encourage hjkl usage)
keymap.set("n", "<Up>", "<nop>")
keymap.set("n", "<Down>", "<nop>")
keymap.set("n", "<Left>", "<nop>")
keymap.set("n", "<Right>", "<nop>")

-- Better command line editing
keymap.set("c", "<C-a>", "<Home>", { desc = "Go to beginning of line" })
keymap.set("c", "<C-e>", "<End>", { desc = "Go to end of line" })

-- Toggle options
keymap.set("n", "<leader>uw", function()
  vim.opt.wrap = not vim.opt.wrap:get()
  vim.notify("Wrap " .. (vim.opt.wrap:get() and "enabled" or "disabled"))
end, { desc = "Toggle line wrap" })

keymap.set("n", "<leader>un", function()
  vim.opt.number = not vim.opt.number:get()
  vim.notify("Line numbers " .. (vim.opt.number:get() and "enabled" or "disabled"))
end, { desc = "Toggle line numbers" })

keymap.set("n", "<leader>ur", function()
  vim.opt.relativenumber = not vim.opt.relativenumber:get()
  vim.notify("Relative numbers " .. (vim.opt.relativenumber:get() and "enabled" or "disabled"))
end, { desc = "Toggle relative numbers" })

keymap.set("n", "<leader>us", function()
  vim.opt.spell = not vim.opt.spell:get()
  vim.notify("Spell check " .. (vim.opt.spell:get() and "enabled" or "disabled"))
end, { desc = "Toggle spell check" })