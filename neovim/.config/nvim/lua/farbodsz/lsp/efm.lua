-------------------------------------------------------------------------------
-- Linters and formatters for efm-langserver
-------------------------------------------------------------------------------

local M = {}

local pylint_msg_format = "{path}:{line}:{column}:{C}:{msg}"
local vint_msg_format = "{severity}: "
  .. "{file_path}:{line_number}:{column_number}: "
  .. "{description} [{reference}]"

local linters = {
  chktex = {
    -- TODO: Find out why chktex doesn't lint properly
    lintCommand = "chktex -q -v0 -I",
    lintStdin = true,
    lintFormats = { "%f:%l:%c:%m" },
  },
  luacheck = {
    lintCommand = "luacheck --formatter visual_studio -",
    lintStdin = true,
    lintFormats = {
      "%f(%l,%c) : %tarning %m",
      "%f(%l,%c) : %trror %m",
    },
  },
  mypy = {
    lintCommand = "mypy --show-column-numbers",
    lintFormats = {
      "%f:%l:%c: %trror: %m",
      "%f:%l:%c: %tarning: %m",
      "%f:%l:%c: %tote: %m",
    },
  },
  pylint = {
    lintCommand = "pylint --output-format text --score no --msg-template "
      .. pylint_msg_format
      .. " ${INPUT}",
    lintStdin = false,
    lintFormats = { "%f:%l:%c:%t:%m" },
    lintCategoryMap = {
      I = "H",
      R = "I",
      C = "I",
      W = "W",
      E = "E",
      F = "E",
    },
  },
  shellcheck = {
    lintCommand = "shellcheck -f gcc -x",
    lintSource = "shellcheck",
    lintFormats = {
      "%f:%l:%c: %trror: %m",
      "%f:%l:%c: %tarning: %m",
      "%f:%l:%c: %tote: %m",
    },
  },
  vint = {
    lintCommand = "vint -s ${INPUT} --format '" .. vint_msg_format .. "'",
    lintStdin = true,
    lintFormats = {
      "%trror: %f:%l:%c: %m",
      "%tarning: %f:%l:%c: %m",
    },
  },
}

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

M.filetype_programs = {
  haskell = { formatters.stylish_haskell, formatters.brittany },
  lua = { linters.luacheck, formatters.stylua },
  python = { linters.pylint, linters.mypy },
  sh = { linters.shellcheck, formatters.shfmt },
  tex = { linters.chktex },
  vim = { linters.vint },
}

return M
