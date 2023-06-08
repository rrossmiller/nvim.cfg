-- line height
--vim.opt.lsp = 4
vim.opt.cmdheight = 0

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- Case insensitive searching UNLESS /C or capital in search
--vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.signcolumn = "no" -- or yes
vim.opt.isfname:append("@-@")

vim.opt.updatetime = 50

vim.o.colorcolumn = ""

-- easy chmod +x
vim.keymap.set("n", "<leader>x", "<cmd>!chmod +x %<CR>", { silent = true })

-- gsql filetype
vim.filetype.add({
    extension = {
        gsql = 'gsql'
    }
})
