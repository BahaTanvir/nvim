local util = require("util")
local term = require("config.terminal")

util.cowboy()
if term.is_wezterm then
  util.wezterm()
end

vim.keymap.set("n", "<C-c>", "ciw")
vim.keymap.set("n", "<Up>", "<c-w>k")
vim.keymap.set("n", "<Down>", "<c-w>j")
vim.keymap.set("n", "<Left>", "<c-w>h")
vim.keymap.set("n", "<Right>", "<c-w>l")

-- Quick save (current buffer)
vim.keymap.set("n", "<leader>a", function()
  if vim.bo.modifiable and vim.bo.buftype == "" then
    if vim.bo.modified then
      vim.cmd("update")
      vim.api.nvim_echo({ { "Saved!", "MoreMsg" } }, false, {})
    end
  else
    pcall(vim.notify, "Buffer not modifiable", vim.log.levels.WARN, { title = "Save" })
  end
end, { desc = "Save file" })

-- Write all modified files
vim.keymap.set("n", "<leader>A", function()
  local count = 0
  for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    local ok = pcall(function()
      if vim.bo[buf].modified and vim.bo[buf].buftype == "" and vim.bo[buf].modifiable then
        count = count + 1
      end
    end)
  end
  if count > 0 then
    vim.cmd("wall")
    local msg = ("Saved %d file%s"):format(count, count == 1 and "" or "s")
    vim.api.nvim_echo({ { msg, "MoreMsg" } }, false, {})
  end
end, { desc = "Save all modified files" })
