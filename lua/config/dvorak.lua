-- Dvorak Keyboard Layout integration for Neovim
-- Simplified: always-on mappings (no toggle/disable). Designed for users who only use Dvorak.

local M = {}

local function set(mode, lhs, rhs, opts)
  opts = opts or {}
  opts.silent = opts.silent ~= false
  vim.keymap.set(mode, lhs, rhs, opts)
end

-- core dvorak mappings (based on user's current setup)
local function apply_core()
  -- Escape & dash/backslash behavior
  set("i", "-", "<Esc>", { desc = "Exit insert mode (Dvorak)" })
  set("i", "\\", "-", { desc = "Insert dash character" })
  set("n", ",", "<Nop>")
  set("i", ",\\", "\\", { desc = "Insert backslash character" })

  -- Movement
  set("n", "h", "gj", { desc = "Move down (visual line)" })
  set("n", "u", "gk", { desc = "Move up (visual line)" })
  set("n", "w", "e", { desc = "Move to end of word" })
  set("n", "W", "E", { desc = "Move to end of WORD" })
  set("n", "e", "ge", { desc = "Move to end of previous word" })

  set("v", "h", "gj", { desc = "Move down (visual line)" })
  set("v", "u", "gk", { desc = "Move up (visual line)" })
  set("v", "w", "e", { desc = "Move to end of word" })
  set("v", "W", "E", { desc = "Move to end of WORD" })
  set("v", "e", "ge", { desc = "Move to end of previous word" })

  set("n", "j", "l", { desc = "Move right (Dvorak)" })
  set("v", "j", "l", { desc = "Move right (Dvorak)" })
  set("n", "J", "h", { desc = "Move left (Dvorak)" })
  set("v", "J", "h", { desc = "Move left (Dvorak)" })

  set("n", "t", "w", { desc = "Next word (Dvorak)" })
  set("n", "T", "W", { desc = "Next WORD (Dvorak)" })
  set("v", "t", "w", { desc = "Next word (Dvorak)" })
  set("v", "T", "W", { desc = "Next WORD (Dvorak)" })
  set("o", "t", "w", { desc = "Next word (Dvorak)" })
  set("o", "T", "W", { desc = "Next WORD (Dvorak)" })

  -- Character/position jumps
  set("n", "l", "``", { desc = "Jump back to last position" })
  set("n", "L", "`.", { desc = "Jump to last change" })
  set("v", "l", "``", { desc = "Jump back to last position" })
  set("v", "L", "`.", { desc = "Jump to last change" })

  -- Marks & undo
  set("n", "E", "`m", { desc = "Jump to mark m" })
  set("n", "i", "u", { desc = "Undo" })
  set("n", "I", "U", { desc = "Undo line" })

  -- Insert alternatives
  set("n", "n", "i", { desc = "Insert before cursor" })
  set("n", "N", "I", { desc = "Insert at beginning of line" })

  -- Paragraph + word boundary helpers
  set("n", "{", "{ge", { desc = "Previous paragraph, end of word" })
  set("n", "}", "}w", { desc = "Next paragraph, start of word" })

  -- Search next/prev
  set("n", "k", "n", { desc = "Next search match" })
  set("n", "K", "N", { desc = "Previous search match" })

  -- Delete without yanking
  set("n", "x", '"_x', { desc = "Delete char without yanking" })
  set("x", "x", '"_x', { desc = "Delete selection without yanking" })
  set("n", "X", '"_X', { desc = "Backward delete without yanking" })
  set("x", "X", '"_X', { desc = "Backward delete without yanking" })
  set("n", "d", '"_d', { desc = "Delete without yanking" })
  set("v", "d", '"_d', { desc = "Delete without yanking" })
  set("n", "D", '"_D', { desc = "Delete to EOL without yanking" })
  set("v", "D", '"_D', { desc = "Delete lines without yanking" })
end

local function apply_plugin_overrides()
  -- LSP (prefer telescope pickers when available)
  set("n", "gd", "<cmd>Telescope lsp_definitions<cr>", { desc = "Go to definition" })
  set("n", "gr", "<cmd>Telescope lsp_references<cr>", { desc = "References" })
  set("n", "gn", vim.lsp.buf.implementation, { desc = "Implementation" })
  set("n", "gy", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Type definition" })
end

local function apply_all()
  -- ensure leaders are intact
  vim.g.mapleader = " "
  vim.g.maplocalleader = "\\"
  apply_core()
  apply_plugin_overrides()
end

function M.setup(_)
  -- Apply immediately
  apply_all()

  -- Re-apply on events where plugins might override keys
  vim.api.nvim_create_autocmd({ "BufEnter", "TermClose" }, {
    callback = function()
      vim.defer_fn(function()
        apply_all()
      end, 25)
    end,
  })
end

return M
