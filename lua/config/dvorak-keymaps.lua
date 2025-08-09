--[[
  Dvorak Keyboard Layout Mappings for Neovim
  
  This file contains all Dvorak-specific key mappings to make Neovim
  comfortable for Dvorak keyboard users while maintaining Vim's efficiency.
--]]

local keymap = vim.keymap
local opts = { noremap = true, silent = true }

-- ============================================================================
-- DVORAK ESCAPE AND DASH MAPPINGS
-- ============================================================================

-- Escape mappings for Dvorak
keymap.set("i", "-", "<Esc>", { desc = "Exit insert mode (Dvorak)" })
keymap.set("i", "\\", "-", { desc = "Insert dash character" })

-- Disable comma in normal mode and create comma-backslash mapping
keymap.set("n", ",", "<Nop>", opts)
keymap.set("i", ",\\", "\\", { desc = "Insert backslash character" })

-- ============================================================================
-- DVORAK MOVEMENT MAPPINGS
-- ============================================================================

-- Basic movement remapping for Dvorak layout
keymap.set("n", "j", "l", { desc = "Move right (Dvorak)" })

-- Dvorak to QWERTY movement mappings
keymap.set("n", "h", "gj", { desc = "Move down (visual line)" })
keymap.set("n", "u", "gk", { desc = "Move up (visual line)" })
keymap.set("n", "t", "w", { desc = "Move to next word (Dvorak)", noremap = true })
keymap.set("n", "T", "W", { desc = "Move to next WORD (Dvorak)", noremap = true })
keymap.set("n", "w", "e", { desc = "Move to end of word" })
keymap.set("n", "W", "E", { desc = "Move to end of WORD" })
keymap.set("n", "e", "ge", { desc = "Move to end of previous word" })

-- Visual mode movement mappings
keymap.set("v", "j", "l", { desc = "Move right (Dvorak)" })
keymap.set("v", "h", "gj", { desc = "Move down (visual line)" })
keymap.set("v", "u", "gk", { desc = "Move up (visual line)" })
keymap.set("v", "t", "w", { desc = "Move to next word" })
keymap.set("v", "T", "W", { desc = "Move to next WORD" })
keymap.set("v", "w", "e", { desc = "Move to end of word" })
keymap.set("v", "W", "E", { desc = "Move to end of WORD" })
keymap.set("v", "e", "ge", { desc = "Move to end of previous word" })

-- ============================================================================
-- DVORAK FUNCTION REMAPPINGS
-- ============================================================================

-- Screen navigation
keymap.set("n", "_", "L", { desc = "Move to bottom of screen" })

-- Mark and jump operations
keymap.set("n", "E", "`m", { desc = "Jump to mark m" })
keymap.set("n", "S", "`.", { desc = "Jump to last change" })
keymap.set("n", "s", "``", { desc = "Jump to previous position" })

-- Macro and quit operations
keymap.set("n", "Q", "q", { desc = "Record macro" })
keymap.set("n", "q", "h", { desc = "Move left" })
keymap.set("v", "q", "h", { desc = "Move left" })

-- Undo operations
keymap.set("n", "i", "u", { desc = "Undo" })
keymap.set("n", "I", "U", { desc = "Undo line" })

-- Insert mode mappings
keymap.set("n", "n", "i", { desc = "Insert before cursor" })
keymap.set("n", "N", "I", { desc = "Insert at beginning of line" })

-- Bracket movements with word boundaries
keymap.set("n", "{", "{ge", { desc = "Previous paragraph, end of word" })
keymap.set("n", "}", "}w", { desc = "Next paragraph, start of word" })

-- Search operations
keymap.set("n", "k", "n", { desc = "Next search match" })
keymap.set("n", "K", "N", { desc = "Previous search match" })

-- Character find operations (using original t/T functions)
keymap.set("n", "l", "t", { desc = "Find character (before)" })
keymap.set("n", "L", "T", { desc = "Find character backward (before)" })
keymap.set("v", "l", "t", { desc = "Find character (before)" })
keymap.set("v", "L", "T", { desc = "Find character backward (before)" })

-- Join lines
keymap.set("n", "H", "J", { desc = "Join lines" })

-- ============================================================================
-- DELETE WITHOUT YANKING (DVORAK COMPATIBLE)
-- ============================================================================

