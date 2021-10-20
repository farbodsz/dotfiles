--------------------------------------------------------------------------------
-- nvim-dap-ui configuration
--------------------------------------------------------------------------------

local dap = require("dap")
local dapui = require("dapui")

local M = {}

function M.configure_dapui()
  dapui.setup({
    icons = { expanded = "▾", collapsed = "▸" },

    mappings = {
      -- Use a table to apply multiple mappings
      expand = { "<CR>", "<2-LeftMouse>" },
      open = "o",
      remove = "d",
      edit = "e",
      repl = "r",
    },

    sidebar = {
      elements = {
        -- Order (bottom-to-top) and relative size of windows
        { id = "breakpoints", size = 0.2 },
        { id = "watches", size = 0.15 },
        { id = "scopes", size = 0.45 },
        { id = "stacks", size = 0.2 },
      },
      size = 50,
      position = "left",
    },

    tray = {
      elements = { "repl" },
      size = 12,
      position = "bottom",
    },

    floating = {
      max_height = nil,
      max_width = nil,
      mappings = {
        close = { "q", "<Esc>", "<C-c>" },
      },
    },

    windows = { indent = 2 },
  })
end

function M.listen_dapui_events()
  dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
  end

  dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
  end

  dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
  end
end

return M
