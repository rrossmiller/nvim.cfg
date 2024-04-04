vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })
-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })


-- Diagnostic keymaps
vim.keymap.set('n', ']d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', '[d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })


--
-- much of this is directly from  github.com/ThePrimeagen/init.lua
-- Stop lazyvim from taking over tab
vim.keymap.set("n", "<Tab>", function() vim.cmd("") end)

-- suspend vim alt-q = œ
vim.keymap.set("n", "œ", function() vim.cmd("sus") end)

-- tmp install stuff
vim.keymap.set("n", "<C-i>", function() vim.cmd("Lazy install") end)

-- vim.keymap.set("n", "<leader>pv", vim.cmd.Ex)

-- toggle wrap 
vim.keymap.set("n", "Ω", function()
    local wrap = vim.opt.wrap:get()
    if not wrap then
        vim.opt.wrap = true
    else
        vim.opt.wrap = false
    end
end)


-- for spamming save (all files)
-- vim.keymap.set("n", "<leader>s", function() vim.cmd("wall") end)
vim.keymap.set("v", "J", ":m '>+1<CR>gv=gv")
vim.keymap.set("v", "K", ":m '<-2<CR>gv=gv")

vim.keymap.set("n", "J", "mzJ`z")
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
vim.keymap.set("n", "n", "nzzzv")
vim.keymap.set("n", "N", "Nzzzv")

-- greatest remap ever
--idk what this does
-- vim.keymap.set("x", "<leader>p", [["_dP]])

-- next greatest remap ever : asbjornHaland
-- yank to system clipboard
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- vim.keymap.set("n", "<D-v>", [["+P]])
-- vim.keymap.set("i", "<D-v>", [["+p]])
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

--
vim.keymap.set("i", "<C-c>", "<Esc>")
--vim.keymap.set("i","<D-z>","") -- TODO: map cmd-z in instert mode to undo
vim.keymap.set("n", "Q", "<nop>")
--

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)

vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")

vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])
-- vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- vim.keymap.set("n", "<leader><leader>", function()
--     print('~')
--     vim.cmd("so")
-- end)


-- remap ctrl w to option w
vim.keymap.set("n", "∑h", "<C-w>s")
vim.keymap.set("n", "∑v", "<C-w>v")

-- move around split windows
vim.keymap.set("n", "˙", "<C-w>h")
vim.keymap.set("n", "∆", "<C-w>j")
vim.keymap.set("n", "˚", "<C-w>k")
vim.keymap.set("n", "¬", "<C-w>l")


-- toggle auto save
vim.api.nvim_set_keymap("n", "<leader>as", ":ASToggle<CR>", {})

-- restart lsp
vim.keymap.set("n", "<leader>lr", function()
    vim.cmd("LspRestart")
    -- vim.cmd("LspStop")
    -- vim.cmd("LspStart")
    print("done reloading")
end)


-- file tree stuff
vim.keymap.set("n", "<leader>pT", function()
    -- vim.cmd("NvimTreeToggle")
    vim.cmd("Neotree toggle")
end)

vim.keymap.set("n", "<leader>pt", function()
    -- vim.cmd("NvimTreeFocus")
    vim.cmd("Neotree focus")
end, { desc = 'open Neotree' })

vim.keymap.set("n", "<leader>po", function()
    vim.cmd("Oil --float")
end, { desc = 'open Oil in a float' })

vim.keymap.set("n", "<leader>QQ", function()
    vim.cmd("Neotree close")
    vim.cmd("wa")
    vim.cmd("qa")
end, { desc = "Exit Neovim" }
)
