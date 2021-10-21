local lspconfig = require("lspconfig")
local configs = require("lspconfig/configs")
local util = require("lspconfig/util")

-- Check if it's already defined for when reloading this file.
if not lspconfig.prolog_lsp then
  configs.prolog_lsp = {
    default_config = {
      cmd = {
        "swipl",
        "-g",
        "use_module(library(lsp_server)).",
        "-g",
        "lsp_server:main",
        "-t",
        "halt",
        "--",
        "stdio",
      },
      filetypes = { "prolog" },
      root_dir = util.root_pattern("pack.pl"),
    },
    docs = {
      description = [[
  https://github.com/jamesnvc/prolog_lsp

  Prolog Language Server
  ]],
    },
  }
end

lspconfig.prolog_lsp.setup({})
