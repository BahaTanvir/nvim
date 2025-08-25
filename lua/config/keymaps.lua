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
