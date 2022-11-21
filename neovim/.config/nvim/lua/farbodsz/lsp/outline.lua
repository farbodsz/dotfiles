-------------------------------------------------------------------------------
-- symbols-outline.nvim
-------------------------------------------------------------------------------

local symbols_outline = require("symbols-outline")
local M = {}

function M.setup()
  symbols_outline.setup({
    width = 30,
    autofold_depth = 1,
    show_numbers = true,
    show_relative_numbers = true,
    keymaps = {
      rename_symbol = "gr",
      code_actions = "<leader>ca",
      fold_all = { "zC", "zM" },
      unfold_all = { "zO", "zR" },
    },
  })
end

return M
