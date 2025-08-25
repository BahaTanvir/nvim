return {
  { "fei6409/log-highlight.nvim", event = "BufRead *.log", opts = {} },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = function(_, opts)
      -- Prefer git for parser installations to avoid tarball extraction issues
      pcall(function()
        require("nvim-treesitter.install").prefer_git = true
      end)
      -- add caddyfile support
      require("nvim-treesitter.parsers").get_parser_configs().caddy = {
        install_info = {
          revision = "HEAD",
          url = "https://github.com/Samonitari/tree-sitter-caddy",
          files = { "src/parser.c", "src/scanner.c" },
         branch = "main",
        },
        filetype = "caddy",
      }
      vim.filetype.add({
        pattern = {
          ["Caddyfile"] = "caddy",
        },
      })

      vim.list_extend(opts.ensure_installed, {
        "caddy",
        "cmake",
        -- "comment", -- comments are slowing down TS bigtime, so disable for now
        "css",
        "devicetree",
        "gitcommit",
        "gitignore",
        "glsl",
        "go",
        "graphql",
        "http",
        "just",
        "kconfig",
        "meson",
        "ninja",
        "nix",
        -- "org", -- Parser not available
        "php",
        "scss",
        "sql",
        "svelte",
        "vue",
        "wgsl",
        -- Added for user's stacks
        "elixir",
        "heex",
        "eex",
        "rust",
        "python",
        "javascript",
        "typescript",
        "tsx",
        "html",
      })
    end,
  },
}
