return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    return {
      options = {
        icons_enabled = true,
        --theme = 'auto',
        theme = "onedark",
        component_separators = { left = "", right = "" },
        section_separators = { left = "", right = "" },
        disabled_filetypes = {
          statusline = {},
          winbar = {},
        },
        ignore_focus = {},
        always_divide_middle = true,
        globalstatus = false,
        refresh = {
          statusline = 1000,
          tabline = 1000,
          winbar = 1000,
        },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch", "diagnostics" },
        lualine_c = { { "filename", path = 1 } },
        -- lualine_x = { 'encoding', 'fileformat', 'filetype' },
        lualine_x = { "fileformat", "filetype" },
        lualine_y = {
          "location",
          {
            "searchcount",
            maxcount = 999,
            timeout = 500,
          },
          -- {
          --   "lsp_status",
          --   icon = "", -- f013
          --   symbols = {
          --     -- Standard unicode symbols to cycle through for LSP progress:
          --     spinner = { "⠋", "⠙", "⠹", "⠸", "⠼", "⠴", "⠦", "⠧", "⠇", "⠏" },
          --     -- Standard unicode symbol for when LSP is done:
          --     done = "✓",
          --     -- Delimiter inserted between LSP names:
          --     separator = "│",
          --   },
          --   -- List of LSP names to ignore (e.g., `null-ls`):
          --   ignore_lsp = { "GitHub Copilot" },
          --   -- Display the LSP name
          --   show_name = true,
          -- },
        },
        lualine_z = {},
      },
      inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = { { "filename", path = 1 } },
        lualine_x = {
          "location",
          {
            "searchcount",
            maxcount = 999,
            timeout = 500,
          },
        },
        lualine_y = {},
        lualine_z = {},
      },
      tabline = {},
      winbar = {},
      inactive_winbar = {},
      extensions = {},
    }
  end,
}
-- TODO: a/n selections(show how many)
