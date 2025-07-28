require "RKR.remap"
require "RKR.opts"
require "RKR.augroups"

if vim.g.colors_name == "nightfox" then
  -- clear some highlight groupd
  local t = {
    -- "MatchParen",
    "CursorLineNr",
  }
  for _, v in pairs(t) do
    vim.api.nvim_set_hl(0, v, {})
  end
end
