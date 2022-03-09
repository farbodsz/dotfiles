--------------------------------------------------------------------------------
-- venn.nvim configuration
--------------------------------------------------------------------------------

local M = {}

local bufnmap = function(key, cmd)
  vim.api.nvim_buf_set_keymap(0, "n", key, cmd, { noremap = true })
end
local bufvmap = function(key, cmd)
  vim.api.nvim_buf_set_keymap(0, "v", key, cmd, { noremap = true })
end

function M.toggle_venn()
  if vim.inspect(vim.b.venn_enabled) ~= "nil" then
    vim.cmd([[setlocal ve=]])
    vim.cmd([[mapclear <buffer>]])
    vim.b.venn_enabled = nil
    print("Venn mode disabled")
    return
  end

  vim.b.venn_enabled = true
  vim.cmd([[setlocal ve=all]])

  bufnmap("J", "<C-v>j:VBox<CR>")
  bufnmap("K", "<C-v>k:VBox<CR>")
  bufnmap("L", "<C-v>l:VBox<CR>")
  bufnmap("H", "<C-v>h:VBox<CR>")
  bufvmap("f", ":VBox<CR>")

  print("Venn mode enabled")
end

--- Toggle venn mode using <leader>v
function M.setup()
  vim.api.nvim_set_keymap(
    "n",
    "<leader>v",
    [[:lua require("farbodsz.venn").toggle_venn()<CR>]],
    { noremap = true }
  )
end

return M
