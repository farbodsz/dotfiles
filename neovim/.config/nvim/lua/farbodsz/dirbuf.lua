--------------------------------------------------------------------------------
-- Dirbuf configuration
--------------------------------------------------------------------------------

local M = {}

function M.setup()
  require("dirbuf").setup({
    sort_order = "directories_first",
    write_cmd = "DirbufSync -confirm",
  })

  local open_dirbuf_split = "belowright 15new | Dirbuf<CR>"
  vim.api.nvim_set_keymap("n", "<leader>e", ":" .. open_dirbuf_split, {})
end

return M
