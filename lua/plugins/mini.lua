return {
  {
    "echasnovski/mini.nvim",
    version = "*",
    event = "VeryLazy",
    config = function()
      -- Better Around/Inside textobjects
      require("mini.ai").setup({
        n_lines = 500,
        custom_textobjects = {
          o = require("mini.ai").gen_spec.treesitter({
            a = { "@block.outer", "@conditional.outer", "@loop.outer" },
            i = { "@block.inner", "@conditional.inner", "@loop.inner" },
          }, {}),
          f = require("mini.ai").gen_spec.treesitter({ a = "@function.outer", i = "@function.inner" }, {}),
          c = require("mini.ai").gen_spec.treesitter({ a = "@class.outer", i = "@class.inner" }, {}),
          t = { "<([%p%w]-)%f[^<%w][^<>]->.-</%1>", "^<.->().*()</[^/]->$" },
        },
      })

      -- Add/delete/replace surroundings (brackets, quotes, etc.)
      require("mini.surround").setup({
        mappings = {
          add = "gsa", -- Add surrounding in Normal and Visual modes
          delete = "gsd", -- Delete surrounding
          find = "gsf", -- Find surrounding (to the right)
          find_left = "gsF", -- Find surrounding (to the left)
          highlight = "gsh", -- Highlight surrounding
          replace = "gsr", -- Replace surrounding
          update_n_lines = "gsn", -- Update `n_lines`
        },
      })

      -- Better buffer delete
      require("mini.bufremove").setup()

      -- File browser
      require("mini.files").setup({
        content = {
          filter = nil,
          prefix = function()
            return ""
          end,
          sort = nil,
        },
        mappings = {
          close = "q",
          go_in = "l",
          go_in_plus = "L",
          go_out = "h",
          go_out_plus = "H",
          reset = "<BS>",
          reveal_cwd = "@",
          show_help = "g?",
          synchronize = "=",
          trim_left = "<",
          trim_right = ">",
        },
        options = {
          permanent_delete = true,
          use_as_default_explorer = false,
        },
        windows = {
          max_number = math.huge,
          preview = false,
          width_focus = 50,
          width_nofocus = 15,
        },
      })

      -- Indentscope
      require("mini.indentscope").setup({
        symbol = "│",
        options = { try_as_border = true },
      })

      -- Animate cursor movements
      require("mini.animate").setup({
        cursor = {
          enable = true,
          timing = require("mini.animate").gen_timing.linear({ duration = 100, unit = "total" }),
        },
        scroll = {
          enable = false, -- Can be distracting
        },
        resize = {
          enable = true,
          timing = require("mini.animate").gen_timing.linear({ duration = 100, unit = "total" }),
        },
        open = {
          enable = true,
          timing = require("mini.animate").gen_timing.linear({ duration = 150, unit = "total" }),
        },
        close = {
          enable = true,
          timing = require("mini.animate").gen_timing.linear({ duration = 150, unit = "total" }),
        },
      })

      -- Highlight patterns
      require("mini.hipatterns").setup({
        highlighters = {
          -- Highlight standalone 'FIXME', 'HACK', 'TODO', 'NOTE'
          fixme = { pattern = "%f[%w]()FIXME()%f[%W]", group = "MiniHipatternsFixme" },
          hack = { pattern = "%f[%w]()HACK()%f[%W]", group = "MiniHipatternsHack" },
          todo = { pattern = "%f[%w]()TODO()%f[%W]", group = "MiniHipatternsTodo" },
          note = { pattern = "%f[%w]()NOTE()%f[%W]", group = "MiniHipatternsNote" },

          -- Highlight hex color strings (`#rrggbb`) using that color
          hex_color = require("mini.hipatterns").gen_highlighter.hex_color(),
        },
      })

      -- Key mappings
      vim.keymap.set("n", "<leader>bd", function()
        require("mini.bufremove").delete(0, false)
      end, { desc = "Delete Buffer" })

      vim.keymap.set("n", "<leader>bD", function()
        require("mini.bufremove").delete(0, true)
      end, { desc = "Delete Buffer (Force)" })

      vim.keymap.set("n", "<leader>fm", function()
        require("mini.files").open(vim.api.nvim_buf_get_name(0), true)
      end, { desc = "Open mini.files (Directory of Current File)" })

      vim.keymap.set("n", "<leader>fM", function()
        require("mini.files").open(vim.loop.cwd(), true)
      end, { desc = "Open mini.files (cwd)" })
    end,
  },
}