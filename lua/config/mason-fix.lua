-- Mason installation fix
-- This file helps with manual installation of tools that might fail

local M = {}

-- Function to install tools manually if auto-install fails
function M.install_missing_tools()
  local mason_registry = require("mason-registry")
  
  -- List of essential tools to install manually if needed
  local essential_tools = {
    "lua-language-server",
    "stylua",
    "prettier",
    "eslint_d",
    "black",
    "isort",
    "shellcheck",
    "shfmt",
  }
  
  for _, tool in ipairs(essential_tools) do
    if not mason_registry.is_installed(tool) then
      print("Installing " .. tool .. "...")
      local package = mason_registry.get_package(tool)
      package:install():once("closed", function()
        if package:is_installed() then
          print(tool .. " installed successfully!")
        else
          print("Failed to install " .. tool)
        end
      end)
    end
  end
end

-- Function to check installation status
function M.check_installation_status()
  local mason_registry = require("mason-registry")
  
  local tools = {
    "lua-language-server",
    "stylua", 
    "prettier",
    "eslint_d",
    "black",
    "isort",
    "shellcheck",
    "shfmt",
    "golangci-lint",
    "hadolint",
  }
  
  print("Mason Installation Status:")
  print("=" .. string.rep("=", 30))
  
  for _, tool in ipairs(tools) do
    local status = mason_registry.is_installed(tool) and "✓ Installed" or "✗ Not installed"
    print(string.format("%-20s %s", tool, status))
  end
end

return M