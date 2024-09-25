-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>q", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix list" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- vim.keymap.set("t", "<leader>n", function()
--   vim.cmd "nu"
-- end)

-- toggle wrap
vim.keymap.set("n", "Ω", function()
  local wrap = vim.opt.wrap:get()
  if not wrap then
    vim.opt.wrap = true
  else
    vim.opt.wrap = false
  end
end)

-- bring line up
vim.keymap.set("n", "J", "mzJ`z")
-- vim.keymap.set("n", "<C-d>", "<C-d>zz")
-- vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- paste from clipboard
-- vim.keymap.set("x", "<leader>p", [["_dP]])
-- yank to system clipboard
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to nowhere?
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
--

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "Ï", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

-- search and replace all instances
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- remap ctrl w to option w
vim.keymap.set("n", "∑", "<C-w>")
vim.keymap.set("n", "∑h", "<C-w>s")
vim.keymap.set("n", "∑v", "<C-w>v")

-- move around split windows
vim.keymap.set("n", "˙", "<C-w>h")
vim.keymap.set("n", "∆", "<C-w>j")
vim.keymap.set("n", "˚", "<C-w>k")
vim.keymap.set("n", "¬", "<C-w>l")

-- move around tabs
vim.keymap.set("n", "ª", function()
  vim.cmd "BufferLineMovePrev"
end)
vim.keymap.set("n", "º", function()
  vim.cmd "BufferLineMoveNext"
end)

-- toggle auto save
vim.api.nvim_set_keymap("n", "<leader>as", ":ASToggle<CR>", {})

-- restart lsp
vim.keymap.set("n", "<leader>lr", function()
  vim.cmd "LspRestart"
  print "done reloading"
end)

-- file tree stuff
vim.keymap.set("n", "<leader>pT", function()
  -- vim.cmd("NvimTreeToggle")
  vim.cmd "Neotree toggle"
end, { desc = "toggle Neotree" })

vim.keymap.set("n", "<leader>pt", function()
  -- vim.cmd("NvimTreeFocus")
  vim.cmd "Neotree focus"
end, { desc = "open Neotree" })

vim.keymap.set("n", "<leader>po", function()
  vim.cmd "Oil --float"
end, { desc = "open Oil in a float" })

vim.keymap.set("n", "<leader>QQ", function()
  vim.cmd "Neotree close"
  vim.cmd "wa"
  vim.cmd "qa"
end, { desc = "Exit Neovim" })

-- make a file executable
vim.keymap.set("n", "<leader>fx", "<cmd>silent !chmod +x %<CR>", { silent = true })

-- toggle zen mode
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { silent = true, desc = "Toggle ZenMode" })

