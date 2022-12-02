--------------------------------------------------------------------------------
-- Git configuration
--------------------------------------------------------------------------------

local M = {}

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local builtin = require("telescope.builtin")

--------------------------------------------------------------------------------
-- Git comparison (custom actions)
--------------------------------------------------------------------------------

---@class CompareOpts
---@field compare_type string
---@field telescope_preview function
---@field compare_action function

--- Second Telescope popup: compare base against ...
---@param opts CompareOpts
local telescope_compare_against = function(opts)
  local selected_base = action_state.get_selected_entry()
  local value_base = selected_base["value"]

  -- close Telescope window before switching windows
  vim.api.nvim_win_close(0, true)

  opts.telescope_preview({
    attach_mappings = function(_, map)
      map("i", "<cr>", function()
        local selected_against = action_state.get_selected_entry()
        local value_against = selected_against["value"]

        -- Close Telescope window before switching windows
        vim.api.nvim_win_close(0, true)

        -- Run action and close insert mode
        local cmd = opts.compare_action(value_base, value_against)
        vim.cmd(":stopinsert")
        vim.cmd(cmd)
      end)
      return true
    end,
    prompt_title = "Compare " .. opts.compare_type .. " against",
  })
end

--- First Telescope popup: compare base ...
---@param opts CompareOpts
M.git_compare = function(opts)
  opts.telescope_preview({
    attach_mappings = function(_, map)
      map("i", "<cr>", function()
        telescope_compare_against(opts)
      end)
      return true
    end,
    prompt_title = "Compare: base " .. opts.compare_type,
  })
end

--------------------------------------------------------------------------------

local open_git_diff_cmd = function(value_base, value_against)
  return "DiffviewOpen --untracked-files=false "
    .. value_base
    .. ".."
    .. value_against
end

M.git_compare_branches = function()
  return M.git_compare({
    compare_type = "branch",
    telescope_preview = builtin.git_branches,
    compare_action = open_git_diff_cmd,
  })
end

M.git_compare_commits = function()
  M.git_compare({
    compare_type = "commit",
    telescope_preview = builtin.git_commits,
    compare_action = open_git_diff_cmd,
  })
end

local open_git_log_cmd = function(value_base, value_against)
  return "belowright Flogsplit -- " .. value_base .. ".." .. value_against
end

M.git_compare_commit_logs = function()
  M.git_compare({
    compare_type = "branch",
    telescope_preview = builtin.git_branches,
    compare_action = open_git_log_cmd,
  })
end

--------------------------------------------------------------------------------
-- Git branches and commits
--------------------------------------------------------------------------------

local open_diff_branch = function()
  local selected_entry = action_state.get_selected_entry()
  local value = selected_entry["value"]

  -- close Telescope window before switching windows
  vim.api.nvim_win_close(0, true)

  local cmd = "DiffviewOpen --untracked-files=false HEAD.." .. value
  vim.cmd(":stopinsert")
  vim.cmd(cmd)
end

M.git_branches = function()
  builtin.git_branches({
    attach_mappings = function(_, map)
      map("i", "<c-o>", open_diff_branch)
      return true
    end,
  })
end

local open_diff = function()
  local selected_entry = action_state.get_selected_entry()
  local value = selected_entry["value"]

  -- close Telescope window before switching windows
  vim.api.nvim_win_close(0, true)

  local cmd = "DiffviewOpen --untracked-files=false " .. value .. "^!"
  vim.cmd(":stopinsert")
  vim.cmd(cmd)
end

M.git_commits = function()
  builtin.git_commits({
    attach_mappings = function(_, map)
      map("i", "<c-o>", open_diff)
      return true
    end,
  })
end

--------------------------------------------------------------------------------
-- Git stash
--------------------------------------------------------------------------------

local drop_stash = function(prompt_bufnr)
  local selection = action_state.get_selected_entry()
  local confirmation = vim.fn.input(
    "Do you really wanna drop stash " .. selection.value .. "? [Y/n] "
  )
  if confirmation ~= "" and string.lower(confirmation) ~= "y" then
    return
  end

  actions.close(prompt_bufnr)
  vim.cmd(":G stash drop " .. selection.value)
end

local push_stash = function(prompt_bufnr)
  local stash_name = action_state.get_current_line()

  local extra_args = {}
  if stash_name then
    extra_args = { "push", "--message", "'" .. stash_name .. "'" }
  end

  actions.close(prompt_bufnr)
  vim.cmd(":G stash " .. table.concat(extra_args, " "))
end

M.git_stash = function()
  builtin.git_stash({
    attach_mappings = function(_, map)
      map("i", "<c-a>", push_stash)
      map("n", "<c-a>", push_stash)

      map("i", "<c-d>", drop_stash)
      map("n", "<c-d>", drop_stash)

      return true
    end,
  })
end

return M