-- Delete single character without yanking
keymap.set("n", "x", '"_x', { desc = "Delete character without yanking" })
keymap.set("x", "x", '"_x', { desc = "Delete selection without yanking" })

-- Delete to end of line without yanking
keymap.set("n", "X", '"_X', { desc = "Delete backward without yanking" })
keymap.set("x", "X", '"_X', { desc = "Delete selection backward without yanking" })

-- Delete operations without yanking
keymap.set("n", "d", '"_d', { desc = "Delete without yanking" })
keymap.set("v", "d", '"_d', { desc = "Delete without yanking" })

-- Delete line without yanking
keymap.set("n", "D", '"_D', { desc = "Delete to end of line without yanking" })
keymap.set("v", "D", '"_D', { desc = "Delete lines without yanking" })

-- ============================================================================
-- DVORAK-SPECIFIC OVERRIDES FOR PLUGINS
-- ============================================================================

-- Override some default keymaps that conflict with Dvorak layout
-- These will be set after plugins load to ensure they take precedence

local function setup_dvorak_plugin_overrides()
  -- Flash.nvim overrides (if available)
  if pcall(require, "flash") then
    keymap.set("n", "r", function()
      require("flash").jump()
    end, { desc = "Flash jump (Dvorak override)" })
    
    keymap.set("n", "R", function()
      require("flash").treesitter()
    end, { desc = "Flash treesitter (Dvorak override)" })
  end
  
  -- Telescope overrides for Dvorak-friendly keys
  keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Find files" })
  keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Recent files" })
  keymap.set("n", "<leader>fg", "<cmd>Telescope live_grep<cr>", { desc = "Live grep" })
  keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
  
  -- LSP overrides that work well with Dvorak
  keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Go to definition" })
  keymap.set("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "Show references" })
  keymap.set("n", "gn", vim.lsp.buf.implementation, { desc = "Go to implementation" })
  keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Go to type definition" })
end

-- ============================================================================
-- DVORAK AUTOCMD SETUP
-- ============================================================================

-- Set up Dvorak overrides after plugins are loaded
vim.api.nvim_create_autocmd("VimEnter", {
  callback = function()
    -- Delay to ensure all plugins are loaded
    vim.defer_fn(function()
      setup_dvorak_plugin_overrides()
      
      -- Re-apply core Dvorak mappings to ensure they take priority
      keymap.set("n", "t", "w", { desc = "Move to next word (Dvorak)" })
      keymap.set("n", "T", "W", { desc = "Move to next WORD (Dvorak)" })
      keymap.set("v", "t", "w", { desc = "Move to next word (Dvorak)" })
      keymap.set("v", "T", "W", { desc = "Move to next WORD (Dvorak)" })
    end, 200)
  end,
})

-- ============================================================================
-- DVORAK HELPER FUNCTIONS
-- ============================================================================

-- Function to toggle between Dvorak and QWERTY mappings
local dvorak_enabled = true

local function toggle_dvorak_mappings()
  if dvorak_enabled then
    -- Disable Dvorak mappings (restore QWERTY)
    keymap.set("n", "h", "h", { desc = "Move left (QWERTY)" })
    keymap.set("n", "j", "j", { desc = "Move down (QWERTY)" })
    keymap.set("n", "k", "k", { desc = "Move up (QWERTY)" })
    keymap.set("n", "l", "l", { desc = "Move right (QWERTY)" })
    dvorak_enabled = false
    vim.notify("Switched to QWERTY mappings")
  else
    -- Re-enable Dvorak mappings
    require("config.dvorak-keymaps")
    dvorak_enabled = true
    vim.notify("Switched to Dvorak mappings")
  end
end

-- Command to toggle Dvorak mappings
vim.api.nvim_create_user_command("DvorakToggle", toggle_dvorak_mappings, {
  desc = "Toggle between Dvorak and QWERTY key mappings"
})

-- Keymap to toggle Dvorak mode
keymap.set("n", "<leader>td", toggle_dvorak_mappings, { desc = "Toggle Dvorak mappings" })

return {
  toggle_dvorak_mappings = toggle_dvorak_mappings,
  dvorak_enabled = function() return dvorak_enabled end,
}