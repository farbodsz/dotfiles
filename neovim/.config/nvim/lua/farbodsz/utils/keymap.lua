local M = {}

function M.nnoremap(...)
  vim.keymap.set("n", ...)
end

return M
