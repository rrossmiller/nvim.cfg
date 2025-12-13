-- [[ Highlight on yank ]]
-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup("YankHighlight", { clear = true })
vim.api.nvim_create_autocmd("TextYankPost", {
  pattern = "*",
  group = highlight_group,
  callback = function()
    vim.highlight.on_yank()
  end,
})

--  trying custom version of sitiom/nvim-numbertoggle
local augroup = vim.api.nvim_create_augroup("numbertoggle", {})

vim.api.nvim_create_autocmd({ "BufEnter", "FocusGained", "InsertLeave", "CmdlineLeave", "WinEnter" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.o.number and vim.api.nvim_get_mode().mode ~= "i" then
      vim.opt.relativenumber = true
    end
  end,
})

vim.api.nvim_create_autocmd({ "InsertEnter" }, {
  pattern = "*",
  group = augroup,
  callback = function()
    if vim.o.number then
      vim.opt.relativenumber = false
      -- vim.cmd "redraw"
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

-- help window in a right split
-- Create an autocmd group to manage the autocmd
vim.api.nvim_create_augroup("HelpWindowGroup", { clear = true })

-- Autocmd to trigger the function when a new buffer is opened
vim.api.nvim_create_autocmd("BufWinEnter", {
  group = "HelpWindowGroup",
  pattern = "*",
  callback = function()
    if vim.bo.buftype == "help" then
      vim.cmd "wincmd L"
    end
  end,
})

-- move copilot window to the right
vim.api.nvim_create_augroup("CopilotWindowGroup", { clear = true })
vim.api.nvim_create_autocmd("User", {
  group = "CopilotWindowGroup",
  pattern = "CopilotChatOpen",
  callback = function()
    vim.cmd "wincmd L"
  end,
})


-- toggle side padding
vim.api.nvim_create_augroup("MyZenMode", { clear = true })
vim.api.nvim_create_autocmd({ "BufWinEnter" }, {
  group = "MyZenMode",
  pattern = "*",
  callback = function()
    local side_padding = vim.g.my_zen_mode
    -- toggle fold col
    if side_padding then
      vim.o.foldcolumn = "9"
      vim.o.signcolumn = "yes:5"
    else
      vim.o.foldcolumn = "0"
      vim.o.signcolumn = "yes"
    end
  end,
})

-- markdown
vim.api.nvim_create_augroup("MarkdownSettings", { clear = true })
vim.api.nvim_create_autocmd({ "BufEnter" }, {
  group = "MarkdownSettings",
  pattern = "*.md",
  callback = function()
    vim.o.textwidth = 110
  end,
})
