-------------------------------------------------------------------------------
-- Language servers
-------------------------------------------------------------------------------

local on_attach_default = require("farbodsz.lsp.config").on_attach
local on_attach_no_fmt = function(client, bufnr)
  -- Disable built-in language server formatting
  client.resolved_capabilities.document_formatting = false
  on_attach_default(client, bufnr)
end

local runtime_path = vim.split(package.path, ";")
table.insert(runtime_path, "lua/?.lua")
table.insert(runtime_path, "lua/?/init.lua")

local nvim_cfg_path = vim.env["DOTFILES"] .. "/neovim/.config/nvim"

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

  -- npm i -g dockerfile-language-server-nodejs
  dockerls = {},

  -- npm i -g elm-test elm-format @elm-tooling/elm-language-server
  elmls = {},

  -- Installation instructions in repo
  gradle_ls = {
    cmd = {
      nvim_cfg_path
        .. "/bin/vscode-gradle"
        .. "/gradle-language-server/build/install/gradle-language-server"
        .. "/bin/gradle-language-server",
    },
  },

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

  -- -- npm i -g pyright
  -- pyright = {
  --   on_attach = on_attach_no_fmt,
  -- },

  -- pip install python-lsp-server pylsp-mypy pylsp-rope pyls-memestra
  pylsp = {
    on_attach = on_attach_no_fmt,
  },

  -- Installation instructions in repo
  rnix = {},

  -- Installation instructions in repo
  rust_analyzer = {},

  -- Installation instructions in repo
  sumneko_lua = {
    on_attach = on_attach_no_fmt,
    settings = {
      Lua = {
        runtime = {
          version = "LuaJIT",
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
