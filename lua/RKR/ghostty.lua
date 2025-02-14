local home = os.getenv "HOME"
local user = os.getenv "USER"
local bin_path = vim.fn.stdpath "state"
-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

-- if user == "robrossmiller" then
-- add filetype info
vim.filetype.add {
  pattern = {
    [home .. "/.config/ghostty/.*"] = "ghosttyconf",
  },
}

-- attach lsp
local client = vim.lsp.start_client {
  name = "ghostty-lsp",
  cmd = { bin_path .. "/ghostty-lsp/lsp" },
}

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

-- format lsp logs
vim.keymap.set("n", "<leader>rr", [[:%s/\\n/\r\t/g<CR>]])
-- end
