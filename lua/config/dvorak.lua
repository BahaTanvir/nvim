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
  -- Escape and dash input
  set("i", "-", function()
    local cmp = package.loaded.cmp
    if cmp and cmp.visible() then cmp.abort() end
    return "<C-g>u<Esc>"
  end, { expr = true, desc = "Minus as Escape (Dvorak)" })
  -- Also allow 'ht' as a fast escape chord in insert mode
  set("i", "ht", function()
    local cmp = package.loaded.cmp
    if cmp and cmp.visible() then cmp.abort() end
    return "<C-g>u<Esc>"
  end, { expr = true, desc = "ht as Escape (Dvorak)" })
  -- Alternate ways to insert a dash
  set("i", "<M-->", "-", { desc = "Insert dash (Alt-minus)" })
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

local function lsp_picker_or_builtin(name, fallback)
  return function()
    local ok, tb = pcall(require, "telescope.builtin")
    if ok and type(tb[name]) == "function" then
      return tb[name]()
    end
    if type(fallback) == "function" then
      return fallback()
    end
  end
end

local function apply_plugin_overrides()
  -- Prefer Telescope pickers if available; fallback to built-in LSP
  set("n", "gd", lsp_picker_or_builtin("lsp_definitions", vim.lsp.buf.definition), { desc = "Go to definition" })
  set(
    "n",
    "gr",
    lsp_picker_or_builtin("lsp_references", function()
      vim.lsp.buf.references({ includeDeclaration = false })
    end),
    { desc = "References" }
  )
  set("n", "gn", lsp_picker_or_builtin("lsp_implementations", vim.lsp.buf.implementation), { desc = "Implementation" })
  set(
    "n",
    "gy",
    lsp_picker_or_builtin("lsp_type_definitions", vim.lsp.buf.type_definition),
    { desc = "Type definition" }
  )
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

  -- Re-apply after plugins and LSP attach (but not on every buffer) to keep your maps winning.
  vim.api.nvim_create_autocmd("User", {
    pattern = { "VeryLazy", "LazyVimStarted" },
    callback = function()
      vim.schedule(apply_all)
    end,
  })
  vim.api.nvim_create_autocmd("LspAttach", {
    callback = function()
      vim.schedule(apply_all)
    end,
  })
  vim.api.nvim_create_autocmd("UIEnter", {
    once = true,
    callback = function()
      vim.schedule(apply_all)
    end,
  })

  -- Manual command to re-apply on demand
  vim.api.nvim_create_user_command("DvorakReapply", function()
    apply_all()
  end, {})
end

return M
