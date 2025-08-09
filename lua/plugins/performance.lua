return {
  {
    "lewis6991/impatient.nvim",
    config = function()
      require("impatient")
    end,
  },
  {
    "dstein64/vim-startuptime",
    cmd = "StartupTime",
    config = function()
      vim.g.startuptime_tries = 10
    end,
  },
  {
    "nathom/filetype.nvim",
    lazy = false,
    priority = 1000,
    config = function()
      require("filetype").setup({
        overrides = {
          extensions = {
            h = "c",
            hpp = "cpp",
            ex = "elixir",
            exs = "elixir",
            heex = "heex",
            eex = "eelixir",
            leex = "eelixir",
            rs = "rust",
            go = "go",
            py = "python",
            js = "javascript",
            ts = "typescript",
            jsx = "javascriptreact",
            tsx = "typescriptreact",
            vue = "vue",
            svelte = "svelte",
            md = "markdown",
            mdx = "markdown",
            yaml = "yaml",
            yml = "yaml",
            toml = "toml",
            json = "json",
            jsonc = "jsonc",
            lua = "lua",
            vim = "vim",
            sh = "sh",
            bash = "bash",
            zsh = "zsh",
            fish = "fish",
          },
          literal = {
            [".gitignore"] = "gitignore",
            [".gitattributes"] = "gitattributes",
            [".env"] = "sh",
            [".env.local"] = "sh",
            [".env.development"] = "sh",
            [".env.production"] = "sh",
            ["Dockerfile"] = "dockerfile",
            ["docker-compose.yml"] = "yaml",
            ["docker-compose.yaml"] = "yaml",
            ["Makefile"] = "make",
            ["makefile"] = "make",
            ["Cargo.toml"] = "toml",
            ["Cargo.lock"] = "toml",
            ["package.json"] = "json",
            ["package-lock.json"] = "json",
            ["yarn.lock"] = "yaml",
            ["mix.exs"] = "elixir",
            ["mix.lock"] = "elixir",
          },
        },
      })
    end,
  },
}