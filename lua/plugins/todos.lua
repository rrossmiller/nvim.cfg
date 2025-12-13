return {
  "rrossmiller/todos.nvim",
  -- dir = "/Users/robrossmiller/Projects/todos.nvim",
  config = function()
    require("todos").setup()
  end,
}
-- return {
--   -- "rrossmiller/tasklist.nvim",
--   -- branch='send-update-event',
--   dir = "/Users/robrossmiller/Projects/tasklist.nvim",
--   -- config = function(opts)
--   -- local todo = require("tasklist")
--   -- vim.keymap.set("n", "<leader>tt", function() todo.toggle_window() end, { desc = 'Open global TODOs window' })
--   -- vim.keymap.set("n", "<leader>tp", function() todo.toggle_proj_window() end, { desc = 'Open project TODOs window' })
--   -- todo.setup()
--   -- end,
-- }
