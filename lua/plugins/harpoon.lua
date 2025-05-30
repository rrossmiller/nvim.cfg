return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },

  config = function()
    local harpoon = require "harpoon"

    -- REQUIRED
    harpoon:setup()
    -- REQUIRED

    vim.keymap.set("n", "<leader>ah", function()
      harpoon:list():add()
    end, { desc = "Add to harpoon" })

    vim.keymap.set("n", "<leader>hh", function()
      harpoon.ui:toggle_quick_menu(harpoon:list())
    end, { desc = "Open Harpoon" })

    -- get nth file in list
    vim.keymap.set("n", "å", function()
      harpoon:list():select(1)
    end, { desc = "Select Harpoon idx 1" })
    vim.keymap.set("n", "ß", function()
      harpoon:list():select(2)
    end, { desc = "Select Harpoon idx 2" })
    vim.keymap.set("n", "∂", function()
      harpoon:list():select(3)
    end, { desc = "Select Harpoon idx 3" })
    vim.keymap.set("n", "ƒ", function()
      harpoon:list():select(4)
    end, { desc = "Select Harpoon idx 4" })

    vim.keymap.set("n", "©", function()
      harpoon:list():select(5)
    end, { desc = "Select Harpoon idx 5" })
    vim.keymap.set("n", "Å", function()
      harpoon:list():select(6)
    end, { desc = "Select Harpoon idx 6" })

    -- Toggle previous & next buffers stored within Harpoon list
    -- opt-n: ˜
    vim.keymap.set("n", "˜", function()
      harpoon:list():prev()
    end)
    -- opt-b: ∫
    vim.keymap.set("n", "∫", function()
      harpoon:list():next()
    end)

    -- basic telescope configuration
    local conf = require("telescope.config").values
    local function toggle_telescope(harpoon_files)
      local file_paths = {}
      for _, item in ipairs(harpoon_files.items) do
        table.insert(file_paths, item.value)
      end

      require("telescope.pickers")
        .new({}, {
          prompt_title = "Harpoon",
          finder = require("telescope.finders").new_table {
            results = file_paths,
          },
          previewer = conf.file_previewer {},
          sorter = conf.generic_sorter {},
        })
        :find()
    end

    vim.keymap.set("n", "<leader>ht", function()
      toggle_telescope(harpoon:list())
    end, { desc = "Open harpoon window" })
  end,
}
