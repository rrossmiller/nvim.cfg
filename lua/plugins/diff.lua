---@module 'lazy'
---@type LazySpec
return {
  "sindrets/diffview.nvim",
  keys = {
    {
      "<leader>gd",
      ":DiffviewOpen<CR>",
      { desc = "Open git diff" },
    },
  },
}
