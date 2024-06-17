return {
  "akinsho/bufferline.nvim",
  dependencies = {
    { "echasnovski/mini.bufremove", version = "*" },
  },
  event = "VeryLazy",
  keys = {
    -- alt-shift-w
    { "„", "<Cmd>bd<CR>", desc = "close current tab" },
    {
      "Œ", -- shift-opt-q
      -- function()
      -- vim.cmd('bd')
      -- vim.cmd('BufferLineCloseOthers')
      "<Cmd>bd<CR><Cmd>BufferLineCloseOthers<CR>", -- end
      desc = "close all",
    },
    { "<leader>pp", "<Cmd>BufferLinePick<CR>", desc = "pick tab" },
    { "<leader>cc", "<Cmd>BufferLinePickClose<CR>", desc = "pick tab to close" },
    { "<leader>cr", "<Cmd>BufferLineCloseRight<CR>", desc = "close all tabs to the right" },
    { "<leader>C", "<Cmd>BufferLineCloseOthers<CR>", desc = "close others" },
    { "Ò", "<Cmd>BufferLineCycleNext<CR>", desc = "next tab" },
    { "Ó", "<Cmd>BufferLineCyclePrev<CR>", desc = "prev tab" },
    -- { "<leader>bp", "<Cmd>BufferLineTogglePin<CR>",            desc = "Toggle pin" },
    -- { "<leader>bP", "<Cmd>BufferLineGroupClose ungrouped<CR>", desc = "Delete non-pinned buffers" },
    --„Œ
  },

  opts = {
    options = {
      close_command = function(n)
        require("mini.bufremove").delete(n, false)
      end,
      right_mouse_command = function(n)
        require("mini.bufremove").delete(n, false)
      end,
      diagnostics = "nvim_lsp",

      --- count is an integer representing total count of errors
      --- level is a string "error" | "warning"
      --- diagnostics_dict is a dictionary from error level ("error", "warning" or "info")to number of errors for each level.
      --- this should return a string
      --- Don't get too fancy as this function will be executed a lot
      diagnostics_indicator = function(count, level, diagnostics_dict, context)
        local icon = level:match "error" and " " or " "
        return " " .. icon .. count
      end,

      -- always_show_bufferline = false,

      -- diagnostics_indicator = function(_, _, diag)
      -- local icons = require("lazyvim.config").icons.diagnostics
      -- local ret = (diag.error and icons.Error .. diag.error .. " " or "")
      -- .. (diag.warning and icons.Warn .. diag.warning or "")
      -- return vim.trim(ret)
      -- end,
      offsets = {
        {
          filetype = "neo-tree",
          text = "Neo-tree",
          highlight = "Directory",
          text_align = "left",
        },
      },
    },
  },
}
