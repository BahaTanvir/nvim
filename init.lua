--[[
  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗
  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║
  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║
  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║
  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║
  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝
  
  Comprehensive Development Environment
  Languages: Elixir/Phoenix, Rust, Go, Python, JavaScript, HTML, CSS
  
  Author: Your Setup
  Version: 1.0.0
--]]

-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
  local lazyrepo = "https://github.com/folke/lazy.nvim.git"
  local out = vim.fn.system({ "git", "clone", "--filter=blob:none", "--branch=stable", lazyrepo, lazypath })
  if vim.v.shell_error ~= 0 then
    vim.api.nvim_echo({
      { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
      { out, "WarningMsg" },
      { "\nPress any key to exit..." },
    }, true, {})
    vim.fn.getchar()
    os.exit(1)
  end
end
vim.opt.rtp:prepend(lazypath)

-- Set leader keys before loading plugins
vim.g.mapleader = " "
vim.g.maplocalleader = "\\"

-- Neovim 0.10+ LSP compatibility shims (silence deprecation and forward to new API)
-- Define before plugins load so external plugins benefit too
pcall(function()
  if vim and vim.lsp then
    if type(vim.lsp.get_clients) == "function" then
      -- Replace deprecated buf_get_clients with the new API
      vim.lsp.buf_get_clients = function(bufnr)
        return vim.lsp.get_clients({ bufnr = bufnr })
      end
      -- Replace deprecated get_active_clients with the new API
      vim.lsp.get_active_clients = function(filter)
        return vim.lsp.get_clients(filter)
      end
    end
  end
end)

-- Setup lazy.nvim
require("lazy").setup({
  spec = {
    -- Import plugin configurations
    { import = "plugins" },
  },
  defaults = {
    lazy = false, -- should plugins be lazy-loaded?
    version = false, -- always use the latest git commit
  },
  install = { colorscheme = { "catppuccin", "habamax" } },
  checker = { enabled = true }, -- automatically check for plugin updates
  performance = {
    cache = {
      enabled = true,
    },
    rtp = {
      -- disable some rtp plugins
      disabled_plugins = {
        "gzip",
        "matchit",
        "matchparen",
        "netrwPlugin",
        "tarPlugin",
        "tohtml",
        "tutor",
        "zipPlugin",
      },
    },
  },
})

-- Load core configuration
require("config.options")
require("config.keymaps")
require("config.autocmds-enhanced")

-- Load Dvorak keymaps (comment out if using QWERTY)
require("config.keyboard-layout")