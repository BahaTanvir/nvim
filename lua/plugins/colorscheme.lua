return {
  {
    "navarasu/onedark.nvim",
    lazy = true,
    opts = {
      -- style = "dark", -- choices: 'dark', 'darker', 'cool', 'deep', 'warm', 'warmer'
      -- transparent = false,
      -- lualine = { transparent = false },
    },
  },
  {
    "echasnovski/mini.base16",
    version = false,
    lazy = true,
    -- You can configure and apply a Base16 theme with:
    -- opts = function()
    --   require("mini.base16").setup({
    --     -- palette = require("mini.base16").mini_palette("ocean", true)
    --   })
    -- end,
  },
  {
    "ellisonleao/gruvbox.nvim",
    lazy = true,
    opts = {
      -- contrast = "soft",
      -- transparent_mode = false,
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      -- flavour = "mocha", -- latte, frappe, macchiato, mocha
    },
  },
  {
    "EdenEast/nightfox.nvim",
    lazy = true,
    opts = {
      -- options = { transparent = false },
    },
  },
  {
    "Mofiqul/dracula.nvim",
    lazy = true,
    opts = {
      -- transparent_bg = false,
      -- italic_comment = true,
    },
  },
}
