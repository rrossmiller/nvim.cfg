local user = os.getenv "USER"
local width = 175
if user == "robrossmiller" then
  width = 150
end

return {
  "folke/zen-mode.nvim",
  opts = {
    window = {
      width = width,
      cursorline = true,
    },
    plugins = {
      -- kitty = {
      --   enabled = true,
      -- },
      options = {
        -- showcmd = true, -- the command in the last line of the screen
        laststatus = 3,
      },
      gitsigns = { enabled = true }, -- disables git signs
      todo = { enabled = true },
    },
  },
}
