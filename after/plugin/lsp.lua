local lsp = require('lsp-zero')
local lspconfig = require('lspconfig')
lsp.preset("recommended")

lsp.ensure_installed({
    'lua_ls',
    'tsserver',
    'tailwindcss',
    'rust_analyzer',
    'gopls',
    'jdtls',
    'bashls'
})

-- Fix Undefined global 'vim'
lsp.nvim_workspace()

lsp.on_attach(function(client, bufnr)
    lsp.default_keymaps({ buffer = bufnr })
    local opts = { buffer = bufnr, remap = false }
    vim.keymap.set("n", "gd", function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "K", function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws", function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vd", function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d", function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d", function() vim.diagnostic.goto_prev() end, opts)
    vim.keymap.set("n", "<leader>vca", function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr", function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn", function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>", function() vim.lsp.buf.signature_help() end, opts)
end)

lspconfig.pylsp.setup {
    settings = {
        -- → pylsp.plugins.autopep8.enabled                            default: true
        pylsp = {
            plugins = {
                autopep8 = {
                    enabled = false
                },
                pycodestyle = {
                    enabled = false,
                    -- ignore = { 'ES501', 'W391' },
                    -- maxLineLength = 100
                }
            }
        }
    }
}
lsp.setup()

vim.keymap.set("n", "<leader>M", function() vim.cmd("Mason") end);


vim.lsp.handlers["textDocument/publishDiagnostics"] = vim.lsp.with(
    vim.lsp.diagnostic.on_publish_diagnostics, {
        underline = true,
        virtual_text = true,
        update_in_insert = true
    }
)
