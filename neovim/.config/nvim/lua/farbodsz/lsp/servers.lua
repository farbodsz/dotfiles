-------------------------------------------------------------------------------
-- Language servers
-------------------------------------------------------------------------------

local default_on_attach = require("farbodsz.lsp.config").on_attach
local efm_ft_progs = require("farbodsz.lsp.efm").filetype_programs

local sumneko_root_path = vim.fn.stdpath("data") .. "/lua-language-server"
local sumneko_binary = sumneko_root_path .. "/bin/Linux/lua-language-server"

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

return {
  -- npm i -g bash-language-server
  bashls = {},

  -- Should already be installed
  clangd = {
    cmd = { "clangd-9", "--background-index" },
  },

  -- npm i -g vscode-langservers-extracted
  cssls = {},

  -- Installation instructions in repo
  efm = {
    filetypes = vim.tbl_keys(efm_ft_progs),
    init_options = { documentFormatting = true },
    settings = {
      rootMarkers = { ".git/" },
      languages = efm_ft_progs,
    },
  },

  -- npm i -g graphql-language-service-cli
  graphql = {},

  -- ghcup install hls
  hls = {
    on_attach = function(client, bufnr)
      -- Disable builtin HLS formatting
      client.resolved_capabilities.document_formatting = false
      default_on_attach(client, bufnr)
    end,
  },

  -- npm i -g vscode-langservers-extracted
  html = {},

  -- Installation instructions in repo
  rnix = {},

  -- Installation instructions in repo
  sumneko_lua = {
    cmd = { sumneko_binary, "-E", sumneko_root_path .. "/main.lua" },
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
          path = runtime_path,
        },
        diagnostics = {
          -- Get the language server to recognize the `vim` global
          globals = { "vim" },
        },
        workspace = {
          -- Make the server aware of Neovim runtime files
          library = vim.api.nvim_get_runtime_file("", true),
        },
        telemetry = {
          enable = false,
        },
      },
    },
  },

  -- Installation instructions in repo
  texlab = {},

  -- npm i -g typescript typescript-language-server
  tsserver = {},

  -- npm i -g vim-language-server
  vimls = {},

  -- npm i -g yaml-language-server
  yamlls = {},
}

-- TODO:
-- "javacc": {
--   "command": "java",
--   "args": ["-jar", "/home/farbod/.config/nvim/bin/com.javacc.ls-uber.jar"],
--   "filetypes": ["javacc"]
-- },

-- "python": {
--   "command": "python",
--   "args": ["-mpyls", "-vv", "--log-file", "/tmp/lsp_python.log"],
--   "trace.server": "verbose",
--   "filetypes": ["python"],
--   "settings": {
--     "pyls": {
--       "enable": true,
--       "trace": { "server": "verbose" },
--       "commandPath": "",
--       "plugins": {
--         "jedi_completion": { "enabled": true },
--         "jedi_hover": { "enabled": true },
--         "jedi_references": { "enabled": true },
--         "jedi_signature_help": { "enabled": true },
--         "jedi_symbols": { "enabled": true, "all_scopes": true },
--         "mccabe": { "enabled": true, "threshold": 15 },
--         "preload": { "enabled": true },
--         // Enable type-checking (requires pyls-mypy from pip)
--         "pyls_mypy": { "enabled": true, "live_mode": false },
--         "rope_completion": { "enabled": true }
--       }
--     }
--   }
-- },

-- "prolog-lsp": {
--   "command": "swipl",
--   "args": [
--     "-g",
--     "use_module(library(lsp_server)).",
--     "-g",
--     "lsp_server:main",
--     "-t",
--     "halt",
--     "--",
--     "stdio"
--   ],
--   "filetypes": ["prolog"]
-- }
--
-- let g:coc_global_extensions = [
--       \ 'coc-clang-format-style-options',
--       \ 'coc-cssmodules',
--       \ 'coc-db',
--       \ 'coc-eslint',
--       \ 'coc-vimtex',
--       \ ]
