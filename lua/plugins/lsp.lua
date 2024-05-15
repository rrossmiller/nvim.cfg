local function cfg()
  -- [[ Configure LSP ]]
  --  This function gets run when an LSP connects to a particular buffer.
  local on_attach = function(_, bufnr)
    -- NOTE: Remember that lua is a real programming language, and as such it is possible
    -- to define small helper and utility functions so you don't have to repeat yourself
    -- many times.
    --
    -- In this case, we create a function that lets us more easily define mappings specific
    -- for LSP related items. It sets the mode, buffer and description for us each time.
    local nmap = function(keys, func, desc)
      if desc then
        desc = 'LSP: ' .. desc
      end

      vim.keymap.set('n', keys, func, { buffer = bufnr, desc = desc })
    end

    nmap('<leader>rn', vim.lsp.buf.rename, '[R]e[n]ame')
    nmap('<leader>ca', vim.lsp.buf.code_action, '[C]ode [A]ction')

    nmap('gd', vim.lsp.buf.definition, '[G]oto [D]efinition')
    nmap('gr', require('telescope.builtin').lsp_references, '[G]oto [R]eferences')
    nmap('gI', require('telescope.builtin').lsp_implementations, '[G]oto [I]mplementation')
    nmap('<leader>D', vim.lsp.buf.type_definition, 'Type [D]efinition')
    nmap('<leader>ds', require('telescope.builtin').lsp_document_symbols, '[D]ocument [S]ymbols')
    nmap('<leader>ws', require('telescope.builtin').lsp_dynamic_workspace_symbols, '[W]orkspace [S]ymbols')

    -- See `:help K` for why this keymap
    nmap('K', vim.lsp.buf.hover, 'Hover Documentation')
    -- nmap('<C-k>', vim.lsp.buf.signature_help, 'Signature Documentation')
    nmap('<leader>k', vim.lsp.buf.signature_help, 'Signature Documentation')

    -- Lesser used LSP functionality
    nmap('gD', vim.lsp.buf.declaration, '[G]oto [D]eclaration')
    nmap('<leader>wa', vim.lsp.buf.add_workspace_folder, '[W]orkspace [A]dd Folder')
    nmap('<leader>wr', vim.lsp.buf.remove_workspace_folder, '[W]orkspace [R]emove Folder')
    nmap('<leader>wl', function()
      print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
    end, '[W]orkspace [L]ist Folders')

    -- Create a command `:Format` local to the LSP buffer
    vim.api.nvim_buf_create_user_command(bufnr, 'Format', function(_)
      vim.lsp.buf.format()
    end, { desc = 'Format current buffer with LSP' })

    local ft = vim.bo.filetype
    local pth = vim.fn.expand("%")
    if ft == "python" then
      local isort = string.format("silent !isort %s", pth)
      local ruff = string.format("silent !ruff format %s", pth)
      nmap("<leader>f", function()
        vim.cmd(ruff)
        vim.cmd(isort)
      end, "Format current buffer with Ruff and isort")

      nmap("Ï", function()
        vim.cmd(ruff)
        vim.cmd(isort)
      end, "Format current buffer with Ruff and isort")
      -- elseif ft == "json" then
      --   nmap("<leader>f",
      --     function()
      --       vim.cmd("!jq .")
      --     end, "Format current buffer with jq")
    elseif ft == "sh" then
      local shfmt = string.format("silent !shfmt -w %s", pth)
      nmap("<leader>f", function() vim.cmd(shfmt) end, "Format current buffer with shfmt")
      nmap("Ï", function() vim.cmd(shfmt) end, "Format current buffer with shfmt")
    elseif ft == "typescriptreact" or ft == 'javascriptreact' or ft == 'javascript' or ft == 'typescript' then
      local prettier = string.format("silent !prettier --tab-width 2 -w %s", pth)
      nmap("<leader>f", function() vim.cmd(prettier) end, "Format with prettier")
      nmap("Ï", function() vim.cmd(prettier) end, "Format with prettier")
    else
      vim.keymap.set('n', '<leader>f', vim.lsp.buf.format, { desc = 'Format current buffer' })
      vim.keymap.set('n', 'Ï', vim.lsp.buf.format, { desc = 'Format current buffer' })
    end
  end


  -- Enable the following language servers
  --  Feel free to add/remove any LSPs that you want here. They will automatically be installed.
  --
  --  Add any additional override configuration in the following tables. They will be passed to
  --  the `settings` field of the server config. You must look up that documentation yourself.
  --
  --  If you want to override the default filetypes that your language server will attach to you can
  --  define the property 'filetypes' to the map in question.
  local servers = {
    gopls = {},
    -- ruff_lsp = { },
    pyright = {
      -- settings = {
      -- pyright = {
      -- disableOrganizeImports = true, -- Using Ruff
      -- },
      --   python = {
      --     analysis = {
      --       ignore = { '*' }, -- Using Ruff
      --       -- typeCheckingMode = 'off', -- Using mypy
      --     },
      --   },
      -- },
    },
    rust_analyzer = {},
    tsserver = {},
    html = { filetypes = { 'html' } },
    lua_ls = {
      Lua = {
        workspace = { checkThirdParty = false },
        telemetry = { enable = false },
      },
    },
    jsonls = {

    },
    clangd = {},
    arduino_language_server = {},
    gleam = { ensure_installed = false }
  }
  vim.g.zig_fmt_parse_errors = 0
  vim.g.zig_fmt_autosave = 0

  -- Setup neovim lua configuration
  require('neodev').setup()

  -- nvim-cmp supports additional completion capabilities, so broadcast that to servers
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities = require('cmp_nvim_lsp').default_capabilities(capabilities)

  -- Ensure the servers above are installed
  local mason_lspconfig = require 'mason-lspconfig'

  mason_lspconfig.setup {

    --TODO: filter servers by ensure_installed
    ensure_installed = vim.tbl_keys(servers),
  }

  require('lspconfig').gleam.setup({})

  mason_lspconfig.setup_handlers {
    function(server_name)
      if server_name == "arduino_language_server" then
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          cmd = {
            "arduino-language-server",
            "-cli-config", "~/Library/Arduino15/arduino-cli.yaml",
            -- "-fqbn", "arduino:uvr:uno",
            "-cli", "/opt/homebrew/bin/arduino-cli",
            -- "-clangd", "/usr/bin/clangd"
          },
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      else
        require('lspconfig')[server_name].setup {
          capabilities = capabilities,
          on_attach = on_attach,
          settings = servers[server_name],
          filetypes = (servers[server_name] or {}).filetypes,
        }
      end
    end
  }
