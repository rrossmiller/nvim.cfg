-- suspend
vim.keymap.set("n", "<leader>q", function() vim.cmd("sus") end)
-- tmp install stuff
vim.keymap.set("n", "<C-i>", function() vim.cmd("Lazy install") end)
-- much of this is directly from  github.com/ThePrimeagen/init.lua
vim.g.mapleader = " "
vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)
-- for spamming save (all files)j
vim.keymap.set("n", "<leader>s", function() vim.cmd("wall") end)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
vim.keymap.set("n", "<leader>Y", [["+Y]])

vim.keymap.set("n", "<D-v>", [["+P]])
vim.keymap.set("i", "<D-v>", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- This is going to get me cancelled
vim.keymap.set("i", "<C-c>", "<Esc>")
--vim.keymap.set("i","<D-z>","") -- TODO: map cmd-z in instert mode to undo
vim.keymap.set("n", "Q", "<nop>")
--
-- Deleteme?
--vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer<CR>")

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
--vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

--vim.keymap.set("n", "<leader>vpp", "<cmd>e ~/.dotfiles/nvim/.config/nvim/lua/theprimeagen/packer.lua<CR>");
vim.keymap.set("n", "<leader>mr", "<cmd>CellularAutomaton make_it_rain<CR>");

vim.keymap.set("n", "<leader><leader>", function()
    vim.cmd("so")
end)


-- remap ctrl w to option w
vim.keymap.set("n", "∑", "<C-w>")

-- move around split windows
vim.keymap.set("n", "˙", "<C-w>h")
vim.keymap.set("n", "∆", "<C-w>j")
vim.keymap.set("n", "˚", "<C-w>k")
vim.keymap.set("n", "¬", "<C-w>l")


-- toggle auto save
vim.api.nvim_set_keymap("n", "<leader>s", ":ASToggle<CR>", {})
