local M = {}

function M.setup()
  print("TS setup")
end

require("nvim-treesitter.configs").setup({
  -- Highlighting
  highlight = {
    enable = true,
  },
  -- Tree-sitter based indentation
  indent = {
    enable = false,
  },
})

-- At the moment, some languages (e.g. Haskell) compile with errors when
-- compiled with `gcc`.
require("nvim-treesitter.install").compilers = { "clang" }

return M
