-- [[ Basic Keymaps ]]
--  See `:help vim.keymap.set()`
vim.g.mapleader = " "
vim.g.maplocalleader = " "

-- Set highlight on search, but clear on pressing <Esc> in normal mode
vim.opt.hlsearch = true
vim.keymap.set("n", "<Esc>", "<cmd>nohlsearch<CR>")

-- Diagnostic keymaps
vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, { desc = "Go to previous [D]iagnostic message" })
vim.keymap.set("n", "]d", vim.diagnostic.goto_next, { desc = "Go to next [D]iagnostic message" })
vim.keymap.set("n", "<leader>e", vim.diagnostic.open_float, { desc = "Show diagnostic [E]rror messages" })
vim.keymap.set("n", "<leader>ql", vim.diagnostic.setloclist, { desc = "Open diagnostic [Q]uickfix [L]ist" })

-- NOTE: This won't work in all terminal emulators/tmux/etc. Try your own mapping
-- or just use <C-\><C-n> to exit terminal mode
vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })
-- vim.keymap.set("t", "<leader>n", function()
--   vim.cmd "nu"
-- end)

-- toggle wrap
vim.keymap.set("n", "Ω", function()
  local wrap = vim.opt.wrap:get()
  if not wrap then
    vim.opt.wrap = true
  else
    vim.opt.wrap = false
  end
end)

-- bring line up
vim.keymap.set("n", "J", "mzJ`z")

-- jump up and down, but keep current line in the middle
vim.keymap.set("n", "<C-d>", "<C-d>zz")
vim.keymap.set("n", "<C-u>", "<C-u>zz")
-- vim.keymap.set("n", "n", "nzzzv")
-- vim.keymap.set("n", "N", "Nzzzv")

