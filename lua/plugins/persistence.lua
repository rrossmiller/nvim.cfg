-- Function to close buffers whose filetype is a directory
local function close_directory_buffers()
  -- Get a list of all buffers
  local buffers = vim.api.nvim_list_bufs()
  for _, buf in ipairs(buffers) do
    -- Check if the buffer is valid and loaded
    if vim.api.nvim_buf_is_valid(buf) and vim.api.nvim_buf_is_loaded(buf) then
      local filetype = vim.b[buf].filetype

      -- If the filetype is "directory", delete the buffer
      if filetype == "directory" then
        vim.api.nvim_buf_delete(buf, { force = true })
      end
    end
  end
end

-- Call the function
close_directory_buffers()
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
        vim.cmd "Neotree close"
        vim.cmd "lua require('persistence').load()"
        -- TODO: close buffers whose type is directory
        -- close_directory_buffers()
        vim.cmd "Neotree show"
      end,
    },

    -- restore the last session
    {
      "<leader>ll",
      function()
        vim.cmd "Neotree close"
        vim.cmd "lua require('persistence').load({ last = true })"
        vim.cmd "Neotree show"
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
