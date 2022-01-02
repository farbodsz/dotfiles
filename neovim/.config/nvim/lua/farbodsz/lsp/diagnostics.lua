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

  -- Show source in diagnostics and sort by severity
  vim.diagnostic.config({
    float = { source = "always" },
    severity_sort = true,
    virtual_text = { source = "always" },
  })
end

return M
