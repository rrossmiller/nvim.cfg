return { -- Autoformat
  "stevearc/conform.nvim",
  lazy = false,
  event = "LspAttach",
  keys = {
    {
      "<leader>f",
      function()
        require("conform").format { async = true, lsp_fallback = true }
      end,
      mode = "",
      desc = "[F]ormat buffer",
    },
    {
      "Ï", -- opt-shift-f
      function()
        require("conform").format { async = true, lsp_fallback = true }
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  opts = {
    notify_on_error = false,
    -- format_on_save = function(bufnr)
    --     -- Disable "format_on_save lsp_fallback" for languages that don't
    --     -- have a well standardized coding style. You can add additional
    --     -- languages here or re-enable it for the disabled ones.
    --     local disable_filetypes = { c = true, cpp = true }
    --     return {
    --         timeout_ms = 500,
    --         lsp_fallback = not disable_filetypes[vim.bo[bufnr].filetype],
    --     }
    -- end,
    formatters_by_ft = {
      lua = { "stylua" },
      -- Conform can also run multiple formatters sequentially
      python = { "isort", "ruff_format" },
      go = { "gofmt" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      java = { "google-java-format" },
      -- sub-list torun *until* a formatter is found.
      javascript = { "prettier" },
    },
    -- Customize formatters
    formatters = {
      shfmt = {
        prepend_args = { "-i", "2" },
      },
    },
  },
}
