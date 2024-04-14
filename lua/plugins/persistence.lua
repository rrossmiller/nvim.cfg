return {
  "folke/persistence.nvim",
  event = "BufReadPre",   -- this will only start session saving when an actual file was opened
  opts = {
    options = {
      "buffers",
      --[[ "curdir", ]]
      --[[ "tabpages", ]]
      "winsize"
    },     -- sessionoptions used for saving
  },
  keys = {
    -- restore the session for the current directory
    { "<leader>ls",
      function()
        vim.cmd("Neotree close")
        vim.cmd("lua require('persistence').load()")
        -- TODO: close buffers whose type is directory
        vim.cmd("Neotree show")
      end
    },

    -- restore the last session
    { "<leader>ll",
      function()
        vim.cmd("Neotree close")
        vim.cmd("lua require('persistence').load({ last = true })")
        vim.cmd("Neotree show")
      end
    },
    -- stop Persistence => session won't be saved on exit
    { "<leader>ld",
      function()
        vim.cmd("lua require('persistence').stop()")
      end
    }
  }
}
