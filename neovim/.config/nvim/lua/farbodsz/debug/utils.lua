--------------------------------------------------------------------------------
-- Utility functions for debugging
--------------------------------------------------------------------------------

local dap = require("dap")
local dapui = require("dapui")
local M = {}

function M.restart()
  dap.disconnect({ restart = true })
end

function M.disconnect_and_close()
  dapui.close({})
  dap.disconnect()
  dap.close()
end

return M
