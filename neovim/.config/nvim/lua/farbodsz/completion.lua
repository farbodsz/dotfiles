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

local function has_words_before()
  local line, col = unpack(vim.api.nvim_win_get_cursor(0))
  return col ~= 0
    and vim.api.nvim_buf_get_lines(0, line - 1, line, true)[1]
        :sub(col, col)
        :match("%s")
      == nil
end

function M.setup()
  if has_setup then
    return
  end

  cmp.setup({
    mapping = {
      ["<C-d>"] = cmp.mapping.scroll_docs(-4),
      ["<C-u>"] = cmp.mapping.scroll_docs(4),
      ["<C-e>"] = cmp.mapping.close(),
      ["<C-Space>"] = cmp.mapping.complete(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }),

      ["<C-j>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        elseif luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        elseif has_words_before() then
          cmp.complete()
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
      ["<C-k>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        elseif luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, {
        "i",
        "s",
      }),
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
