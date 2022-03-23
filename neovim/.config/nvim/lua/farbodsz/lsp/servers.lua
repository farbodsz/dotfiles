-------------------------------------------------------------------------------
-- Language servers
-------------------------------------------------------------------------------

local on_attach_default = require("farbodsz.lsp.config").on_attach
local on_attach_no_fmt = function(client, bufnr)
  -- Disable built-in language server formatting
  client.resolved_capabilities.document_formatting = false
  on_attach_default(client, bufnr)
end

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
    cmd = { "clangd", "--background-index" },
    on_attach = on_attach_no_fmt,
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

  -- npm i -g elm-test elm-format @elm-tooling/elm-language-server
  elmls = {},

  -- npm i -g graphql-language-service-cli
  graphql = {},

  -- ghcup install hls
  hls = {
    on_attach = on_attach_no_fmt,
  },

  -- npm i -g vscode-langservers-extracted
  html = {},

  -- npm i -g vscode-langservers-extracted
  jsonls = {
    init_options = {
      provideFormatter = false,
    },
  },

  -- npm i -g pyright
  pyright = {},

  -- Installation instructions in repo
  rnix = {},

  -- Installation instructions in repo
  rust_analyzer = {},

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
  texlab = {
    on_attach = on_attach_no_fmt,
    settings = {
      texlab = {
        chktex = {
          onEdit = true,
          onOpenAndSave = true,
        },
      },
    },
  },

  -- npm i -g typescript typescript-language-server
  tsserver = {
    on_attach = on_attach_no_fmt,
  },

  -- npm i -g vim-language-server
  vimls = {},

  -- npm i -g yaml-language-server
  yamlls = {},
}
