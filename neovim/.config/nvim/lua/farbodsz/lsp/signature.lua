-------------------------------------------------------------------------------
-- lsp_signature.nvim configuration
-------------------------------------------------------------------------------

return {
  setup = function()
    require("lsp_signature").setup({
      floating_window = true,
      hint_enable = false,
      handler_opts = {
        border = "none",
      },
    })
  end,
}
