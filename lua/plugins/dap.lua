return {
  {
    "mfussenegger/nvim-dap",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "rcarriga/nvim-dap-ui",
      "williamboman/mason.nvim",
      "jay-babu/mason-nvim-dap.nvim",
      "nvim-neotest/nvim-nio",
    },
    config = function()
      local dap = require("dap")
      local dapui = require("dapui")

      -- Setup DAP UI
      dapui.setup()

      -- Auto open/close UI
      dap.listeners.after.event_initialized["dapui_config"] = function()
        dapui.open()
      end
      dap.listeners.before.event_terminated["dapui_config"] = function()
        dapui.close()
      end
      dap.listeners.before.event_exited["dapui_config"] = function()
        dapui.close()
      end

      -- Setup mason-nvim-dap for installing debug adapters
      require("mason-nvim-dap").setup({
        ensure_installed = { "codelldb" },
        automatic_installation = true,
        handlers = {
          function(config)
            require("mason-nvim-dap").default_setup(config)
          end,
        },
      })

      -- Keymaps
      local map = vim.keymap.set
      local opts = { noremap = true, silent = true }
      map("n", "<F5>", dap.continue, vim.tbl_extend("force", opts, { desc = "DAP Continue" }))
      map("n", "<F10>", dap.step_over, vim.tbl_extend("force", opts, { desc = "DAP Step Over" }))
      map("n", "<F11>", dap.step_into, vim.tbl_extend("force", opts, { desc = "DAP Step Into" }))
      map("n", "<F12>", dap.step_out, vim.tbl_extend("force", opts, { desc = "DAP Step Out" }))
      map("n", "<leader>db", dap.toggle_breakpoint, vim.tbl_extend("force", opts, { desc = "DAP Toggle Breakpoint" }))
      map("n", "<leader>dB", function() dap.set_breakpoint(vim.fn.input('Breakpoint condition: ')) end, vim.tbl_extend("force", opts, { desc = "DAP Conditional Breakpoint" }))
      map("n", "<leader>dr", dap.repl.open, vim.tbl_extend("force", opts, { desc = "DAP REPL" }))
      map("n", "<leader>dl", dap.run_last, vim.tbl_extend("force", opts, { desc = "DAP Run Last" }))
      map("n", "<leader>du", dapui.toggle, vim.tbl_extend("force", opts, { desc = "DAP UI Toggle" }))

      -- Rust-specific configuration (codelldb)
      -- mason-nvim-dap will set up codelldb adapter automatically; if not, you can override here
      -- Example manual setup (kept commented):
      -- local mason_registry = require("mason-registry")
      -- local codelldb = mason_registry.get_package("codelldb")
      -- local codelldb_path = codelldb:get_install_path() .. "/extension/adapter/codelldb"
      -- dap.adapters.codelldb = {
      --   type = "server",
      --   port = "${port}",
      --   executable = {
      --     command = codelldb_path,
      --     args = { "--port", "${port}" },
      --   },
      -- }
      -- dap.configurations.rust = {
      --   {
      --     name = "Launch",
      --     type = "codelldb",
      --     request = "launch",
      --     program = function()
      --       return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/target/debug/', 'file')
      --     end,
      --     cwd = "${workspaceFolder}",
      --     stopOnEntry = false,
      --   },
      -- }
    end,
  },
  {
    "rcarriga/nvim-dap-ui",
    lazy = true,
  },
}
