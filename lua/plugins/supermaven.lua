return {
  "supermaven-inc/supermaven-nvim",
  event = "InsertEnter",
  cmd = {
    "SupermavenUseFree",
    "SupermavenUsePro",
  },
  opts = {
    keymaps = {
      accept_suggestion = nil, -- handled by nvim-cmp / blink.cmp
    },
    disable_inline_completion = vim.g.ai_cmp,
    ignore_filetypes = { "bigfile", "snacks_input", "snacks_notif" },
  },
  config = function(_, opts)
    require("supermaven-nvim").setup(opts)
    -- Ensure Supermaven starts disabled by default
    vim.defer_fn(function()
      local ok, supermaven = pcall(require, "supermaven-nvim.api")
      if ok and supermaven.is_running() then
        supermaven.stop()
      end
    end, 100)
  end,
}

