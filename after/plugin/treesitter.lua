require 'nvim-treesitter.configs'.setup {
    -- A list of parser names, or "all" (the five listed parsers should always be installed)
    ensure_installed = {
        "lua", "vim", "vimdoc", "query", "java", "python", "go",
        --"comment"
    },

    -- Install parsers synchronously (only applied to `ensure_installed`)
    sync_install = false,

    -- Automatically install missing parsers when entering buffer
    -- Recommendation: set to false if you don't have `tree-sitter` CLI installed locally
    auto_install = true,

    -- List of parsers to ignore installing (for "all")
    --  ignore_install = { "javascript" },

    highlight = {
        enable = true,

        -- NOTE: these are the names of the parsers and not the filetype. (for example if you want to
        -- disable highlighting for the `tex` filetype, you need to include `latex` in this list as this is
        -- the name of the parser)
        -- list of language that will be disabled
        -- disable = { "c", "rust" },
        -- Or use a function for more flexibility, e.g. to disable slow treesitter highlight for large files
        --  disable = function(lang, buf)
        --     local max_filesize = 100 * 1024 -- 100 KB
        --   local ok, stats = pcall(vim.loop.fs_stat, vim.api.nvim_buf_get_name(buf))
        -- if ok and stats and stats.size > max_filesize then
        --   return true
        --  end
        --end,

        -- Setting this to true will run `:h syntax` and tree-sitter at the same time.
        -- Set this to `true` if you depend on 'syntax' being enabled (like for indentation).
        -- Using this option may slow down your editor, and you may see some duplicate highlights.
        -- Instead of true it can also be a list of languages
        --  additional_vim_regex_highlighting = false,
    },
}

local parser_config = require "nvim-treesitter.parsers".get_parser_configs()
parser_config.gsql = {
    install_info = {
        -- url = "/Users/robrossmiller/Documents/Projects/tree-sitter-gsql", -- local path or git repo
        url = "/Users/rrossmil/Documents/personal/tree-sitter-gsql", -- local path or git repo
        files = { "src/parser.c" },                                  -- note that some parsers also require src/scanner.c or src/scanner.cc
        -- optional entries:
        branch = "main",                                             -- default branch in case of git repo if different from master
        --generate_requires_npm = false, -- if stand-alone parser without npm dependencies
        --requires_generate_from_grammar = false, -- if folder contains pre-generated src/parser.c
    },
    filetype = "gsql", -- if filetype does not match the parser name
}


-- playground keybind
vim.keymap.set("n", "<leader>tp", function() vim.cmd("TSPlaygroundToggle") end)
