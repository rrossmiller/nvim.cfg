-- Enable mouse mode
vim.o.mouse = 'a'

-- line height
--vim.opt.lsp = 4
vim.o.cmdheight=0

-- Make line numbers default
-- vim.wo.number = true
vim.opt.nu = true
vim.opt.relativenumber = true

-- Sync clipboard between OS and Neovim.
--  Remove this option if you want your OS clipboard to remain independent.
--  See `:help 'clipboard'`
vim.o.clipboard = 'unnamedplus'

vim.opt.tabstop = 4
vim.opt.softtabstop = 4
vim.opt.shiftwidth = 4
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

-- Case-insensitive searching UNLESS \C or capital in search
vim.o.ignorecase = true
vim.o.smartcase = true

vim.opt.swapfile = false
vim.opt.backup = false

-- Save undo history
vim.o.undofile = true
vim.opt.undodir = os.getenv("HOME") .. "/.vim/undodir"

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.o.termguicolors = true

vim.opt.scrolloff = 4
vim.opt.signcolumn = "no" -- no or yes
vim.opt.isfname:append("@-@")

-- Decrease update time
vim.o.updatetime = 250
vim.o.timeoutlen = 300

vim.o.colorcolumn = "" -- shows bar where new line "should" be

-- Set completeopt to have a better completion experience
vim.o.completeopt = 'menuone,noselect'


-- Set highlight on search
vim.o.hlsearch = false

-- gsql filetype
-- vim.filetype.add({
--     extension = {
--         gsql = 'gsql'
--     }
-- })

-- Enable break indent
vim.o.breakindent = true
-- -- don't add comment on next line after comment
-- vim.cmd("autocmd BufEnter * set formatoptions-=cro")
-- vim.cmd("autocmd BufEnter * setlocal formatoptions-=cro")

-- spell check for txt, md files
-- vim.cmd("filetype plugin on") -- should be on by default


