return {
  -- Floaterm - Floating terminal plugin
  {
    "voldikss/vim-floaterm",
    cmd = { "FloatermNew", "FloatermToggle", "FloatermPrev", "FloatermNext", "FloatermSend" },
    keys = {
      -- Toggle floating terminal
      { "<leader>tt", "<cmd>FloatermToggle<cr>", desc = "Toggle floating terminal" },
      {
        "<F7>",
        function()
          vim.cmd("FloatermToggle")
        end,
        mode = { "n", "t", "i" },
        desc = "Toggle floating terminal",
      },

      -- Create new terminal
      { "<leader>tN", "<cmd>FloatermNew<cr>", desc = "New floating terminal" },
      -- Navigate between terminals
      { "<leader>te", "<cmd>FloatermPrev<cr>", desc = "Previous terminal" },
      { "<leader>tw", "<cmd>FloatermNext<cr>", desc = "Next terminal" },
      {
        "<F10>",
        function()
          vim.cmd("FloatermNext")
        end,
        mode = { "n", "t", "i" },
        desc = "Next Floaterm terminal",
      },
      -- Kill current terminal (works for both floaterm and toggleterm)
      {
        "<leader>tk",
        function()
          local buf = vim.api.nvim_get_current_buf()
          local bufname = vim.api.nvim_buf_get_name(buf)
          local filetype = vim.bo[buf].filetype

          if bufname:match("floaterm") or filetype == "floaterm" then
            vim.cmd("FloatermKill")
          elseif bufname:match("toggleterm") or filetype == "toggleterm" then
            vim.cmd("ToggleTermToggle")
          else
            -- Try to find any open terminal and close it
            local found_terminal = false
            for _, win in ipairs(vim.api.nvim_list_wins()) do
              local win_buf = vim.api.nvim_win_get_buf(win)
              local win_bufname = vim.api.nvim_buf_get_name(win_buf)
              local win_filetype = vim.bo[win_buf].filetype

              if win_bufname:match("floaterm") or win_filetype == "floaterm" then
                vim.cmd("FloatermKill")
                found_terminal = true
                break
              elseif win_bufname:match("toggleterm") or win_filetype == "toggleterm" then
                vim.cmd("ToggleTermToggle")
                found_terminal = true
                break
              end
            end

            if not found_terminal then
              vim.notify("No terminal found to kill", vim.log.levels.WARN)
            end
          end
        end,
        desc = "Kill current terminal (floaterm/toggleterm)",
      },

      -- Show all terminals
      { "<leader>fa", "<cmd>FloatermNew ranger<cr>", desc = "Open ranger file manager" },

      -- Terminal mode mappings
      { "<C-\\><C-n>", "<C-\\><C-n>", mode = "t", desc = "Exit terminal mode" },
      { "ht", "<C-\\><C-n>", mode = "t", desc = "Quick exit terminal mode" },
    },
    config = function()
      -- Floaterm configuration
      vim.g.floaterm_keymap_toggle = "<F7>"
      vim.g.floaterm_keymap_new = ""
      vim.g.floaterm_keymap_prev = ""
      vim.g.floaterm_keymap_next = "<F10>"
      -- Terminal appearance
      vim.g.floaterm_width = 0.85
      vim.g.floaterm_height = 0.98
      vim.g.floaterm_wintype = "float"
      vim.g.floaterm_position = "center"
      vim.g.floaterm_borderchars = "─│─│╭╮╯╰"

      -- Terminal behavior
      vim.g.floaterm_autoclose = 1
      vim.g.floaterm_autohide = 1
      vim.g.floaterm_autoinsert = false

      -- Shell configuration (prefer your detected shell when available)
      local ok, term = pcall(require, "config.terminal")
      if ok then
        vim.g.floaterm_shell = term.shell()
      else
        if vim.fn.executable("fish") == 1 then
          vim.g.floaterm_shell = "fish"
        elseif vim.fn.executable("zsh") == 1 then
          vim.g.floaterm_shell = "zsh"
        else
          vim.g.floaterm_shell = "bash"
        end
      end

      -- Custom terminal titles
      vim.g.floaterm_title = "Terminal: $1/$2"

      -- Auto commands for better terminal experience
      local augroup = vim.api.nvim_create_augroup("FloatermConfig", { clear = true })

      -- Start in insert mode only for ToggleTerm terminals; Floaterm opens in normal mode
      vim.api.nvim_create_autocmd("TermOpen", {
        group = augroup,
        pattern = "*",
        callback = function(ev)
          local name = vim.api.nvim_buf_get_name(ev.buf):lower()
          if name:match("toggleterm#") then
            vim.cmd("startinsert")
          end
        end,
      })

      -- Hide line numbers only for Floaterm terminals
      vim.api.nvim_create_autocmd("TermOpen", {
        group = augroup,
        pattern = "*",
        callback = function(ev)
          local name = vim.api.nvim_buf_get_name(ev.buf):lower()
          if name:match("floaterm") then
            vim.opt_local.number = false
            vim.opt_local.relativenumber = false
            vim.opt_local.signcolumn = "no"
          end
        end,
      })

      -- Custom commands for common terminal tasks
      vim.api.nvim_create_user_command("TermGitStatus", function()
        vim.cmd("FloatermNew --height=0.9 --width=0.9 --title=GitStatus git status")
      end, { desc = "Open git status in floating terminal" })

      vim.api.nvim_create_user_command("TermGitLog", function()
        vim.cmd("FloatermNew --height=0.9 --width=0.9 --title=GitLog git log --oneline --graph --all")
      end, { desc = "Open git log in floating terminal" })

      vim.api.nvim_create_user_command("TermNodeREPL", function()
        vim.cmd("FloatermNew --title=NodeREPL node")
      end, { desc = "Open Node.js REPL in floating terminal" })

      vim.api.nvim_create_user_command("TermPythonREPL", function()
        vim.cmd("FloatermNew --title=PythonREPL python3")
      end, { desc = "Open Python REPL in floating terminal" })
    end,
  },

  -- ToggleTerm for floating terminal
  {
    "akinsho/toggleterm.nvim",
    version = "*",
    keys = {
      { "<leader>tf", "<cmd>1ToggleTerm direction=float<cr>", desc = "Toggle floating terminal (toggleterm)" },
      { "<leader>tv", "<cmd>2ToggleTerm direction=vertical<cr>", desc = "Toggle vertical terminal (toggleterm)" },
      {
        "<F8>",
        function()
          vim.cmd("1ToggleTerm direction=float")
        end,
        mode = { "n", "t", "i" },
        desc = "Toggle floating terminal (toggleterm)",
      },
      {
        "<F9>",
        function()
          vim.cmd("2ToggleTerm direction=vertical")
        end,
        mode = { "n", "t", "i" },
        desc = "Toggle vertical terminal (toggleterm)",
      },
    },
    cmd = { "ToggleTerm" },
    opts = {
      size = function(term)
        if term.direction == "horizontal" then
          return 15
        elseif term.direction == "vertical" then
          return vim.o.columns * 0.4
        end
      end,
      open_mapping = false, -- Disable default mapping since we use custom key
      hide_numbers = true,
      shade_terminals = true,
      start_in_insert = true,
      insert_mappings = true,
      terminal_mappings = true,
      persist_size = true,
      persist_mode = true,
      direction = "float",
      close_on_exit = true,
      shell = vim.o.shell,
      auto_scroll = true,
      float_opts = {
        border = "curved",
        width = function()
          return math.floor(vim.o.columns * 0.8)
        end,
        height = function()
          return math.floor(vim.o.lines * 0.2)
        end,
        winblend = 3,
        zindex = 1000,
        title_pos = "center",
        highlights = {
          border = "Normal",
          background = "Normal",
        },
      },
      winbar = {
        enabled = false,
      },
    },
    config = function(_, opts)
      require("toggleterm").setup(opts)

      -- Custom terminal mappings for toggleterm
      function _G.set_terminal_keymaps()
        local opts = { buffer = 0, silent = true }
        vim.keymap.set("t", "<esc>", [[<C-\><C-n>]], opts)
        vim.keymap.set("t", "ht", [[<C-\><C-n>]], opts)
        vim.keymap.set("n", "q", [[<Cmd>close<CR>]], opts)
        vim.keymap.set("t", "<C-h>", [[<Cmd>wincmd h<CR>]], opts)
        vim.keymap.set("t", "<C-j>", [[<Cmd>wincmd j<CR>]], opts)
        vim.keymap.set("t", "<C-k>", [[<Cmd>wincmd k<CR>]], opts)
        vim.keymap.set("t", "<C-l>", [[<Cmd>wincmd l<CR>]], opts)
        vim.keymap.set("t", "<C-w>", [[<C-\><C-n><C-w>]], opts)
      end

      -- Apply terminal keymaps when opening toggleterm
      vim.api.nvim_create_autocmd("TermOpen", {
        pattern = "term://*toggleterm#*",
        callback = function()
          -- Delay the keymap setting to ensure it overrides other mappings
          vim.schedule(function()
            set_terminal_keymaps()
            -- Switch to normal mode only for vertical toggleterm (terminal #2)
            local bufname = vim.api.nvim_buf_get_name(0)
            if bufname:match("toggleterm#2") then
              vim.cmd("stopinsert")
            end
          end)
        end,
      })
    end,
  },
}
