--------------------------------------------------------------------------------
-- nvim-treesitter configuration
--------------------------------------------------------------------------------

-- At the moment, some languages (e.g. Haskell) compile with errors when
-- compiled with `gcc`.
require("nvim-treesitter.install").compilers = { "clang" }

require("nvim-treesitter.configs").setup({
  -- Languages
  ensure_installed = {
    "bash",
    "cmake",
    "comment",
    "css",
    "haskell",
    "help",
    "html",
    "http",
    "java",
    "javascript",
    "jsdoc",
    "json",
    "lua",
    "make",
    "python",
    "regex",
    "rst",
    "scheme",
    "scss",
    "toml",
    "tsx",
    "typescript",
    "yaml",
  },

  -- Highlighting
  highlight = {
    enable = true,
  },

  -- Tree-sitter based indentation
  indent = {
    enable = false,
  },

  -- nvim-treesitter-textobjects
  textobjects = {
    move = {
      enable = true,
      set_jumps = true, -- add to jumplist
      goto_next_start = {
        ["]m"] = "@function.outer",
        ["]]"] = "@class.outer",
      },
      goto_next_end = {
        ["]M"] = "@function.outer",
        ["]["] = "@class.outer",
      },
      goto_previous_start = {
        ["[m"] = "@function.outer",
        ["[["] = "@class.outer",
      },
      goto_previous_end = {
        ["[M"] = "@function.outer",
        ["[]"] = "@class.outer",
      },
    },

    select = {
      enable = true,
      lookahead = true, -- auto-jump forward to textobj
      keymaps = {
        -- Using the capture groups defined in textobjects.scm
        ["af"] = "@function.outer",
        ["if"] = "@function.inner",
        ["ac"] = "@class.outer",
        ["ic"] = "@class.inner",
      },
    },
  },
})

-- local parser_config = require("nvim-treesitter.parsers").get_parser_configs()
-- parser_config.haskell = {
--   install_info = {
--     url = "~/cloned/tree-sitter-haskell",
--     files = { "src/parser.c", "src/scanner.c" },
--   },
-- }

local ft_to_parser = require("nvim-treesitter.parsers").filetype_to_parsername
ft_to_parser.octo = "markdown"
