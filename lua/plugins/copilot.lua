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
  {
    "kkrampis/codex.nvim",
    lazy = true,
    cmd = { "Codex", "CodexToggle" }, -- Optional: Load only on command execution
    keys = {
      {
        "<leader>cx", -- Change this to your preferred keybinding
        function()
          require("codex").toggle()
        end,
        desc = "Toggle Codex popup or side-panel",
        mode = { "n", "t" },
      },
    },
    opts = {
      cmd = "/Users/rrossmil/.codex/packages/standalone/current/codex",
      keymaps = {
        toggle = nil,     -- Keybind to toggle Codex window (Disabled by default, watch out for conflicts)
        quit = "<C-q>",   -- Keybind to close the Codex window (default: Ctrl + q)
      },                  -- Disable internal default keymap (<leader>cc -> :CodexToggle)
      border = "rounded", -- Options: 'single', 'double', or 'rounded'
      width = 0.8,        -- Width of the floating window (0.0 to 1.0)
      height = 0.8,       -- Height of the floating window (0.0 to 1.0)
      model = nil,        -- Optional: pass a string to use a specific model (e.g., 'o3-mini')
      autoinstall = true, -- Automatically install the Codex CLI if not found
      panel = false,      -- Open Codex in a side-panel (vertical split) instead of floating window
      use_buffer = false, -- Capture Codex stdout into a normal buffer instead of a terminal buffer
    },
  },
}
