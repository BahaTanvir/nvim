return {
  { "akinsho/bufferline.nvim", opts = { options = { separator_style = "slope" } } },

  {
    "folke/which-key.nvim",
    enabled = true,
    opts = {
      preset = "helix",
      debug = vim.uv.cwd():find("which%-key"),
      win = {},
      spec = {},
    },
  },

  {
    "folke/noice.nvim",
    opts = function(_, opts)
      opts.debug = vim.uv.cwd():find("noice%.nvim")
      opts.debug = false
      opts.routes = opts.routes or {}
      table.insert(opts.routes, {
        filter = {
          event = "notify",
          find = "No information available",
        },
        opts = { skip = true },
      })
      local focused = true
      vim.api.nvim_create_autocmd("FocusGained", {
        callback = function()
          focused = true
        end,
      })
      vim.api.nvim_create_autocmd("FocusLost", {
        callback = function()
          focused = false
        end,
      })

      table.insert(opts.routes, 1, {
        filter = {
          ["not"] = {
            event = "lsp",
            kind = "progress",
          },
          cond = function()
            return not focused and false
          end,
        },
        view = "notify_send",
        opts = { stop = false, replace = true },
      })

      vim.api.nvim_create_autocmd("FileType", {
        pattern = "markdown",
        callback = function(event)
          vim.schedule(function()
            require("noice.text.markdown").keys(event.buf)
          end)
        end,
      })
      return opts
    end,
  },

  -- lualine
  {
    "nvim-lualine/lualine.nvim",
    opts = function(_, opts)
      ---@type table<string, {updated:number, total:number, enabled: boolean, status:string[]}>
      local mutagen = {}

      local function mutagen_status()
        local cwd = vim.uv.cwd() or "."
        mutagen[cwd] = mutagen[cwd]
          or {
            updated = 0,
            total = 0,
            enabled = vim.fs.find("mutagen.yml", { path = cwd, upward = true })[1] ~= nil,
            status = {},
            pending = false,
            warned = false,
          }
        local s = mutagen[cwd]
        local now = vim.uv.now() -- timestamp in milliseconds
        local refresh = s.updated + 10000 < now
        if #s.status > 0 then
          refresh = s.updated + 1000 < now
        end
        if s.enabled and refresh and not s.pending then
          s.pending = true
          vim.system({ "mutagen", "project", "list" }, { text = true }, function(proc)
            local sessions = {}
            local status = {}
            local name = nil
            if proc.code == 0 and proc.stdout then
              for _, line in ipairs(vim.split(proc.stdout, "\n", { trimempty = true })) do
                local n = line:match("^Name: (.*)")
                if n then
                  name = n
                end
                local st = line:match("^Status: (.*)")
                if st then
                  table.insert(sessions, {
                    name = name,
                    status = st,
                    idle = st == "Watching for changes",
                  })
                end
              end
              for _, session in ipairs(sessions) do
                if not session.idle then
                  table.insert(status, session.name .. ": " .. session.status)
                end
              end
            end
            s.updated = now
            s.total = #sessions
            s.status = status
            s.pending = false
            if s.total == 0 and not s.warned then
              -- Notify once per session to avoid spamming
              pcall(vim.notify, "Mutagen is not running", vim.log.levels.ERROR, { title = "Mutagen" })
              s.warned = true
            end
            -- Trigger a redraw of the statusline to reflect updated info
            vim.schedule(function()
              pcall(vim.cmd, "redrawstatus")
            end)
          end)
        end
        return s
      end

      local error_color = { fg = Snacks.util.color("DiagnosticError") }
      local ok_color = { fg = Snacks.util.color("DiagnosticInfo") }
      table.insert(opts.sections.lualine_x, {
        cond = function()
          return mutagen_status().enabled
        end,
        color = function()
          return (mutagen_status().total == 0 or mutagen_status().status[1]) and error_color or ok_color
        end,
        function()
          local s = mutagen_status()
          local msg = s.total
          if #s.status > 0 then
            msg = msg .. " | " .. table.concat(s.status, " | ")
          end
          return (s.total == 0 and "󰋘 " or "󰋙 ") .. msg
        end,
      })
    end,
  },

  -- "folke/twilight.nvim",

  -- {
  --   "folke/zen-mode.nvim",
  --   cmd = "ZenMode",
  --   opts = {
  --     window = { backdrop = 0.7 },
  --     plugins = {
  --       gitsigns = true,
  --       tmux = true,
  --       kitty = { enabled = false, font = "+2" },
  --     },
  --   },
  --   keys = { { "<leader>z", "<cmd>ZenMode<cr>", desc = "Zen Mode" } },
  -- },
}
