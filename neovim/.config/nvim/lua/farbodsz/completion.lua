-------------------------------------------------------------------------------
-- Completion configuration
-------------------------------------------------------------------------------

local cmp = require("cmp")
local lspkind = require("lspkind")

local has_setup = false

local M = {}

local function setup_cmp_dictionary()
  require("cmp_dictionary").setup({
    dic = {
      ["markdown"] = { "/usr/share/dict/words" },
      ["tex"] = { "/usr/share/dict/words" },
    },
  })
end

function M.setup()
  if has_setup then
    return
  end

  cmp.setup({
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-u>"] = cmp.mapping.scroll_docs(4),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.close(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),
    },

    sources = {
      -- Order of sources determines priority in completion list
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "ultisnips" },
      { name = "path" },
      { name = "dictionary", keyword_length = 5 },
      { name = "buffer", keyword_length = 4 },
    },

    formatting = {
      format = lspkind.cmp_format({
        with_text = false,
        maxwidth = 50,

        menu = {
          -- For each source
          buffer = "[buf]",
          dictionary = "[dict]",
          nvim_lsp = "[LSP]",
          nvim_lua = "[api]",
          path = "[path]",
          ultisnips = "[snip]",
        },
      }),
    },

    snippet = {
      expand = function(args)
        -- Ultisnips
        vim.fn["UltiSnips#Anon"](args.body)
      end,
    },
  })

  setup_cmp_dictionary()

  vim.cmd([[
    augroup DadbodSql
      au!
      autocmd FileType sql setlocal omnifunc=vim_dadbod_completion#omni
    augroup END
  ]])

  -- Set completeopt to have a better completion experience
  vim.o.completeopt = "menu,menuone,noselect"

  has_setup = true
end

-- Add additional capabilities supported by nvim-cmp and snippet support
function M.make_capabilities()
  local capabilities = vim.lsp.protocol.make_client_capabilities()
  capabilities.textDocument.completion.completionItem.snippetSupport = true
  return require("cmp_nvim_lsp").update_capabilities(capabilities)
end

return M
