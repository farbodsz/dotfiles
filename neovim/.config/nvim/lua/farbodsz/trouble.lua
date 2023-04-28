--------------------------------------------------------------------------------
-- trouble.nvim config
--------------------------------------------------------------------------------

local M = {}

local function nnoremap(keymap, cmd)
  vim.keymap.set("n", keymap, cmd, { silent = true, noremap = true })
end

local function setup_keymaps()
  local prefix = "<leader>e"
  nnoremap(prefix .. "e", "<cmd>TroubleToggle document_diagnostics<cr>")
  nnoremap(prefix .. "w", "<cmd>TroubleToggle workspace_diagnostics<cr>")
  nnoremap(prefix .. "l", "<cmd>TroubleToggle loclist<cr>")
  nnoremap(prefix .. "q", "<cmd>TroubleToggle quickfix<cr>")
  nnoremap("gR", "<cmd>TroubleToggle lsp_references<cr>")
end

function M.setup()
  setup_keymaps()

  vim.cmd([[
    augroup trouble
      au!
      autocmd FileType Trouble setlocal tw=0
    augroup end
  ]])

  require("trouble").setup({
    mode = "document_diagnostics",
    use_diagnostic_signs = true,
  })
end

return M
