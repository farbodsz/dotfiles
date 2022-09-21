--------------------------------------------------------------------------------
-- Terminal configuration
--------------------------------------------------------------------------------

local M = {}

function M.setup()
  require("toggleterm").setup({
    open_mapping = [[<c-t>]],
    start_in_insert = false,
  })
end

return M
