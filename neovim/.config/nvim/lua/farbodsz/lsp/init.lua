-------------------------------------------------------------------------------
-- LSP configuration
-------------------------------------------------------------------------------

local completion = require("farbodsz.lsp.completion")
local on_attach = require("farbodsz.lsp.config").on_attach
local servers = require("farbodsz.lsp.servers")
local signature = require("farbodsz.lsp.signature")

completion.setup()
local updated_capabilities = completion.make_capabilities()

signature.setup()

for server, config in pairs(servers) do
  config = vim.tbl_deep_extend("force", {
    on_attach = on_attach,
    capabilities = updated_capabilities,
    flags = {
      debounce_text_changes = 150,
    },
  }, config)

  require("lspconfig")[server].setup(config)
end

-- TODO:
-- Change mapping for autocompletion/snippets expand
-- Highlight symbol and references when cursor on variable/function/...
-- Mappings for text objects (using textDocment.docmentSymbol?)
--   - E.g. xmap if / omap if / xmap ac / omap ...
