return {
  "numToStr/Comment.nvim",
  config = function()
    require("Comment").setup {
      ---Add a space b/w comment and the line
      padding = true,
      ---Whether the cursor should stay at its position
      sticky = true,
      ---Lines to be ignored while (un)comment
      ignore = nil,
      ---LHS of toggle mappings in NORMAL mode
      toggler = {
        ---Line-comment toggle keymap
        line = "÷",
        ---Block-comment toggle keymap
        block = "¿",
      },
      ---LHS of operator-pending mappings in NORMAL and VISUAL mode
      opleader = {
        ---Line-comment keymap
        -- line = 'gc',
        line = "÷", -- opt-/
        ---Block-comment keymap
        block = "¿", -- opt-shift-/
      },
      ---LHS of extra mappings
      extra = {
        ---Add comment on the line above
        above = "gcO",
        ---Add comment on the line below
        below = "gco",
        ---Add comment at the end of line
        eol = "gcA",
      },
      ---Enable keybindings
      ---NOTE: If given `false` then the plugin won't create any mappings
      mappings = {
        ---Operator-pending mapping; `gcc` `gbc` `gc[count]{motion}` `gb[count]{motion}`
        basic = true,
        ---Extra mapping; `gco`, `gcO`, `gcA`
        extra = true,
      },

      -- for nicer react commenting
      pre_hook = function(ctx)
        --[[ local U = require("Comment.utils") ]]
        --[[]]
        --[[ local location = nil ]]
        --[[ if ctx.ctype == U.ctype.block then ]]
        --[[     location = require("ts_context_commentstring.utils").get_cursor_location() ]]
        --[[ elseif ctx.cmotion == U.cmotion.v or ctx.cmotion == U.cmotion.V then ]]
        --[[     location = require("ts_context_commentstring.utils").get_visual_start_location() ]]
        --[[ end ]]
        --[[]]
        --[[ return require("ts_context_commentstring.internal").calculate_commentstring({ ]]
        --[[     key = ctx.ctype == U.ctype.line and "__default" or "__multiline", ]]
        --[[     location = location, ]]
        --[[ }) ]]
      end,
      ---Function to call after (un)comment
      post_hook = nil,
    }
  end,
}
