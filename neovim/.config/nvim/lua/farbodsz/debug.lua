--------------------------------------------------------------------------------
-- Debugging configuration
--------------------------------------------------------------------------------

local dap = require("dap")
local dapui = require("dapui")

dap.set_log_level("DEBUG")

--
-- Adapters
--

-- Install: Plug 'jbyuki/one-small-step-for-vimkind'
dap.adapters.nlua = function(callback, config)
  callback({ type = "server", host = config.host, port = config.port })
end

-- Install: pip install debugpy
dap.adapters.python = {
  type = "executable",
  command = "python3",
  args = { "-m", "debugpy.adapter" },
}

--
-- Configurations
--

dap.configurations.lua = {
  {
    type = "nlua",
    request = "attach",
    name = "Attach to running Neovim instance",
    host = function()
      local value = vim.fn.input("Host [127.0.0.1]: ")
      if value ~= "" then
        return value
      end
      return "127.0.0.1"
    end,
    port = function()
      local val = tonumber(vim.fn.input("Port: "))
      assert(val, "Please provide a port number")
      return val
    end,
  },
}

dap.configurations.python = {
  {
    type = "python",
    request = "launch",
    name = "Python Flask Backend",
    -- TODO
  },
}

--
-- Listeners
--

dap.listeners.after.event_initialized["dapui_config"] = function()
  dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
  dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
  dapui.close()
end

--
-- nvim-dap-ui
--

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

--
-- Custom functions
--

local M = {}

function M.restart()
  dap.disconnect({ restart = true })
end

function M.disconnect_and_close()
  dapui.close()
  dap.disconnect()
  dap.close()
end

return M
