local M = {}

-- Function to check if a command exists
local function cmd_exists(cmd)
  return vim.fn.executable(cmd) == 1
end

-- Function to check plugin health
function M.check_setup()
  local health = vim.health or require("health")
  
  health.report_start("Neovim Ultimate Setup Health Check")
  
  -- Check Neovim version
  local version = vim.version()
  if version.major >= 0 and version.minor >= 9 then
    health.report_ok("Neovim version: " .. version.major .. "." .. version.minor .. "." .. version.patch)
  else
    health.report_error("Neovim version too old. Please upgrade to 0.9+")
  end
  
  -- Check required external dependencies
  local required_tools = {
    { "git", "Git version control" },
    { "rg", "Ripgrep for fast searching" },
    { "fd", "Fast file finder" },
    { "fzf", "Fuzzy finder" },
    { "node", "Node.js for various LSP servers" },
    { "python3", "Python for various tools" },
  }
  
  for _, tool in ipairs(required_tools) do
    if cmd_exists(tool[1]) then
      health.report_ok(tool[2] .. " is installed")
    else
      health.report_warn(tool[2] .. " is not installed. Some features may not work.")
    end
  end
  
  -- Check optional but recommended tools
  local optional_tools = {
    { "lazygit", "Enhanced git interface" },
    { "go", "Go programming language" },
    { "rust", "Rust programming language" },
    { "cargo", "Rust package manager" },
  }
  
  for _, tool in ipairs(optional_tools) do
    if cmd_exists(tool[1]) then
      health.report_ok(tool[2] .. " is installed")
    else
      health.report_info(tool[2] .. " is not installed (optional)")
    end
  end
  
  -- Check plugin manager
  if pcall(require, "lazy") then
    health.report_ok("Lazy.nvim plugin manager is loaded")
    local stats = require("lazy").stats()
    health.report_info("Loaded " .. stats.loaded .. "/" .. stats.count .. " plugins")
  else
    health.report_error("Lazy.nvim plugin manager not found")
  end
  
  -- Check LSP servers
  local lsp_servers = {
    "lua_ls",
    "rust_analyzer", 
    "gopls",
    "pyright",
    "tsserver",
  }
  
  for _, server in ipairs(lsp_servers) do
    local configs = require("lspconfig.configs")
    if configs[server] then
      health.report_ok("LSP server " .. server .. " is configured")
    else
      health.report_warn("LSP server " .. server .. " is not configured")
    end
  end
  
  health.report_info("Setup health check complete!")
end

return M