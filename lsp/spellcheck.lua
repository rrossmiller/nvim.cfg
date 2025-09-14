local bin_path = vim.fn.stdpath "state"
return {
  cmd = { bin_path .. "/spellcheck-lsp/lsp" },
  filetypes = { "text", "markdown", "typst" },
  settings = {},
}
