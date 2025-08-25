-- Terminal environment detection and helpers
-- Works for WSL2 + WezTerm, Kitty, iTerm, Neovide, plain TTY

local M = {}

local has = vim.fn.has
local env = vim.env

-- Environment flags
M.is_windows = has("win32") == 1
M.is_wsl = has("wsl") == 1
M.term_program = env.TERM_PROGRAM or ""
M.term = env.TERM or ""
M.is_wezterm = env.WEZTERM_PANE ~= nil or M.term:lower():find("wezterm") ~= nil
M.is_kitty = env.KITTY_LISTEN_ON ~= nil or M.term:lower():find("kitty") ~= nil
M.is_iterm = M.term_program:lower():find("iterm") ~= nil
M.is_neovide = not not vim.g.neovide
M.is_tmux = env.TMUX ~= nil
M.is_ssh = env.SSH_TTY ~= nil or env.SSH_CONNECTION ~= nil

-- Determine the best shell to use inside Neovim terminals
function M.shell()
  -- Windows (not WSL)
  if M.is_windows and not M.is_wsl then
    if vim.fn.executable("pwsh") == 1 then
      return "pwsh"
    elseif vim.fn.executable("powershell") == 1 then
      return "powershell"
    else
      return "cmd"
    end
  end
  -- Unix-like (Linux/macOS/WSL)
  local sh = env.SHELL
  if sh and vim.fn.executable(sh) == 1 then
    return sh
  end
  for _, s in ipairs({ "zsh", "bash", "fish", "sh" }) do
    if vim.fn.executable(s) == 1 then
      return s
    end
  end
  return "sh"
end

-- Whether inline image features should be enabled (Snacks image, etc.)
-- Be conservative under tmux/SSH to avoid glitches unless using GUI.
function M.image_enabled()
  if M.is_neovide then
    return true
  end
  if M.is_tmux or M.is_ssh then
    return false
  end
  if M.is_wezterm or M.is_kitty or M.is_iterm then
    return true
  end
  return false
end

return M
