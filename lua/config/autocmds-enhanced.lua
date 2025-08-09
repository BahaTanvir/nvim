-- Enhanced Autocmds for Ultimate Setup
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup

-- General settings
local general = augroup("General", { clear = true })

-- Highlight on yank
autocmd("TextYankPost", {
  group = general,
  pattern = "*",
  callback = function()
    vim.hl.on_yank({ higroup = "IncSearch", timeout = 200 })
  end,
})

-- Remove whitespace on save
autocmd("BufWritePre", {
  group = general,
  pattern = "*",
  command = ":%s/\\s\\+$//e",
})

-- Don't auto comment new line
autocmd("BufEnter", {
  group = general,
  pattern = "*",
  command = "set fo-=c fo-=r fo-=o",
})

-- Restore cursor position
autocmd("BufReadPost", {
  group = general,
  pattern = "*",
  callback = function()
    local mark = vim.api.nvim_buf_get_mark(0, '"')
    local lcount = vim.api.nvim_buf_line_count(0)
    if mark[1] > 0 and mark[1] <= lcount then
      pcall(vim.api.nvim_win_set_cursor, 0, mark)
    end
  end,
})

-- Close some filetypes with <q>
autocmd("FileType", {
  group = general,
  pattern = {
    "qf",
    "help",
    "man",
    "notify",
    "lspinfo",
    "spectre_panel",
    "startuptime",
    "tsplayground",
    "PlenaryTestPopup",
  },
  callback = function(event)
    vim.bo[event.buf].buflisted = false
    vim.keymap.set("n", "q", "<cmd>close<cr>", { buffer = event.buf, silent = true })
  end,
})

-- Language specific settings
local lang_settings = augroup("LanguageSettings", { clear = true })

-- Go settings
autocmd("FileType", {
  group = lang_settings,
  pattern = "go",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = false
  end,
})

-- Python settings
autocmd("FileType", {
  group = lang_settings,
  pattern = "python",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

-- Elixir settings
autocmd("FileType", {
  group = lang_settings,
  pattern = { "elixir", "eelixir", "heex" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- Rust settings
autocmd("FileType", {
  group = lang_settings,
  pattern = "rust",
  callback = function()
    vim.opt_local.tabstop = 4
    vim.opt_local.shiftwidth = 4
    vim.opt_local.expandtab = true
  end,
})

-- JavaScript/TypeScript settings
autocmd("FileType", {
  group = lang_settings,
  pattern = { "javascript", "typescript", "javascriptreact", "typescriptreact" },
  callback = function()
    vim.opt_local.tabstop = 2
    vim.opt_local.shiftwidth = 2
    vim.opt_local.expandtab = true
  end,
})

-- Auto-resize splits when Vim gets resized
autocmd("VimResized", {
  group = general,
  pattern = "*",
  command = "wincmd =",
})

-- Check if we need to reload the file when it changed
autocmd({ "FocusGained", "TermClose", "TermLeave" }, {
  group = general,
  command = "checktime",
})

-- Performance optimizations
local performance = augroup("Performance", { clear = true })

-- Disable syntax highlighting for large files
autocmd("BufReadPre", {
  group = performance,
  pattern = "*",
  callback = function()
    local max_filesize = 100 * 1024 -- 100 KB
    local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(vim.api.nvim_get_current_buf()))
    if ok and stats and stats.size > max_filesize then
      vim.cmd("syntax off")
      vim.opt_local.foldmethod = "manual"
      vim.opt_local.undolevels = -1
    end
  end,
})

-- Session management
local session = augroup("Session", { clear = true })

-- Auto-save session before closing nvim-tree
autocmd("User", {
  group = session,
  pattern = "SessionSavePre",
  callback = function()
    -- Close nvim-tree before saving session
    if pcall(require, "nvim-tree.api") then
      require("nvim-tree.api").tree.close()
    end
  end,
})

-- Terminal settings
local terminal = augroup("Terminal", { clear = true })

autocmd("TermOpen", {
  group = terminal,
  pattern = "*",
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
    vim.opt_local.scrolloff = 0
    vim.cmd("startinsert")
  end,
})