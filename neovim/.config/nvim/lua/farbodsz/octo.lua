--------------------------------------------------------------------------------
-- octo.nvim configuration
--------------------------------------------------------------------------------

local octo = require("octo")
local M = {}

function M.setup()
  -- Note: Mappings apply to Octo filetype (not "global")
  -- Using default mappings
  octo.setup()
end

return M
