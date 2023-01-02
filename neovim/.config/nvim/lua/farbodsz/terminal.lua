--------------------------------------------------------------------------------
-- Terminal configuration
--------------------------------------------------------------------------------

local M = {}

function M.setup()
  require("toggleterm").setup({
    open_mapping = [[<c-t>]],
    start_in_insert = false,

    highlights = {
      Normal = { link = "ToggletermNormal" },
      NormalFloat = { link = "ToggletermNormalFloat" },
    },
    shade_terminals = false,
  })
end

return M
