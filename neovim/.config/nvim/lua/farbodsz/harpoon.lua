--------------------------------------------------------------------------------
-- Harpoon configuration
--------------------------------------------------------------------------------

local nnoremap = require("farbodsz.utils.keymap").nnoremap
local M = {}

function M.setup()
  require("harpoon").setup()

  -- NOTE: same prefix as git hunk mappings
  nnoremap("<leader>hl", "<cmd>Telescope harpoon marks<cr>")
  nnoremap("<leader>ha", function()
    require("harpoon.mark").add_file()
  end)
  nnoremap("<leader>hf", function()
    require("harpoon.ui").nav_file(vim.v.count)
  end)
end

return M
