-- local home = os.getenv "HOME"
-- local user = os.getenv "USER"
-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()

-- if user == "robrossmiller" then
-- add filetype info
-- vim.filetype.add {
-- pattern = {
-- [home .. "/.config/ghostty/.*"] = "",
-- },
-- }

-- attach lsp

-- vim.api.nvim_create_autocmd("FileType", {
--   pattern = { "text", "marksdown" },
--   callback = function()
--     local client = vim.lsp.start {
--       name = "ghostty-lsp",
--       cmd = { bin_path .. "/spellcheck-lsp/lsp" },
--     }
--     if not client then
--       vim.notify "The spellcheck lsp client is not set up correctly"
--     else
--       vim.lsp.buf_attach_client(0, client)
--     end
--   end,
-- })
--
-- format lsp logs
-- vim.keymap.set("n", "<leader>rr", [[:%s/\\n/\r\t/g<CR><cmd>nohlsearch<CR>]])
-- end

local bin_path = vim.fn.stdpath "state"
return {
  cmd = { bin_path .. "/spellcheck-lsp/lsp" },
  filetypes = { "text", "markdown" },
  settings = {},
}
