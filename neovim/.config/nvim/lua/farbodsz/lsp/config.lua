-------------------------------------------------------------------------------
-- LSP configuration
-------------------------------------------------------------------------------

local M = {}

-- Use an on_attach function to only map the following keys
-- after the language server attaches to the current buffer
M.on_attach = function(client, bufnr)
  local function bufmap(...)
    vim.api.nvim_buf_set_keymap(bufnr, ...)
  end
  local function bufopt(...)
    vim.api.nvim_buf_set_option(bufnr, ...)
  end

  -- Enable completion triggered by <c-x><c-o>
  bufopt("omnifunc", "v:lua.vim.lsp.omnifunc")

  -- Mappings
  local opts = { noremap = true, silent = true }
  bufmap("n", "gd", "<cmd>lua vim.lsp.buf.definition()<CR>", opts)
  bufmap("n", "gD", "<cmd>split | lua vim.lsp.buf.definition()<CR>", opts)
  bufmap("n", "gtd", "<cmd>lua vim.lsp.buf.type_definition()<CR>", opts)
  bufmap("n", "gi", "<cmd>lua vim.lsp.buf.implementation()<CR>", opts)
  bufmap("n", "gr", "<cmd>lua vim.lsp.buf.references()<CR>", opts)
  bufmap("n", "K", "<cmd>lua vim.lsp.buf.hover()<CR>", opts)
  bufmap("n", "gwa", "<cmd>lua vim.lsp.buf.add_workspace_folder()<CR>", opts)
  bufmap("n", "gwd", "<cmd>lua vim.lsp.buf.remove_workspace_folder()<CR>", opts)
  bufmap(
    "n",
    "gwl",
    "<cmd>lua print(vim.inspect(vim.lsp.buf.list_workspace_folders()))<CR>",
    opts
  )

  bufmap("n", "<leader>rn", "<cmd>lua vim.lsp.buf.rename()<CR>", opts)
  bufmap("n", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  bufmap("v", "<leader>ca", "<cmd>lua vim.lsp.buf.code_action()<CR>", opts)
  bufmap("n", "[d", "<cmd>lua vim.diagnostic.goto_prev()<CR>", opts)
  bufmap("n", "]d", "<cmd>lua vim.diagnostic.goto_next()<CR>", opts)

  local formatCmd = "<cmd>lua vim.lsp.buf.format({ async = true })<CR>"
  if client.server_capabilities.documentFormattingProvider then
    bufmap("n", "<space>cf", formatCmd, opts)
  end
  if client.server_capabilities.documentRangeFormattingProvider then
    bufmap("v", "<space>cf", formatCmd, opts)
  end
end

return M
