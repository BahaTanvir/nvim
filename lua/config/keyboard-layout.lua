--[[
  Keyboard Layout Configuration for Neovim
  
  This file manages keyboard layout settings, defaulting to QWERTY
  with optional Dvorak support for users who prefer it.
  
  To enable Dvorak layout:
  1. Set ENABLE_DVORAK = true below, OR
  2. Use :DvorakEnable command, OR
  3. Use <leader>td keymap
--]]

-- ============================================================================
-- CONFIGURATION
-- ============================================================================

-- Set this to true to enable Dvorak layout by default
-- Most users should keep this false (QWERTY default)
local ENABLE_DVORAK = false

-- You can also enable Dvorak via environment variable
-- export NVIM_DVORAK=1
if vim.env.NVIM_DVORAK == "1" then
  ENABLE_DVORAK = true
end

-- ============================================================================
-- LAYOUT MANAGEMENT
-- ============================================================================

local M = {}
M.dvorak_enabled = ENABLE_DVORAK

-- Function to enable Dvorak mappings
function M.enable_dvorak()
  if M.dvorak_enabled then
    vim.notify("Dvorak layout already enabled")
    return
  end
  
  -- Load Dvorak keymaps
  require("config.dvorak-keymaps-optional")
  M.dvorak_enabled = true
  vim.notify("🎹 Dvorak layout enabled! Use :DvorakDisable to switch back to QWERTY")
end

-- Function to disable Dvorak mappings (restore QWERTY)
function M.disable_dvorak()
  if not M.dvorak_enabled then
    vim.notify("QWERTY layout already active")
    return
  end
  
  -- Restore standard QWERTY mappings
  local keymap = vim.keymap
  local opts = { noremap = true, silent = true }
  
  -- Restore basic QWERTY movement
  keymap.set("n", "h", "h", { desc = "Move left" })
  keymap.set("n", "j", "j", { desc = "Move down" })
  keymap.set("n", "k", "k", { desc = "Move up" })
  keymap.set("n", "l", "l", { desc = "Move right" })
  
  keymap.set("v", "h", "h", { desc = "Move left" })
  keymap.set("v", "j", "j", { desc = "Move down" })
  keymap.set("v", "k", "k", { desc = "Move up" })
  keymap.set("v", "l", "l", { desc = "Move right" })
  
  -- Restore standard word movement
  keymap.set("n", "w", "w", { desc = "Next word" })
  keymap.set("n", "W", "W", { desc = "Next WORD" })
  keymap.set("n", "e", "e", { desc = "End of word" })
  keymap.set("n", "E", "E", { desc = "End of WORD" })
  keymap.set("n", "b", "b", { desc = "Previous word" })
  keymap.set("n", "B", "B", { desc = "Previous WORD" })
  
  keymap.set("v", "w", "w", { desc = "Next word" })
  keymap.set("v", "W", "W", { desc = "Next WORD" })
  keymap.set("v", "e", "e", { desc = "End of word" })
  keymap.set("v", "E", "E", { desc = "End of WORD" })
  keymap.set("v", "b", "b", { desc = "Previous word" })
  keymap.set("v", "B", "B", { desc = "Previous WORD" })
  
  -- Restore standard search
  keymap.set("n", "n", "n", { desc = "Next search match" })
  keymap.set("n", "N", "N", { desc = "Previous search match" })
  
  -- Restore standard character find
  keymap.set("n", "t", "t", { desc = "Find character (before)" })
  keymap.set("n", "T", "T", { desc = "Find character backward (before)" })
  keymap.set("n", "f", "f", { desc = "Find character" })
  keymap.set("n", "F", "F", { desc = "Find character backward" })
  
  keymap.set("v", "t", "t", { desc = "Find character (before)" })
  keymap.set("v", "T", "T", { desc = "Find character backward (before)" })
  keymap.set("v", "f", "f", { desc = "Find character" })
  keymap.set("v", "F", "F", { desc = "Find character backward" })
  
  -- Restore standard insert/undo
  keymap.set("n", "i", "i", { desc = "Insert before cursor" })
  keymap.set("n", "I", "I", { desc = "Insert at beginning of line" })
  keymap.set("n", "a", "a", { desc = "Insert after cursor" })
  keymap.set("n", "A", "A", { desc = "Insert at end of line" })
  keymap.set("n", "o", "o", { desc = "Insert line below" })
  keymap.set("n", "O", "O", { desc = "Insert line above" })
  
  keymap.set("n", "u", "u", { desc = "Undo" })
  keymap.set("n", "U", "U", { desc = "Undo line" })
  
  -- Restore other standard keys
  keymap.set("n", "x", "x", { desc = "Delete character" })
  keymap.set("n", "X", "X", { desc = "Delete character backward" })
  keymap.set("n", "r", "r", { desc = "Replace character" })
  keymap.set("n", "R", "R", { desc = "Replace mode" })
  
  -- Restore standard escape (remove Dvorak '-' escape)
  keymap.del("i", "-", { silent = true })
  keymap.del("i", "\\", { silent = true })
  
  M.dvorak_enabled = false
  vim.notify("⌨️  QWERTY layout restored! Use :DvorakEnable to switch back to Dvorak")
end

-- Toggle function
function M.toggle_dvorak()
  if M.dvorak_enabled then
    M.disable_dvorak()
  else
    M.enable_dvorak()
  end
end

-- ============================================================================
-- COMMANDS AND KEYMAPS
-- ============================================================================

-- Create user commands
vim.api.nvim_create_user_command("DvorakEnable", M.enable_dvorak, {
  desc = "Enable Dvorak keyboard layout mappings"
})

vim.api.nvim_create_user_command("DvorakDisable", M.disable_dvorak, {
  desc = "Disable Dvorak layout and restore QWERTY"
})

vim.api.nvim_create_user_command("DvorakToggle", M.toggle_dvorak, {
  desc = "Toggle between Dvorak and QWERTY layouts"
})

-- Legacy command for compatibility
vim.api.nvim_create_user_command("DvorakStatus", function()
  if M.dvorak_enabled then
    vim.notify("🎹 Dvorak layout is currently ENABLED")
  else
    vim.notify("⌨️  QWERTY layout is currently active")
  end
end, { desc = "Show current keyboard layout status" })

-- Keymap to toggle layout
vim.keymap.set("n", "<leader>td", M.toggle_dvorak, { desc = "Toggle Dvorak/QWERTY layout" })

-- ============================================================================
-- INITIALIZATION
-- ============================================================================

-- Initialize based on configuration
if ENABLE_DVORAK then
  vim.defer_fn(function()
    M.enable_dvorak()
  end, 100) -- Small delay to ensure plugins are loaded
end

return M