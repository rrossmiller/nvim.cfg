return {
    -- Useful status updates for LSP.
    -- NOTE `opts = {}` is the same as calling `require('fidget').setup({})`
    "j-hui/fidget.nvim",
    enabled = false,
    opts = {
        -- timer = {
        --   fidget_decay = 1000
        -- },
        sources = {
            jdtls = { ignore = true },
        }
    }
}
