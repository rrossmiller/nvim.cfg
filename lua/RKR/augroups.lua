-- show cmd line to visually show you're recording a macro
vim.api.nvim_create_augroup("ShowRecording", {
  clear = true,
})
vim.api.nvim_create_autocmd("RecordingEnter", {
  group = "ShowRecording",
  callback = function()
    vim.o.cmdheight = 1
  end,
})

vim.api.nvim_create_autocmd("RecordingLeave", {
  group = "ShowRecording",
  callback = function()
    vim.o.cmdheight = 0
  end,
})
