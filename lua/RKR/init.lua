require "RKR.remap"
require "RKR.opts"
require "RKR.augroups"

local colorscheme = vim.g.colors_name
if colorscheme == "nightfox" or colorscheme == "tokyonight" then
  -- clear some highlight groupd
  local t = {
    -- "MatchParen",
    "CursorLineNr",
  }
  for _, v in pairs(t) do
    vim.api.nvim_set_hl(0, v, {})
  end
end

vim.lsp.enable("spellcheck")
-- vim.lsp.enable("roc")
-- vim.lsp.enable('ty')
