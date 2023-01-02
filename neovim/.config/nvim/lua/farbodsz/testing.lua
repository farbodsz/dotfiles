--------------------------------------------------------------------------------
-- Neotest configuration
--------------------------------------------------------------------------------

local neotest = require("neotest")

local keymap_prefix = "<leader>t"

local M = {}

local function nnoremap(...)
  vim.keymap.set("n", ...)
end

---@class Keymap
---@field suffix string
---@field action function

---@param table Keymap
local function setup_keymaps(table)
  for key, value in pairs(table) do
    nnoremap(keymap_prefix .. key, function()
      value()
    end)
  end
end

function M.setup()
  neotest.setup({
    adapters = {
      require("neotest-python")({
        runner = "pytest",
        python = "venv/bin/python",
      }),
    },
    icons = {
      passed = "✔",
      running = "⧖",
      failed = "✖",
      skipped = "S",
      unknown = "?",
    },
  })

  setup_keymaps({
    ["t"] = function()
      neotest.run.run()
    end,
    ["f"] = function()
      neotest.run.run(vim.fn.expand("%"))
    end,
    ["q"] = function()
      neotest.run.stop()
    end,
    ["o"] = function()
      neotest.output.open()
    end,
    ["O"] = function()
      neotest.output_panel.toggle()
    end,
    ["a"] = function()
      neotest.summary.toggle()
    end,
  })

  -- Dark background
  vim.api.nvim_create_autocmd("FileType", {
    pattern = "neotest-summary",
    callback = function()
      vim.cmd("set winhighlight=Normal:NeotestNormal")
    end,
  })
end

return M
