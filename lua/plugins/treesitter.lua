local ensure_installed = {
  "go",
  "lua",
  "python",
  "rust",
  -- "tsx",
  "javascript",
  "typescript",
  "vimdoc",
  "vim",
}
return {
  {
    -- Highlight, edit, and navigate code
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    lazy = false,
    dependencies = {
      -- "nvim-treesitter/nvim-treesitter-context",
      -- "nvim-treesitter/nvim-treesitter-textobjects",
    },

    -- There are additional nvim-treesitter modules that you can use to interact
    -- with nvim-treesitter. You should go explore a few and see what interests you:
    --
    --    - Incremental selection: Included, see `:help nvim-treesitter-incremental-selection-mod`
    --    - Show your current context: https://github.com/nvim-treesitter/nvim-treesitter-context
    --    - Treesitter + textobjects: https://github.com/nvim-treesitter/nvim-treesitter-textobjects
    config = function()
      local ts = require "nvim-treesitter"
      ts.install(ensure_installed)
    end,
  },
  {
    "nvim-treesitter/playground",
    keys = {
      { "<leader>tP", "<cmd>TSPlaygroundToggle<cr>", desc = "TS toggle playground" },
    },
  },
  -- { "nvim-treesitter/nvim-treesitter-textobjects" },
}
