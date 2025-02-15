local home = os.getenv "HOME"
local user = os.getenv "USER"
local bin_path = "/Users/robrossmiller/.local/share/nvim/mason/bin/arduino-language-server"

if user == "robrossmiller" then
  -- add filetype info
  vim.filetype.add {
    pattern = {
      ["*.ino"] = "arduino",
    },
  }

  -- attach lsp

  vim.api.nvim_create_autocmd("FileType", {
    pattern = { "arduino" },
    callback = function()
      local client = vim.lsp.start_client {
        name = "arduino-lsp",
        cmd = { bin_path, "-cli-config", "/Users/robrossmiller/Library/Arduino15/arduino-cli.yaml" },
      }
      if not client then
        vim.notify "The arduino lsp client is not set up correctly"
      else
        vim.lsp.buf_attach_client(0, client)
      end
    end,
  })

  -- format lsp logs
  vim.keymap.set("n", "<leader>rr", [[:%s/\\n/\r\t/g<CR>]])
end
