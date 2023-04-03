--------------------------------------------------------------------------------
-- refactoring.nvim configuration
--------------------------------------------------------------------------------

local refactoring = require("refactoring")
local M = {}

function M.setup()
  local config = {
    prompt_func_param_type = {},
    prompt_func_return_type = {},
  }

  -- Type prompts are disabled by default - enable them
  local languages = { "go", "cpp", "java" }
  for _, lang in ipairs(languages) do
    config.prompt_func_param_type[lang] = true
    config.prompt_func_return_type[lang] = true
  end

  refactoring.setup(config)
  -- Keymaps set up in refactoring.vim file
end

return M
