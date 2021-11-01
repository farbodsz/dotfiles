--------------------------------------------------------------------------------
-- Debugging configuration
--------------------------------------------------------------------------------

local dap = require("dap")
local configs = require("farbodsz.debug.configs")
local ui = require("farbodsz.debug.ui")

dap.set_log_level("DEBUG")

dap.adapters = configs.adapters
dap.configurations = configs.configurations

ui.listen_dapui_events()
ui.setup_dapui()
ui.setup_virtual_text()
