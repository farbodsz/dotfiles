--------------------------------------------------------------------------------
-- git configuration
--------------------------------------------------------------------------------

local M = {}


local action_state = require("telescope.actions.state")
local builtin = require("telescope.builtin")


local open_compare = function(value_base)
  local selected_entry = action_state.get_selected_entry()
  local value_against = selected_entry["value"]
  
  -- close Telescope window before switching windows
  vim.api.nvim_win_close(0, true)
  
  local cmd = 'DiffviewOpen --untracked-files=false ' 
    .. value_against 
    .. '..'
    .. value_base

  vim.cmd(cmd)
end


local git_function_and_text = function(is_commits)
  if is_commits then 
    return builtin.git_commits, "commit"
  else 
    return builtin.git_branches, "branch"
  end
end


local git_compare_against = function(show_commits)
  local selected_entry = action_state.get_selected_entry()
  local value_base = selected_entry["value"]
  
  -- close Telescope window before switching windows
  vim.api.nvim_win_close(0, true)

  local git_function, compare_type = git_function_and_text(show_commits)

  git_function({
    attach_mappings = function(_, map)
      map('i', '<cr>', function()
        open_compare(value_base)
      end)
      return true
    end,

    prompt_title = "Compare " .. compare_type .. " against"
  })
end


M.git_compare = function(show_commits)
  local git_function, compare_type = git_function_and_text(show_commits)

  git_function({
    attach_mappings = function(_, map)
      map('i', '<cr>', function()
        git_compare_against(show_commits)
      end)
      return true
    end,

    prompt_title = "Compare: base " .. compare_type
  })
end


local open_diff = function()
  local selected_entry = action_state.get_selected_entry()["value"]
  local value = selected_entry["value"]
  
  -- close Telescope window before switching windows
  vim.api.nvim_win_close(0, true)
  
  local cmd = 'DiffviewOpen --untracked-files=false ' 
    .. value
    .. '~1..'
    .. value

  vim.cmd(cmd)
end


M.git_branches = function()
  builtin.git_branches({
    attach_mappings = function(_, map)
      map('i', '<c-o>', open_diff)
      return true
    end
  })
end

M.git_commits = function()
  builtin.git_commits({
    attach_mappings = function(_, map)
      map('i', '<c-o>', open_diff)
      return true
    end
  })
end


return M
