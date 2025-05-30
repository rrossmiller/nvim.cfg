require "RKR.remap"
require "RKR.opts"

--  trying custom version of sitiom/nvim-numbertoggle
local augroup = vim.api.nvim_create_augroup("numbertoggle", {})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.o.nu and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.o.nu then
      vim.opt.relativenumber = false
      vim.cmd "redraw"
    end
  end,
})

-- relative number toggle
vim.api.nvim_create_autocmd("BufEnter", {
  group = augroup,
  callback = function()
    vim.opt.formatoptions:remove { "c", "r", "o" }
  end,
  -- group = general,
  desc = "Disable New Line Comment",
})

vim.api.nvim_create_autocmd("RecordingEnter", {
  callback = function()
    vim.opt.cmdheight = 1
  end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  callback = function()
    vim.opt.cmdheight = 0
  end,
})
