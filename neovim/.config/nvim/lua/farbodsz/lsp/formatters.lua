-------------------------------------------------------------------------------
-- Formatters for efm-langserver
-------------------------------------------------------------------------------

local M = {}

local formatters = {
  brittany = {
    formatCommand = "brittany",
    formatStdin = true,
  },
  shfmt = {
    formatCommand = "shfmt -i 2 -ci -",
    formatStdin = true,
  },
  stylish_haskell = {
    formatCommand = "stylish-haskell",
    formatStdin = true,
  },
  stylua = {
    formatCommand = "stylua -",
    formatStdin = true,
  },
}

M.filetype_formatters = {
  haskell = { formatters.stylish_haskell, formatters.brittany },
  lua = { formatters.stylua },
  sh = { formatters.shfmt },
}

return M
