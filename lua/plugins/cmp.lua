return {
  {
    -- Autocompletion
    'hrsh7th/nvim-cmp',
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      'L3MON4D3/LuaSnip',
      'saadparwaiz1/cmp_luasnip',

      -- Adds LSP completion capabilities
      'hrsh7th/cmp-nvim-lsp',

      -- Adds a number of user-friendly snippets
      'rafamadriz/friendly-snippets',
    },
    config = function()
      -- [[ Configure nvim-cmp ]]
      -- See `:help cmp`
      local cmp = require 'cmp'
      local luasnip = require 'luasnip'
      require("luasnip.loaders.from_vscode").lazy_load({ paths = "~/.config/nvim/snippets" })
      luasnip.config.setup {}

      cmp.setup {
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        mapping = cmp.mapping.preset.insert {
          ['<C-n>'] = cmp.mapping.select_next_item(),
          ['<C-p>'] = cmp.mapping.select_prev_item(),
          ['<C-d>'] = cmp.mapping.scroll_docs(-4),
          ['<C-f>'] = cmp.mapping.scroll_docs(4),
          ['<C-Space>'] = cmp.mapping.complete {},
          ['<CR>'] = cmp.mapping.confirm {
            behavior = cmp.ConfirmBehavior.Replace,
            select = true,
          },
          ['<Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_next_item()
            elseif luasnip.expand_or_locally_jumpable() then
              luasnip.expand_or_jump()
            else
              fallback()
            end
          end, { 'i', 's' }),
          ['<S-Tab>'] = cmp.mapping(function(fallback)
            if cmp.visible() then
              cmp.select_prev_item()
            elseif luasnip.locally_jumpable(-1) then
              luasnip.jump(-1)
            else
              fallback()
            end
          end, { 'i', 's' }),
        },
        sources = {
          { name = 'nvim_lsp' },
          { name = 'luasnip' },
        },
        completion = { completeopt = "noselect" },
        preselect = cmp.PreselectMode.None
      }
    end
  },
  -- Useful plugin to show you pending keybinds.
  -- { 'folke/which-key.nvim', opts = {},
  -- config=function name()
  --         -- document existing key chains
  --   require('which-key').register({
  --     ['<leader>c'] = { name = '[C]ode', _ = 'which_key_ignore' },
  --     ['<leader>d'] = { name = '[D]ocument', _ = 'which_key_ignore' },
  --     ['<leader>g'] = { name = '[G]it', _ = 'which_key_ignore' },
  --     ['<leader>h'] = { name = 'More git', _ = 'which_key_ignore' },
  --     ['<leader>r'] = { name = '[R]ename', _ = 'which_key_ignore' },
  --     ['<leader>s'] = { name = '[S]earch', _ = 'which_key_ignore' },
  --     ['<leader>w'] = { name = '[W]orkspace', _ = 'which_key_ignore' },
  --   })
  --
  --
  -- end},
}
