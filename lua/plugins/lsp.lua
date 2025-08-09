return {
  {
    "williamboman/mason.nvim",
    dependencies = {
      "williamboman/mason-lspconfig.nvim",
      "WhoIsSethDaniel/mason-tool-installer.nvim",
    },
    config = function()
      -- import mason
      local mason = require("mason")
      local mason_lspconfig = require("mason-lspconfig")
      local mason_tool_installer = require("mason-tool-installer")

      -- enable mason and configure icons
      mason.setup({
        ui = {
          icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗",
          },
        },
      })

      mason_lspconfig.setup({
        -- list of servers for mason to install
        ensure_installed = {
          "lua_ls",
          "rust_analyzer",
          "gopls",
          "pyright",
          "elixirls",
          "ts_ls",
          "html",
          "cssls",
          "emmet_ls",
          "tailwindcss",
          "jsonls",
          "yamlls",
        },
      })

      mason_tool_installer.setup({
        ensure_installed = {
          -- Formatters
          "prettier", -- prettier formatter
          "stylua", -- lua formatter
          "isort", -- python import sorter
          "black", -- python formatter
          "shfmt", -- shell formatter
          
          -- Linters
          "eslint_d", -- js linter
          "golangci-lint", -- go linter
          "shellcheck", -- shell linter
          "hadolint", -- dockerfile linter
          
          -- Go tools
          "gofumpt", -- go formatter
          "goimports", -- go formatter
          
          -- Debug adapters
          "codelldb", -- rust/c++ debugger
          "delve", -- go debugger
          "debugpy", -- python debugger
        },
        -- Auto-install configured servers, tools & formatters
        auto_update = false,
        run_on_start = true,
        start_delay = 3000, -- 3 second delay
        debounce_hours = 5, -- at least 5 hours between attempts
      })
    end,
  },
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations", config = true },
      { "folke/neodev.nvim", opts = {} },
      "b0o/schemastore.nvim",
    },
    config = function()
      -- import lspconfig plugin
      local lspconfig = require("lspconfig")
      local cmp_nvim_lsp = require("cmp_nvim_lsp")

      local keymap = vim.keymap -- for conciseness

      vim.api.nvim_create_autocmd("LspAttach", {
        group = vim.api.nvim_create_augroup("UserLspConfig", {}),
        callback = function(ev)
          -- Buffer local mappings.
          local opts = { buffer = ev.buf, silent = true }

          -- set keybinds
          opts.desc = "Show LSP references"
          keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

          opts.desc = "Go to declaration"
          keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

          opts.desc = "Show LSP definitions"
          keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

          opts.desc = "Show LSP implementations"
          keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

          opts.desc = "Show LSP type definitions"
          keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

          opts.desc = "See available code actions"
          keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

          opts.desc = "Smart rename"
          keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

          opts.desc = "Show buffer diagnostics"
          keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

          opts.desc = "Show line diagnostics"
          keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

          opts.desc = "Go to previous diagnostic"
          keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

          opts.desc = "Go to next diagnostic"
          keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

          opts.desc = "Show documentation for what is under cursor"
          keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

          opts.desc = "Restart LSP"
          keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
        end,
      })

      -- used to enable autocompletion (assign to every lsp server config)
      local capabilities = cmp_nvim_lsp.default_capabilities()

      -- Change the Diagnostic symbols in the sign column (gutter)
      local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
      for type, icon in pairs(signs) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      -- Try to import mason_lspconfig safely
      local mason_lspconfig_ok, mason_lspconfig_module = pcall(require, "mason-lspconfig")
      if not mason_lspconfig_ok then
        vim.notify("mason-lspconfig not available, setting up LSP servers manually", vim.log.levels.WARN)
        
        -- Fallback: setup LSP servers manually
        local servers = { "lua_ls", "rust_analyzer", "gopls", "pyright", "ts_ls", "html", "cssls", "jsonls", "yamlls" }
        for _, server in ipairs(servers) do
          if pcall(require, "lspconfig." .. server) then
            lspconfig[server].setup({
              capabilities = capabilities,
            })
          end
        end
        return
      end

      -- Compatibility: define setup_handlers shim for older mason-lspconfig versions
      if type(mason_lspconfig_module.setup_handlers) ~= 'function' then
        function mason_lspconfig_module.setup_handlers(handlers)
          local servers = {}
          local ok_get, get = pcall(function() return mason_lspconfig_module.get_installed_servers end)
          if ok_get and type(get) == 'function' then
            servers = mason_lspconfig_module.get_installed_servers()
          else
            servers = { "lua_ls","rust_analyzer","gopls","pyright","elixirls","ts_ls","html","cssls","jsonls","yamlls" }
          end
          for _, server in ipairs(servers) do
            local handler = handlers[server] or handlers[1]
            if type(handler) == 'function' then
              handler(server)
            end
          end
        end
      end

      mason_lspconfig_module.setup_handlers({
        -- default handler for installed servers
        function(server_name)
          lspconfig[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["lua_ls"] = function()
          -- configure lua server (with special settings)
          lspconfig["lua_ls"].setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                -- make the language server recognize "vim" global
                diagnostics = {
                  globals = { "vim" },
                },
                completion = {
                  callSnippet = "Replace",
                },
              },
            },
          })
        end,
        ["rust_analyzer"] = function()
          lspconfig["rust_analyzer"].setup({
            capabilities = capabilities,
            settings = {
              ["rust-analyzer"] = {
                cargo = {
                  allFeatures = true,
                },
                checkOnSave = {
                  command = "clippy",
                },
              },
            },
          })
        end,
        ["gopls"] = function()
          lspconfig["gopls"].setup({
            capabilities = capabilities,
            settings = {
              gopls = {
                analyses = {
                  unusedparams = true,
                },
                staticcheck = true,
                gofumpt = true,
              },
            },
          })
        end,
        ["pyright"] = function()
          lspconfig["pyright"].setup({
            capabilities = capabilities,
            settings = {
              python = {
                analysis = {
                  typeCheckingMode = "basic",
                },
              },
            },
          })
        end,
        ["elixirls"] = function()
          lspconfig["elixirls"].setup({
            -- Prefer Mason-installed binary, fallback to system 'elixir-ls'
            cmd = (function()
              local mason_cmd = vim.fn.stdpath("data") .. "/mason/bin/elixir-ls"
              if vim.loop.fs_stat(mason_cmd) then
                return { mason_cmd }
              else
                return { "elixir-ls" }
              end
            end)(),
            capabilities = capabilities,
            settings = {
              elixirLS = {
                dialyzerEnabled = false,
                fetchDeps = false,
                enableTestLenses = true,
                suggestSpecs = false,
              },
            },
            on_attach = function(client, bufnr)
              local map = function(mode, lhs, rhs, desc)
                vim.keymap.set(mode, lhs, rhs, { buffer = bufnr, desc = desc, silent = true })
              end
              
              -- Basic Elixir keymaps (without elixir-tools.nvim commands)
              map("n", "<leader>er", ":LspRestart<CR>", "Elixir: restart LSP")
              map("n", "<leader>ef", vim.lsp.buf.format, "Elixir: format file")
              -- Note: <leader>mm now used for live grep - Elixir pipe commands removed
            end,
          })
        end,
        ["ts_ls"] = function()
          lspconfig["ts_ls"].setup({
            capabilities = capabilities,
            settings = {
              typescript = {
                inlayHints = {
                  includeInlayParameterNameHints = "all",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
              javascript = {
                inlayHints = {
                  includeInlayParameterNameHints = "all",
                  includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                  includeInlayFunctionParameterTypeHints = true,
                  includeInlayVariableTypeHints = true,
                  includeInlayPropertyDeclarationTypeHints = true,
                  includeInlayFunctionLikeReturnTypeHints = true,
                  includeInlayEnumMemberValueHints = true,
                },
              },
            },
          })
        end,
        ["jsonls"] = function()
          local jsonls_settings = {
            json = {
              validate = { enable = true },
            },
          }
          
          -- Try to load schemastore, but don't fail if it's not available
          local ok, schemastore = pcall(require, "schemastore")
          if ok then
            jsonls_settings.json.schemas = schemastore.json.schemas()
          end
          
          lspconfig["jsonls"].setup({
            capabilities = capabilities,
            settings = jsonls_settings,
          })
        end,
        ["yamlls"] = function()
          local yamlls_settings = {
            yaml = {
              schemaStore = {
                enable = false,
                url = "",
              },
            },
          }
          
          -- Try to load schemastore, but don't fail if it's not available
          local ok, schemastore = pcall(require, "schemastore")
          if ok then
            yamlls_settings.yaml.schemas = schemastore.yaml.schemas()
          end
          
          lspconfig["yamlls"].setup({
            capabilities = capabilities,
            settings = yamlls_settings,
          })
        end,
      })
    end,
  },
}