---@module 'lazy'

return {
  {
    "snacks.nvim",
    ---@type snacks.Config
    opts = {
      statuscolumn = { folds = { open = false } },
      notifier = { sort = { "added" } },
      scroll = { debug = false },
      image = {
        force = false,
        enabled = require("config.terminal").image_enabled(),
        debug = { request = false, convert = false, placement = false },
        math = { enabled = true },
        doc = { inline = true, float = true },
      },
      picker = {
        previewers = {
          diff = { builtin = false },
          git = { builtin = false },
        },
        debug = { scores = false, leaks = false, explorer = false, files = false, proc = true },
        sources = {
          explorer = {
            layout = {
              preset = "sidebar",
              preview = { main = true, enabled = false },
            },
          },
          files_with_symbols = {
            multi = { "files", "lsp_symbols" },
            filter = {
              ---@param p snacks.Picker
              ---@param filter snacks.picker.Filter
              transform = function(p, filter)
                local symbol_pattern = filter.pattern:match("^.-@(.*)$")
                -- store the current file buffer
                if filter.source_id ~= 2 then
                  local item = p:current()
                  if item and item.file then
                    filter.meta.buf = vim.fn.bufadd(item.file)
                  end
                end

                if symbol_pattern and filter.meta.buf then
                  filter.pattern = symbol_pattern
                  filter.current_buf = filter.meta.buf
                  filter.source_id = 2
                else
                  filter.source_id = 1
                end
              end,
            },
          },
        },
        win = {
          list = {
            keys = {
              ["<c-i>"] = { "toggle_input", mode = { "n", "i" } },
            },
          },
          input = {
            keys = {
              ["<c-l>"] = { "toggle_lua", mode = { "n", "i" } },
              ["<c-i>"] = { "toggle_input", mode = { "n", "i" } },
              -- ["<c-t>"] = { "edit_tab", mode = { "n", "i" } },
              -- ["<c-t>"] = { "yankit", mode = { "n", "i" } },
              -- ["<Esc>"] = { "close", mode = { "n", "i" } },
            },
          },
        },
        actions = {
          yankit = { action = "yank", notify = true },
          toggle_lua = function(p)
            local opts = p.opts --[[@as snacks.picker.grep.Config]]
            opts.ft = not opts.ft and "lua" or nil
            p:find()
          end,
        },
      },
      profiler = {
        -- runtime = "~/projects/neovim/runtime/",
        presets = {
          on_stop = function()
            Snacks.profiler.scratch()
          end,
        },
      },
      indent = {
        chunk = { enabled = true },
      },
      dashboard = (vim.fn.executable("gh") == 1 and vim.fn.executable("colorscript") == 1) and { example = "github" }
        or {
          sections = {
            {
              section = "header",
              text = {
                "",
                "    Neovim",
                "",
              },
            },
            { section = "keys", gap = 1 },
            { section = "startup", gap = 1 },
          },
        },
      gitbrowse = {
        open = function(url)
          -- Hyprland-specific script removed; just open the URL
          vim.ui.open(url)
        end,
      },
      terminal = {
        win = {
          height = 0.99, -- 99% of screen height
        },
      },
    },
    -- stylua: ignore
    keys = {
      { "<leader><space>", function()
          Snacks.picker.smart()
          vim.schedule(function()
            local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
            vim.api.nvim_feedkeys(esc, "n", false)
          end)
        end, desc = "Smart Open (Normal Mode)" },
      { "<leader>,", function()
          Snacks.picker.buffers()
          vim.schedule(function()
            local esc = vim.api.nvim_replace_termcodes("<Esc>", true, false, true)
            vim.api.nvim_feedkeys(esc, "n", false)
          end)
        end, desc = "Buffers (Normal Mode)" },
      { "<leader>dd", function() Snacks.picker.grep({search = "^(?!\\s*--).*\\b(bt|dd)\\(", args = {"-P"}, live = false, ft = "lua"}) end, desc = "Debug Searcher" },
      { "<leader>T", function() Snacks.scratch({ icon = " ", name = "Todo", ft = "markdown", file = "~/dot/TODO.md" }) end, desc = "Todo List" },
      {
        "<leader>dpd",
        desc = "Debug profiler",
        function()
          do return {
            a = {
              b = {
                c =  123,
              },
            },
          } end
          if not Snacks.profiler.running() then
            Snacks.notify("Profiler debug started")
            Snacks.profiler.start()
          else
            Snacks.profiler.debug()
            Snacks.notify("Profiler debug stopped")
          end
        end,
      },
    },
  },
}
