-------------------------------------------------------------------------------
-- Completion configuration
-------------------------------------------------------------------------------

local cmp = require("cmp")
local luasnip = require("luasnip")
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

local function jump_prev_snippet(fallback)
  if luasnip.jumpable(-1) then
    luasnip.jump(-1)
  else
    fallback()
  end
end

local function jump_next_snippet(fallback)
  if luasnip.expand_or_jumpable() then
    luasnip.expand_or_jump()
  else
    fallback()
  end
end

function M.setup()
  if has_setup then
    return
  end

  cmp.setup({
    mapping = {
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-t>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.close(),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),

      ["<C-i>"] = cmp.mapping(jump_next_snippet, { "i", "s" }),
      ["<C-u>"] = cmp.mapping(jump_prev_snippet, { "i", "s" }),
    },

    sources = {
      -- Order of sources determines priority in completion list
      { name = "nvim_lsp" },
      { name = "nvim_lua" },
      { name = "luasnip" },
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
          luasnip = "[snip]",
        },
      }),
    },

    snippet = {
      expand = function(args)
        luasnip.lsp_expand(args.body)
      end,
    },
  })

  setup_cmp_dictionary()
  require("luasnip.loaders.from_snipmate").load()

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
