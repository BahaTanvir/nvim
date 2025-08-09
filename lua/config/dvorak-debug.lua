-- Debug helper for Dvorak mappings
local M = {}

function M.check_mappings()
  print("=== Dvorak Mapping Check ===")
  
  -- Check what 't' is mapped to
  local t_mapping = vim.fn.maparg("t", "n")
  print("t is mapped to: " .. (t_mapping ~= "" and t_mapping or "nothing"))
  
  -- Check what 'T' is mapped to  
  local T_mapping = vim.fn.maparg("T", "n")
  print("T is mapped to: " .. (T_mapping ~= "" and T_mapping or "nothing"))
  
  -- Check what 'l' is mapped to
  local l_mapping = vim.fn.maparg("l", "n")
  print("l is mapped to: " .. (l_mapping ~= "" and l_mapping or "nothing"))
  
  -- Check what 'L' is mapped to
  local L_mapping = vim.fn.maparg("L", "n")
  print("L is mapped to: " .. (L_mapping ~= "" and L_mapping or "nothing"))
  
  print("========================")
end

function M.force_apply_dvorak()
  print("Force applying Dvorak mappings...")
  
  -- Force apply the mappings
  vim.keymap.set("n", "t", "w", { desc = "Move to next word (FORCED)", noremap = true })
  vim.keymap.set("n", "T", "W", { desc = "Move to next WORD (FORCED)", noremap = true })
  vim.keymap.set("v", "t", "w", { desc = "Move to next word (FORCED)", noremap = true })
  vim.keymap.set("v", "T", "W", { desc = "Move to next WORD (FORCED)", noremap = true })
  
  print("Dvorak mappings force applied!")
  M.check_mappings()
end

-- Create commands for debugging
vim.api.nvim_create_user_command("DvorakCheck", M.check_mappings, {
  desc = "Check current Dvorak key mappings"
})

vim.api.nvim_create_user_command("DvorakForce", M.force_apply_dvorak, {
  desc = "Force apply Dvorak mappings"
})

return M