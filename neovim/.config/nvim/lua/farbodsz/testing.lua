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
      }),
    },

    icons = {
      passed = "✔",
      running = "⧖",
      failed = "✖",
      skipped = "S",
      unknown = "?",
    },

    output = {
      enabled = true,
      open_on_run = false,
    },
    quickfix = {
      enabled = false,
      open = false,
    },

    summary = {
      enabled = true,
      animated = true,
      follow = true,
      expand_errors = true,
      open = "botright vsplit | vertical resize 50",
      mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        expand_all = "e",
        output = "o",
        short = "O",
        attach = "a",
        jumpto = "i",
        stop = "u",
        run = "r",
        debug = "d",
        mark = "m",
        run_marked = "R",
        debug_marked = "D",
        clear_marked = "M",
        target = "t",
        clear_target = "T",
        next_failed = "J",
        prev_failed = "K",
      },
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
end

return M