end


return {
  {
    -- LSP Configuration & Plugins
    'neovim/nvim-lspconfig',
    dependencies = {
      -- Automatically install LSPs to stdpath for neovim
      { 'williamboman/mason.nvim', config = true },
      'williamboman/mason-lspconfig.nvim',

      -- Useful status updates for LSP
      -- NOTE: `opts = {}` is the same as calling `require('fidget').setup({})`
      {
        'j-hui/fidget.nvim',
        enabled = false,
        tag = 'legacy',
        -- tag = 'legacy',
        opts = {
          timer = {
            fidget_decay = 1000
          },
          sources = {
            jdtls = { ignore = true },
          }
        }
      },

      -- Additional lua configuration, makes nvim stuff amazing!
      'folke/neodev.nvim',
    },

    config = cfg
  },
  -- {
  --   "ray-x/lsp_signature.nvim",
  --   event = "VeryLazy",
  --   opts = {
  --
  --     debug = false,                                              -- set to true to enable debug logging
  --     log_path = vim.fn.stdpath("cache") .. "/lsp_signature.log", -- log dir when debug is on
  --     -- default is  ~/.cache/nvim/lsp_signature.log
  --     verbose = false,                                            -- show debug line number
  --
  --     bind = true,                                                -- This is mandatory, otherwise border config won't get registered.
  --     -- If you want to hook lspsaga or other signature handler, pls set to false
  --     doc_lines = 10,                                             -- will show two lines of comment/doc(if there are more than two lines in doc, will be truncated);
  --     -- set to 0 if you DO NOT want any API comments be shown
  --     -- This setting only take effect in insert mode, it does not affect signature help in normal
  --     -- mode, 10 by default
  --
  --     max_height = 12,                       -- max height of signature floating_window
  --     max_width = 80,                        -- max_width of signature floating_window, line will be wrapped if exceed max_width
  --     -- the value need >= 40
  --     wrap = true,                           -- allow doc/signature text wrap inside floating_window, useful if your lsp return doc/sig is too long
  --     floating_window = false,               -- show hint in a floating window, set to false for virtual text only mode
  --
  --     floating_window_above_cur_line = true, -- try to place the floating above the current line when possible Note:
  --     -- will set to true when fully tested, set to false will use whichever side has more space
  --     -- this setting will be helpful if you do not want the PUM and floating win overlap
  --
  --     floating_window_off_x = 1, -- adjust float windows x position.
  --     -- can be either a number or function
  --     floating_window_off_y = 0, -- adjust float windows y position. e.g -2 move window up 2 lines; 2 move down 2 lines
  --     -- can be either number or function, see examples
  --
  --     close_timeout = 4000, -- close floating window after ms when laster parameter is entered
  --     fix_pos = false, -- set to true, the floating window will not auto-close until finish all parameters
  --     hint_enable = true, -- virtual hint enable
  --     hint_prefix = "🐼 ", -- Panda for parameter, NOTE: for the terminal not support emoji, might crash
  --     hint_scheme = "String",
  --     hint_inline = function() return false end, -- should the hint be inline(nvim 0.10 only)?  default false
  --     -- return true | 'inline' to show hint inline, return 'eol' to show hint at end of line, return false to disable
  --     -- return 'right_align' to display hint right aligned in the current line
  --     hi_parameter = "LspSignatureActiveParameter", -- how your parameter will be highlight
  --     handler_opts = {
  --       border = "rounded"                          -- double, rounded, single, shadow, none, or a table of borders
  --     },
  --
  --     always_trigger = false,                   -- sometime show signature on new line or in middle of parameter can be confusing, set it to false for #58
  --
  --     auto_close_after = nil,                   -- autoclose signature float win after x sec, disabled if nil.
  --     extra_trigger_chars = {},                 -- Array of extra characters that will trigger signature completion, e.g., {"(", ","}
  --     zindex = 200,                             -- by default it will be on top of all floating windows, set to <= 50 send it to bottom
  --
  --     padding = '',                             -- character to pad on left and right of signature can be ' ', or '|'  etc
  --
  --     transparency = nil,                       -- disabled by default, allow floating win transparent value 1~100
  --     shadow_blend = 36,                        -- if you using shadow as border use this set the opacity
  --     shadow_guibg = 'Black',                   -- if you using shadow as border use this set the color e.g. 'Green' or '#121315'
  --     timer_interval = 200,                     -- default timer check interval set to lower value if you want to reduce latency
  --     toggle_key = nil,                         -- toggle signature on and off in insert mode,  e.g. toggle_key = '<M-x>'
  --     toggle_key_flip_floatwin_setting = false, -- true: toggle floating_windows: true|false setting after toggle key pressed
  --     -- false: floating_windows setup will not change, toggle_key will pop up signature helper, but signature
  --     -- may not popup when typing depends on floating_window setting
  --
  --     select_signature_key = nil, -- cycle to next signature, e.g. '<M-n>' function overloading
  --     move_cursor_key = nil,      -- imap, use nvim_set_current_win to move cursor between current win
  --   },
  --   -- config = function(_, opts)
  --   --   require 'lsp_signature'.setup(opts)
  --   -- end
  -- },
  {
    'mfussenegger/nvim-jdtls'
  }
}
