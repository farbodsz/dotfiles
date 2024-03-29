-------------------------------------------------------------------------------
-- Linters and formatters for null-ls
-------------------------------------------------------------------------------

local M = {}

local null_ls = require("null-ls")
local builtins = null_ls.builtins

function M.setup()
  null_ls.setup({
    on_attach = require("farbodsz.lsp.config").on_attach,

    sources = {
      -- CPP:
      --  * clang-format
      builtins.formatting.clang_format.with({
        filetypes = { "c", "cpp", "cs" },
      }),

      -- LUA:
      --  * luacheck: installation instructions in repo
      --  * stylua: binary from releases page
      builtins.diagnostics.luacheck,
      builtins.formatting.stylua,

      -- PYTHON:
      --  * [all]: pip install
      builtins.formatting.autoflake,
      builtins.formatting.isort.with({
        extra_args = { "-m", "3", "-tc" }, -- vertical hanging, trailing comma
      }),
      builtins.formatting.black,

      -- SHELL:
      --  * shellcheck: installation instructions in repo
      --  * shfmt: binary from releases page
      builtins.code_actions.shellcheck,
      builtins.diagnostics.shellcheck,
      builtins.formatting.shfmt.with({
        extra_args = { "-i", "2", "-ci" },
      }),

      -- SQL:
      --  * sql-formatter: npm install
      builtins.formatting.sql_formatter.with({
        extra_args = {
          "--language",
          "postgresql",
          "--config",
          vim.env.XDG_CONFIG_HOME .. "/sql-formatter/config.json",
        },
      }),

      -- TEX:
      --  * latexindent: installation instructions in repo
      builtins.formatting.latexindent.with({
        extra_args = { "-m" }, -- modify line breaks
        extra_filetypes = { "bib" },
      }),

      -- VIMSCRIPT:
      --  * vint: pip install vim-vint
      builtins.diagnostics.vint,

      -- WEB:
      --  * eslint_d: npm i -g eslint_d
      --  * prettierd: npm i -g @fsouza/prettierd
      builtins.formatting.prettierd,
      builtins.code_actions.eslint_d,
      builtins.diagnostics.eslint_d,
    },
  })
end

return M
