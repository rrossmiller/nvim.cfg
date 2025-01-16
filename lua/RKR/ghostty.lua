local user = os.getenv "USER"

if user == "robrossmiller" then
  local home = os.getenv "HOME"
  local client = vim.lsp.start_client {
    name = "ghostty-lsp",
    cmd = { home .. "/Projects/ghostty-lsp/zig-out/bin/ghostty-lsp" },
  }
  vim.filetype.add {
    pattern = {
      [home .. "/.config/ghostty/.*"] = "ghosttyconf",
    },
  }
  -- format lsp logs
  vim.keymap.set("n", "<leader>rr", [[:%s/\\n/\r\t/g<CR>]])
  if not client then
    vim.notify "The ghostty lsp client is not set up correctly"
  else
    vim.api.nvim_create_autocmd("FileType", {
      pattern = { "ghosttyconf" },
      callback = function()
        vim.lsp.buf_attach_client(0, client)
      end,
    })
  end
end
