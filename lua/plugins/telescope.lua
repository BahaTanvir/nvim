return {
  "nvim-telescope/telescope.nvim",
  branch = "0.1.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
    "nvim-tree/nvim-web-devicons",
    "nvim-telescope/telescope-file-browser.nvim",
    "nvim-telescope/telescope-ui-select.nvim",
    "nvim-telescope/telescope-live-grep-args.nvim",
  },
  config = function()
    local telescope = require("telescope")
    local actions = require("telescope.actions")
    local action_layout = require("telescope.actions.layout")

    telescope.setup({
      defaults = {
        prompt_prefix = " ",
        selection_caret = " ",
        path_display = { "truncate" },
        file_ignore_patterns = { 
          "%.git/", 
          "node_modules/", 
          "%.npm/", 
          "__pycache__/",
          "%.pyc",
          "%.pyo",
          "%.pyd",
          "%.so",
          "%.dll",
          "%.class",
          "%.jar",
          "%.war",
          "%.ear",
          "target/",
          "build/",
          "dist/",
          "_build/",
          "deps/",
          ".elixir_ls/",
        },
        layout_config = {
          horizontal = {
            prompt_position = "top",
            preview_width = 0.55,
            results_width = 0.8,
          },
          vertical = {
            mirror = false,
          },
          width = 0.87,
          height = 0.80,
          preview_cutoff = 120,
        },
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous,
            ["<C-j>"] = actions.move_selection_next,
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
            ["<C-l>"] = actions.send_to_qflist + actions.open_qflist,
            ["<Tab>"] = actions.toggle_selection + actions.move_selection_worse,
            ["<S-Tab>"] = actions.toggle_selection + actions.move_selection_better,
            ["<C-u>"] = false,
            ["<C-d>"] = false,
            ["<C-p>"] = action_layout.toggle_preview,
            ["<C-o>"] = action_layout.toggle_mirror,
            ["<C-h>"] = actions.which_key,
          },
          n = {
            ["<C-p>"] = action_layout.toggle_preview,
            ["<C-o>"] = action_layout.toggle_mirror,
            ["q"] = actions.close,
          },
        },
        sorting_strategy = "ascending",
        winblend = 0,
        border = {},
        borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        color_devicons = true,
        use_less = true,
        set_env = { ["COLORTERM"] = "truecolor" },
      },
      pickers = {
        find_files = {
          theme = "dropdown",
          previewer = false,
          hidden = true,
          find_command = { "rg", "--files", "--hidden", "--glob", "!**/.git/*" },
        },
        live_grep = {
          theme = "ivy",
        },
        grep_string = {
          theme = "ivy",
        },
        buffers = {
          theme = "dropdown",
          previewer = false,
          initial_mode = "normal",
          mappings = {
            i = {
              ["<C-d>"] = actions.delete_buffer,
            },
            n = {
              ["dd"] = actions.delete_buffer,
            },
          },
        },
        planets = {
          show_pluto = true,
          show_moon = true,
        },
        colorscheme = {
          enable_preview = true,
        },
        lsp_references = {
          theme = "ivy",
          initial_mode = "normal",
        },
        lsp_definitions = {
          theme = "ivy",
          initial_mode = "normal",
        },
        lsp_declarations = {
          theme = "ivy",
          initial_mode = "normal",
        },
        lsp_implementations = {
          theme = "ivy",
          initial_mode = "normal",
        },
      },
      extensions = {
        fzf = {
          fuzzy = true,
          override_generic_sorter = true,
          override_file_sorter = true,
          case_mode = "smart_case",
        },
        ["ui-select"] = {
          require("telescope.themes").get_dropdown({}),
        },
        file_browser = {
          theme = "ivy",
          hijack_netrw = true,
          mappings = {
            ["i"] = {},
            ["n"] = {},
          },
        },
        live_grep_args = {
          auto_quoting = true,
          mappings = {
            i = {
              ["<C-k>"] = require("telescope-live-grep-args.actions").quote_prompt(),
              ["<C-i>"] = require("telescope-live-grep-args.actions").quote_prompt({ postfix = " --iglob " }),
            },
          },
        },
      },
    })

    -- Load extensions
    telescope.load_extension("fzf")
    telescope.load_extension("ui-select")
    telescope.load_extension("file_browser")
    telescope.load_extension("live_grep_args")

    -- Keymaps
    local keymap = vim.keymap

    -- File pickers
    keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    keymap.set("n", "<leader>fS", "<cmd>Telescope live_grep_args<cr>", { desc = "Find string with args" })
    keymap.set("n", "<leader>mm", "<cmd>Telescope live_grep<cr>", { desc = "Live grep (quick access)" })
    keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find buffers" })
    keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find help tags" })
    keymap.set("n", "<leader>fm", "<cmd>Telescope marks<cr>", { desc = "Find marks" })
    keymap.set("n", "<leader>fo", "<cmd>Telescope vim_options<cr>", { desc = "Find vim options" })
    keymap.set("n", "<leader>fR", "<cmd>Telescope registers<cr>", { desc = "Find registers" })
    keymap.set("n", "<leader>fk", "<cmd>Telescope keymaps<cr>", { desc = "Find keymaps" })
    keymap.set("n", "<leader>fC", "<cmd>Telescope commands<cr>", { desc = "Find commands" })

    -- LSP pickers
    keymap.set("n", "<leader>lR", "<cmd>Telescope lsp_references<cr>", { desc = "Find LSP references" })
    keymap.set("n", "<leader>lD", "<cmd>Telescope lsp_definitions<cr>", { desc = "Find LSP definitions" })
    keymap.set("n", "<leader>lI", "<cmd>Telescope lsp_implementations<cr>", { desc = "Find LSP implementations" })
    keymap.set("n", "<leader>lT", "<cmd>Telescope lsp_type_definitions<cr>", { desc = "Find LSP type definitions" })
    keymap.set("n", "<leader>ls", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find document symbols" })
    keymap.set("n", "<leader>lS", "<cmd>Telescope lsp_workspace_symbols<cr>", { desc = "Find workspace symbols" })

    -- Git pickers
    keymap.set("n", "<leader>gc", "<cmd>Telescope git_commits<cr>", { desc = "Find git commits" })
    keymap.set("n", "<leader>gC", "<cmd>Telescope git_bcommits<cr>", { desc = "Find git buffer commits" })
    keymap.set("n", "<leader>gb", "<cmd>Telescope git_branches<cr>", { desc = "Find git branches" })
    keymap.set("n", "<leader>gs", "<cmd>Telescope git_status<cr>", { desc = "Find git status" })

    -- Treesitter
    keymap.set("n", "<leader>ft", "<cmd>Telescope treesitter<cr>", { desc = "Find treesitter symbols" })

    -- File browser
    keymap.set("n", "<leader>fB", "<cmd>Telescope file_browser<cr>", { desc = "File browser" })
    keymap.set("n", "<leader>fe", function()
      require("telescope").extensions.file_browser.file_browser({
        path = "%:p:h",
        cwd = vim.fn.expand("%:p:h"),
        respect_gitignore = false,
        hidden = true,
        grouped = true,
        previewer = false,
        initial_mode = "normal",
        layout_config = { height = 40 }
      })
    end, { desc = "File browser (current file)" })
  end,
}