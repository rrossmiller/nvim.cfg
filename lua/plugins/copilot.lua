local chat_opts = {
  -- See Configuration section for options
  temperature = 0.1,       -- Lower = focused, higher = creative
  window = {
    layout = "vertical",   -- 'vertical', 'horizontal', 'float'
    width = 0.5,           -- 50% of screen width
  },
  auto_insert_mode = true, -- Enter insert mode when opening
}

return {
  {
    "https://github.com/github/copilot.vim",
    config = function()
      vim.cmd "Copilot disable"
      vim.g.copilot = false
      -- toggle copilot keymap
      vim.keymap.set("n", "<leader>ct", function()
        vim.g.copilot = not vim.g.copilot
        if vim.g.copilot then
          vim.cmd "Copilot disable"
        else
          vim.cmd "Copilot enable"
        end
      end, { desc = "Toggle Copilot" })
    end,
  },
  -- {
  --   "CopilotC-Nvim/CopilotChat.nvim",
  --   dependencies = {
  --     { "nvim-lua/plenary.nvim", branch = "master" },
  --   },
  --   build = "make tiktoken",
  --   opts = chat_opts,
  -- },
}
