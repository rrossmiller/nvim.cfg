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
      kitty = {
        enabled = true,
      },
      -- todo = { enabled = true },
    },
  },
}
