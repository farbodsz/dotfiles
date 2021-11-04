-------------------------------------------------------------------------------
-- Linters and formatters for efm-langserver
-------------------------------------------------------------------------------

local M = {}

local pylint_msg_format = "{path}:{line}:{column}:{C}:{msg}"
local vint_msg_format = "{severity}: "
  .. "{file_path}:{line_number}:{column_number}: "
  .. "{description} [{reference}]"

local linters = {
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
  black = {
    formatCommand = "black -l 80 -",
    formatStdin = true,
  },
  brittany = {
    formatCommand = "brittany",
    formatStdin = true,
  },
  clang_format = {
    formatCommand = "clang-format -style=file -assume-filename=${INPUT}",
    formatStdin = true,
  },
  isort = {
    formatCommand = "isort -m 3 -tc -",
    formatStdin = true,
  },
  latexindent = {
    formatCommand = "latexindent -m",
    formatStdin = true,
  },
  prettier = {
    -- prettierd uses local prettier if available, otherwise a default prettier
    formatCommand = "prettierd ${INPUT}",
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
  bib = { formatters.latexindent },
  c = { formatters.clang_format },
  cpp = { formatters.clang_format },
  css = { formatters.prettier },
  haskell = { formatters.stylish_haskell, formatters.brittany },
  html = { formatters.prettier },
  javascript = { formatters.prettier },
  json = { formatters.prettier },
  lua = { linters.luacheck, formatters.stylua },
  markdown = { formatters.prettier },
  python = { linters.pylint, linters.mypy, formatters.isort, formatters.black },
  scss = { formatters.prettier },
  sh = { linters.shellcheck, formatters.shfmt },
  tex = { formatters.latexindent },
  typescript = { formatters.prettier },
  typescriptreact = { formatters.prettier },
  vim = { linters.vint },
  yaml = { formatters.prettier },
}

return M
