--------------------------------------------------------------------------------
-- Terminal configuration
--------------------------------------------------------------------------------

local M = {}

function M.setup()
  require("toggleterm").setup({
    open_mapping = [[<c-t>]],
  })
end

return M
