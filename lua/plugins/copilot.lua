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
        if vim.g.copilot then
          vim.cmd "Copilot disable"
          print "copilot off"
        else
          vim.cmd "Copilot enable"
          print "copilot on"
        end
        vim.g.copilot = not vim.g.copilot
      end, { desc = "Toggle Copilot" })

      -- accept copilot suggestion keymap
      vim.keymap.set("i", "<C-l>", function()
        if vim.g.copilot then
          -- copilot.suggestion
          return vim.fn["copilot#Accept"]()
        else
          return "<C-l>"
        end
      end, { expr = true, desc = "Accept Copilot suggestion", replace_keycodes = false })
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