-- paste from clipboard
-- vim.keymap.set("x", "<leader>p", [["_dP]])
-- yank to system clipboard
-- vim.keymap.set({ "n", "v" }, "<leader>y", [["+y]])
-- vim.keymap.set("n", "<leader>Y", [["+Y]])

-- delete to nowhere?
vim.keymap.set({ "n", "v" }, "<leader>d", [["_d]])

-- vim.keymap.set("i", "<C-c>", "<Esc>")
vim.keymap.set("n", "Q", "<nop>")
--

vim.keymap.set("n", "<leader>f", vim.lsp.buf.format)
vim.keymap.set("n", "Ï", vim.lsp.buf.format)

-- vim.keymap.set("n", "<C-k>", "<cmd>cnext<CR>zz")
-- vim.keymap.set("n", "<C-j>", "<cmd>cprev<CR>zz")
-- vim.keymap.set("n", "<leader>k", "<cmd>lnext<CR>zz")
-- vim.keymap.set("n", "<leader>j", "<cmd>lprev<CR>zz")
-- search and replace all instances
vim.keymap.set("n", "<leader>r", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- remap ctrl w to option w
vim.keymap.set("n", "∑", "<C-w>")
vim.keymap.set("n", "∑h", "<C-w>s")
vim.keymap.set("n", "∑v", "<C-w>v")

-- move around split windows (macos-option-as-alt = false)
vim.keymap.set("n", "˙", "<C-w>h")
vim.keymap.set("n", "∆", "<C-w>j")
vim.keymap.set("n", "˚", "<C-w>k")
vim.keymap.set("n", "¬", "<C-w>l")

--vim.keymap.set("n", "<alt-h>", "<C-w>h")
--vim.keymap.set("n", "<alt-j>", "<C-w>j")
--vim.keymap.set("n", "<alt-k>", "<C-w>k")
--vim.keymap.set("n", "<alt-l>", "<C-w>l")
-- move around tabs
vim.keymap.set("n", "ª", function()
  vim.cmd "BufferLineMovePrev"
end)
vim.keymap.set("n", "º", function()
  vim.cmd "BufferLineMoveNext"
end)

-- toggle color colorcolumn
vim.keymap.set("n", "<leader>cC", function()
  if vim.o.colorcolumn == "" then
    vim.o.colorcolumn = tostring(vim.o.textwidth)
  else
    vim.o.colorcolumn = ""
  end
end, { desc = "toggle colorcolumn" })
-- toggle auto save
vim.api.nvim_set_keymap("n", "<leader>as", ":silent ASToggle<CR>", {})

-- restart lsp
vim.keymap.set("n", "<leader>lr", function()
  vim.cmd "LspRestart"
  print "done reloading"
end, { desc = "Restart LSP" })

vim.keymap.set("n", "<leader>po", function()
  vim.cmd "Oil --float"
end, { desc = "open Oil in a float" })

vim.keymap.set("n", "<leader>Q", function()
  vim.cmd "Neotree close"
  vim.cmd "wa"
  vim.cmd "qa"
end, { desc = "Exit Neovim" })

vim.keymap.set("n", "<leader>qqq", "<cmd>q!<CR>", { desc = "Force Exit Neovim" })

-- make a file executable
vim.keymap.set("n", "<leader>xf", "<cmd>silent !chmod +x %<CR>", { silent = true, desc = "make current file executable" })
-- vim.keymap.set("n", "<leader>xf", "<cmd>silent !chmod +x %<CR>", { silent = true })
-- toggle zen mode
vim.keymap.set("n", "<leader>z", "<cmd>ZenMode<CR>", { silent = true, desc = "Toggle ZenMode" })

-- set padding on the left
-- mimics zen mode without losing splits or tabs
vim.g.my_zen_mode = false
local function toggle_side_padding()
  vim.g.my_zen_mode = not vim.g.my_zen_mode
  -- toggle fold col
  if vim.g.my_zen_mode then
    vim.o.foldcolumn = "9"
    vim.o.signcolumn = "yes:5"
  else
    vim.o.foldcolumn = "0"
    vim.o.signcolumn = "yes"
  end
end
vim.keymap.set("n", "<leader>;", toggle_side_padding, {
  desc = "toggle side padding",
})

-- file tree stuff
local function toggle_neotree()
  if vim.g.my_zen_mode then
    toggle_side_padding()
  end
  vim.cmd "Neotree toggle"
  vim.cmd "horizontal wincmd ="
end
vim.keymap.set("n", "<leader>pt", function()
  toggle_neotree()
end, { desc = "open Neotree" })

vim.keymap.set("n", "<leader>pT", function()
  toggle_neotree()
end, { desc = "toggle Neotree" })

vim.keymap.set("n", "„", function()
  vim.cmd "wa"
  vim.cmd "silent %bd!"
  toggle_neotree()
end, { desc = "Close all buffers" })

-- run the default just recipe
vim.keymap.set("n", "<leader>jj", function()
  vim.fn.jobstart("just", {
    on_exit = function()
      require("snacks").notifier.notify("just finished", "info", {
        timeout = 1500,
      })
    end,
  })
end, { desc = "Run just" })

vim.keymap.set("n", "<leader>jb", function()
  -- print(vim.fn.getcwd())

  -- get the options from just
  local output = vim.fn.system "just --summary"

  -- don't show display if there are no choices
  if output == "error: No justfile found" then
    print "error: No justfile found"
    return
  end

  local choices = vim.fn.split(output)
  for i, line in ipairs(choices) do
    choices[i] = vim.fn.trim(line)
  end

  -- display and run after selection
  vim.ui.select(choices, {
    prompt = "Select just recipe",
  }, function(choice)
    if choice then
      vim.fn.jobstart("just " .. choice, {
        on_exit = function()
          require("snacks").notifier.notify("just " .. choice .. " done", "info", {
            timeout = 1500,
          })
        end,
        stdout_buffered = true,
        stderr_buffered = true,
        on_stdout = function(_, dat)
          -- table.insert(dat, "stdout")
          -- vim.fn.writefile(dat, "std.out")
          print(dat)
        end,
        on_stderr = function(_, dat)
          -- table.insert(dat, "stderr")
          -- vim.fn.writefile(dat, "std.out")
          print(dat)
        end,
      })
    end
  end)
end, { desc = "Select just recipe" })

vim.keymap.set("n", "<leader>o", function()
  print "TODO: get current buffer path"
  -- vim.ui.open("%")
end, { desc = "open file" })

-- wrap line (Vgq)
vim.keymap.set("n", "<leader>gq", "Vgq", { desc = "Wrap line" })

-- toggle spell
vim.keymap.set("n", "<leader>ts", function()
  vim.o.spell = not vim.o.spell
end, { desc = "toggle spell" })

-- debugger
local dap = require "dap"
local dapui = require "dapui"

vim.keymap.set("n", "<leader>dc", dap.continue, { desc = "Debug: Start/Continue" })
vim.keymap.set("n", "<F1>", dap.step_into, { desc = "Debug: Step Into" })
vim.keymap.set("n", "Í", dap.step_over, { desc = "Debug: Step Over" })
vim.keymap.set("n", "<F7>", dap.step_out, { desc = "Debug: Step Out" })
vim.keymap.set("n", "<leader>b", dap.toggle_breakpoint, { desc = "Debug: Toggle Breakpoint" })
vim.keymap.set("n", "<leader>B", function()
  dap.set_breakpoint(vim.fn.input "Breakpoint condition: ")
end, { desc = "Debug: Set Breakpoint" })
-- Toggle to see last session result. Without this, you can't see session output in case of unhandled exception.
vim.keymap.set("n", "<leader>do", dapui.toggle, { desc = "Debug: See last session result." })

-- cycle tabs
vim.keymap.set("n", "<leader>P", ":tabprevious<CR>", { desc = "Tab Next" })
vim.keymap.set("n", "<leader>n", ":tabnext<CR>", { desc = "Tab Next" })


return { side_padding = side_padding }
