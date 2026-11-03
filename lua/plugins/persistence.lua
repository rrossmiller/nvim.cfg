local function close_some_bufs()
  local b = vim.api.nvim_list_bufs()
  for _, val in ipairs(b) do
    -- if the buffer is valid
    if vim.api.nvim_buf_is_valid(val) then
      -- and if the buffer does not end in a file extension
      local buf_path = vim.api.nvim_buf_get_name(val)
      local has_ext = string.find(buf_path, "%.[%w_]+$")

      -- and the buffer is not a terminal
      local is_term = string.find(buf_path, "term:", 1, true) -- starts with term:
      if not has_ext and not is_term then
        -- close the buffer
        vim.api.nvim_buf_delete(val, {})
      end
    end
  end
end

return {
  "folke/persistence.nvim",
  event = "BufReadPre", -- this will only start session saving when an actual file was opened
  opts = {
    options = {
      "buffers",
      --[[ "curdir", ]]
      --[[ "tabpages", ]]
      "winsize",
    }, -- sessionoptions used for saving
  },
  keys = {
    -- restore the session for the current directory
    {
      "<leader>ls",
      function()
        local snacks = require "snacks"
        local explorer = snacks.picker.get({ source = "explorer" })[1]
        if explorer then
          explorer:close()
        end
        require("persistence").load()
        close_some_bufs()
        if not snacks.picker.get({ source = "explorer" })[1] then
          snacks.explorer.open()
        end
      end,
    },
    -- stop Persistence => session won't be saved on exit
    {
      "<leader>ld",
      function()
        vim.cmd "lua require('persistence').stop()"
      end,
    },
  },
}
