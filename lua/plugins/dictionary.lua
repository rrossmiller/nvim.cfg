---@module 'lazy'
---@type LazySpec
return {
  "chrscchrn/dictionary.nvim",
  config = function()
    require("dictionary").setup()
  end,
  keys = {
    {
      "<leader>gD",
      function()
        local d = require "dictionary"
        d.lookup_word()
      end,
      { desc = "Define the word under the cursor" },
    },
  },
}
