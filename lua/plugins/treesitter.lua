local M = {{
    "nvim-treesitter/nvim-treesitter",
    build = function()
        require("nvim-treesitter.install").update({ with_sync = true })
    end,
  },
  {
      "nvim-treesitter/playground",
      dependencies = { 'nvim-treesitter/nvim-treesitter' }
  }
}

return { M }
