-------------------------------------------------------------------------------
-- Diagnostics customisation
-------------------------------------------------------------------------------

local M = {}

function M.setup()
  -- Diagnostic signs
  local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
  for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
  end

  vim.diagnostic.config({
    float = { source = "always" },
    severity_sort = true,
  })
end

return M
