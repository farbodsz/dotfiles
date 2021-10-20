--------------------------------------------------------------------------------
-- Adapters and configurations for nvim-dap
--------------------------------------------------------------------------------

local M = {}

M.adapters = {
  -- Plugin 'jbyuki/one-small-step-for-vimkind'
  nlua = function(callback, config)
    callback({ type = "server", host = config.host, port = config.port })
  end,

  -- pip install debugpy
  python = {
    type = "executable",
    command = "python3",
    args = { "-m", "debugpy.adapter" },
  },
}

M.configurations = {
  lua = {
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
  },

  python = {
    {
      type = "python",
      request = "launch",
      name = "Python Flask Backend",
      -- TODO
    },
  },
}

return M
