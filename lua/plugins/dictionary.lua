---@module 'lazy'
---@type LazySpec
return {
  "chrscchrn/dictionary.nvim",
  config = function()
    require("dictionary").setup()
  end,
  keys = {
    {
      "<leader>gd",
      function()
        local d = require "dictionary"
        d.lookup_word()
      end,
      "Define the word under the cursor",
    },
  },
}
