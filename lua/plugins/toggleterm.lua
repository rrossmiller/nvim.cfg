return {
    'akinsho/toggleterm.nvim',
    version = "*",
    opts = {
        open_mapping = [[Ô]],
        direction = 'float',  -- 'vertical' | 'horizontal' | 'tab' | 'float',
        float_opts = {
            border = 'single' -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
        }
    },

    config = function()
        require("toggleterm").setup({
            open_mapping = [[Ô]],
            direction = 'float',  -- 'vertical' | 'horizontal' | 'tab' | 'float',
            float_opts = {
                border = 'single' -- 'single' | 'double' | 'shadow' | 'curved' | ... other options supported by win open
            }
        }
        )
        vim.api.nvim_create_autocmd({ "VimEnter" }, {
            callback = function()
                vim.cmd("ToggleTerm")
                vim.cmd("ToggleTerm")
            end,
        })
    end
}
