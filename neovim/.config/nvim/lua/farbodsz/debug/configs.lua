--------------------------------------------------------------------------------
-- Adapters and configurations for nvim-dap
--------------------------------------------------------------------------------

local M = {}

local cpptools_path = "/home/farbod/.dotfiles/neovim/.config/nvim/bin/cpptools/"

M.adapters = {
  -- Via vscode-cpptools (see nvim-dap installation instructions)
  cppdbg = {
    type = "executable",
    command = cpptools_path .. "extension/debugAdapters/bin/OpenDebugAD7",
  },

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
  cpp = {
    {
      name = "Launch file",
      type = "cppdbg",
      request = "launch",
      program = function()
        return vim.fn.input(
          "Path to executable: ",
          vim.fn.getcwd() .. "/",
          "file"
        )
      end,
      args = function()
        local args_str = vim.fn.input("Args: ", "", "file")
        local args = {}
        for word in args_str:gmatch("%S+") do
          table.insert(args, word)
        end
        return args
      end,
      cwd = "${workspaceFolder}",
      stopOnEntry = true,
    },
  },

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
