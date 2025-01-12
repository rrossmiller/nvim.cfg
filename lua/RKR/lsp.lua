local home = os.getenv "HOME"
local client = vim.lsp.start_client {
  name = "ghostty-lsp",
  cmd = { home .. "/Projects/ghostty-lsp/zig-out/bin/ghostty-lsp" },
}

vim.keymap.set("n", "<leader>rr", [[:%s/\\n/\r\t/g<CR>]])
if not client then
  vim.notify "The client is not a thing oops"
else
  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "conf" },
    callback = function()
      vim.lsp.buf_attach_client(0, client)
    end,
  })
end
