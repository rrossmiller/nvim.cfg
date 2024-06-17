
return {
    -- Add indentation guides even on blank lines
    'lukas-reineke/indent-blankline.nvim',
    -- Enable `lukas-reineke/indent-blankline.nvim`
    -- See `:help indent_blankline.txt`
    main = "ibl",
    opts = {
        scope = { enabled = false },
        indent = { char = "▏"
        },
    },
    -- config = function()
    --     require("ibl").setup()
    -- end
}
