-------------------------------------------------------------------------------
-- Linters and formatters for efm-langserver
-------------------------------------------------------------------------------

local M = {}

local formatters = {
  brittany = {
    formatCommand = "brittany",
    formatStdin = true,
  },

  clang_format = {
    formatCommand = "clang-format -style=file -assume-filename=${INPUT}",
    formatStdin = true,
  },

  stylish_haskell = {
    formatCommand = "stylish-haskell",
    formatStdin = true,
  },
}

M.filetype_programs = {
  c = { formatters.clang_format },
  cpp = { formatters.clang_format },
  haskell = { formatters.stylish_haskell, formatters.brittany },
}

return M
