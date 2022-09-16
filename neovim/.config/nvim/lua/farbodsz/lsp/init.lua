-------------------------------------------------------------------------------
-- LSP configuration
-------------------------------------------------------------------------------

local lspconfig = require("lspconfig")

local completion = require("farbodsz.completion")
local diagnostics = require("farbodsz.lsp.diagnostics")
local on_attach = require("farbodsz.lsp.config").on_attach
local null_ls = require("farbodsz.lsp.null-ls")
local servers = require("farbodsz.lsp.servers")
local signature = require("farbodsz.lsp.signature")

completion.setup()
local updated_capabilities = completion.make_capabilities()

diagnostics.setup()
signature.setup()

null_ls.setup()

for server, config in pairs(servers) do
  config = vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    capabilities = updated_capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }, config)

  lspconfig[server].setup(config)
end

-- TODO: Change mapping for autocompletion/snippets expand
