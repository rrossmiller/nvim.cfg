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
        -- Init toggle term immediately so the first time it's opened, there's no waiting for the shell
        vim.api.nvim_create_autocmd({ "VimEnter" }, {
            callback = function()
                -- TODO: Change dir to currencly opened directory
                -- OR, change VimEnter to whenever Vim is done loading

                vim.env.tt = true
                vim.cmd("ToggleTerm")
                vim.cmd("ToggleTerm")
            end,
        })
    end
}
