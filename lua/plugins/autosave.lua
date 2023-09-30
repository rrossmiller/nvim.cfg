return {
    "Pocco81/auto-save.nvim",
    config = function()
        require("auto-save").setup {
            --[[ condition = function(buf) ]]
            --[[     local pth = vim.api.nvim_buf_get_name(0) ]]
            --[[     if string.find(pth, "/.config/nvim") then ]]
            --[[         return true ]]
            --[[     end ]]
            --[[     return true ]]
            --[[ end, ]]
        }
    end,
}
