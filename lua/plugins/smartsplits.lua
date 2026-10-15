return {
  "mrjones2014/smart-splits.nvim",
  config = function()
    require("smart-splits").setup {
      -- Ignored filetypes (only while resizing)
      ignored_filetypes = {
        "nofile",
        "quickfix",
        "prompt",
        "neo-tree",
      },
      -- Ignored buffer types (only while resizing)
      ignored_buftypes = { "NvimTree" },
      -- the default number of lines/columns to resize by at a time
      resize = {
        amount = 3,
        -- ignore these autocmd events (via :h eventignore) while processing
        -- smart-splits.nvim computations, which involve visiting different
        -- buffers and windows. These events will be ignored during processing,
        -- and un-ignored on completed. This only applies to resize events,
        -- not cursor movement events.
        ignored_events = {
          "BufEnter",
          "WinEnter",
        },
      },
      move = { at_edge = "wrap", same_row = false },
      -- whether the cursor should follow the buffer when swapping
      -- buffers by default; it can also be controlled by passing
      -- `{ move_cursor = true }` or `{ move_cursor = false }`
      -- when calling the Lua function.
      swap = { move_cursor = false },

      -- resize mode options
      -- resize_mode = {
      --   -- key to exit persistent resize mode
      --   quit_key = "<ESC>",
      --   -- keys to use for moving in resize mode
      --   -- in order of left, down, up' right
      --   resize_keys = { "h", "j", "k", "l" },
      --   -- set to true to silence the notifications
      --   -- when entering/exiting persistent resize mode
      --   silent = false,
      --   -- must be functions, they will be executed when
      --   -- entering or exiting the resize mode
      --   hooks = {
      --     on_enter = nil,
      --     on_leave = nil,
      --   },
      -- },
      -- enable or disable a multiplexer integration;
      -- automatically determined, unless explicitly disabled or set,
      -- by checking the $TERM_PROGRAM environment variable,
      -- and the $KITTY_LISTEN_ON environment variable for Kitty
      multiplexer_integration = nil,
    }

    -- recommended mappings
    -- resizing splits
    -- these keymaps will also accept a range,
    -- for example `10<C-h>` will `resize_left` by `(10 * config.default_amount)`
    vim.keymap.set("n", "<C-h>", require("smart-splits").resize_left)
    vim.keymap.set("n", "<C-j>", require("smart-splits").resize_down)
    vim.keymap.set("n", "<C-k>", require("smart-splits").resize_up)
    vim.keymap.set("n", "<C-l>", require("smart-splits").resize_right)
    -- moving between splits
    -- vim.keymap.set('n', '<C-h>', require('smart-splits').move_cursor_left)
    -- vim.keymap.set('n', '<C-j>', require('smart-splits').move_cursor_down)
    -- vim.keymap.set('n', '<C-l>', require('smart-splits').move_cursor_right)
    -- vim.keymap.set('n', '<C-k>', require('smart-splits').move_cursor_up)
    -- swapping buffers between windows
    vim.keymap.set("n", "<leader>bh", require("smart-splits").swap_buf_left)
    vim.keymap.set("n", "<leader>bj", require("smart-splits").swap_buf_down)
    vim.keymap.set("n", "<leader>bk", require("smart-splits").swap_buf_up)
    vim.keymap.set("n", "<leader>bl", require("smart-splits").swap_buf_right)
  end,
}
