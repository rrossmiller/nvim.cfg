return {
  "folke/snacks.nvim",
  priority = 1000,
  lazy = false,
  ---@type snacks.Config
  opts = {
    -- your configuration comes here
    -- or leave it empty to use the default settings
    -- refer to the configuration section below
    scratch = {
      enabled = true,
      ft = function()
        -- if vim.bo.buftype == "" and vim.bo.filetype ~= "" then
        --   return vim.bo.filetype
        -- end
        return "markdown"
      end,
    },
    bigfile = { enabled = true },
    -- notifier = { enabled = true },
    quickfile = { enabled = true },
    statuscolumn = { enabled = true },
    words = { enabled = true },
    lazygit = { enabled = true },
  },
  keys = {
    {
      "<leader>.",
      function()
        Snacks.scratch()
      end,
      desc = "Toggle Scratch Buffer",
    },
    {
      "<leader>S",
      function()
        Snacks.scratch.select()
      end,
      desc = "Select Scratch Buffer",
    },
  },
}
