return { {
  -- Highlight, edit, and navigate code
  'nvim-treesitter/nvim-treesitter',
  dependencies = {
    'nvim-treesitter/nvim-treesitter-textobjects',
  },
  build = ':TSUpdate',
  config = function()
    -- [[ Configure Treesitter ]]
    -- See `:help nvim-treesitter`
    --
    --GSQL
    local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
    parser_config.gsql = {
      install_info = {
        -- url = "https://github.com/rrossmiller/tree-sitter-gsql", -- local path or git repo
        url = "/Users/robrossmiller/Documents/Projects/tree-sitter-gsql", -- local path or git repo
        files = { "src/parser.c" },                              -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = "main",                                         -- default branch in case of git repo if different from master
        generate_requires_npm = false,                           -- if stand-alone parser without npm dependencies
        requires_generate_from_grammar = false,                  -- if folder contains pre-generated src/parser.c
      },
      filetype = "gsql",                                         -- if filetype does not match the parser name
    }
    vim.filetype.add({
      extension = {
        gsql = "gsql"

      }
    })

    require('nvim-treesitter.configs').setup {
      -- Add languages to be installed here that you want installed for treesitter
      ensure_installed = { 'go', 'lua', 'python', 'rust', 'tsx', 'javascript', 'typescript', 'vimdoc',
        'vim', 'gsql', },

      -- Autoinstall languages that are not installed. Defaults to false (but you can change for yourself!)
      auto_install = true,
      --

      highlight = { enable = true },
      indent = { enable = true },
      incremental_selection = {
        enable = true,
        keymaps = {
          init_selection = '<c-space>',
          node_incremental = '<c-space>',
          scope_incremental = '<c-s>',
          node_decremental = '<M-space>',
        },
      },
      textobjects = {
        select = {
          enable = true,
          lookahead = true, -- Automatically jump forward to textobj, similar to targets.vim
          keymaps = {
            -- You can use the capture groups defined in textobjects.scm
            ['aa'] = '@parameter.outer',
            ['ia'] = '@parameter.inner',
            ['af'] = '@function.outer',
            ['if'] = '@function.inner',
            ['ac'] = '@class.outer',
            ['ic'] = '@class.inner',
          },
        },
        move = {
          enable = true,
          set_jumps = true, -- whether to set jumps in the jumplist
          goto_next_start = {
            [']m'] = '@function.outer',
            [']]'] = '@class.outer',
          },
          goto_next_end = {
            [']M'] = '@function.outer',
            [']['] = '@class.outer',
          },
          goto_previous_start = {
            ['[m'] = '@function.outer',
            ['[['] = '@class.outer',
          },
          goto_previous_end = {
            ['[M'] = '@function.outer',
            ['[]'] = '@class.outer',
          },
        },
        -- swap = {
        --   enable = true,
        --   swap_next = {
        --     ['<leader>a'] = '@parameter.inner',
        --   },
        --   swap_previous = {
        --     ['<leader>A'] = '@parameter.inner',
        --   },
        -- },
      },
    }
  end

},
  {
    'nvim-treesitter/playground',
    keys = {
      { "<leader>tP", "<cmd>TSPlaygroundToggle<cr>", desc = "TS toggle playground" },
    },
  }
}
