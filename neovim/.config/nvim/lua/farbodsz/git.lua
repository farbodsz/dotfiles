--------------------------------------------------------------------------------
-- git configuration
--------------------------------------------------------------------------------

local M = {}

local actions = require("telescope.actions")
local action_state = require("telescope.actions.state")
local builtin = require("telescope.builtin")
local utils = require("telescope.utils")

local open_compare = function(value_base)
  local selected_entry = action_state.get_selected_entry()
  local value_against = selected_entry["value"]

  -- close Telescope window before switching windows
  vim.api.nvim_win_close(0, true)

  local cmd = "DiffviewOpen --untracked-files=false "
    .. value_base
    .. ".."
    .. value_against

  vim.cmd(":stopinsert")
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
      map("i", "<cr>", function()
        open_compare(value_base)
      end)
      return true
    end,

    prompt_title = "Compare " .. compare_type .. " against",
  })
end

M.git_compare = function(show_commits)
  local git_function, compare_type = git_function_and_text(show_commits)

  git_function({
    attach_mappings = function(_, map)
      map("i", "<cr>", function()
        git_compare_against(show_commits)
      end)
      return true
    end,

    prompt_title = "Compare: base " .. compare_type,
  })
end

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

local drop_stash = function(prompt_bufnr)
  local cwd = action_state.get_current_picker(prompt_bufnr).cwd
  local selection = action_state.get_selected_entry()

  local confirmation = vim.fn.input(
    "Do you really wanna drop stash " .. selection.value .. "? [Y/n] "
  )
  if confirmation ~= "" and string.lower(confirmation) ~= "y" then
    return
  end

  actions.close(prompt_bufnr)

  local _, ret, stderr = utils.get_os_command_output(
    { "git", "stash", "drop", selection.value },
    cwd
  )
  if ret == 0 then
    print("Dropped stash: " .. selection.value)
  else
    print(
      string.format(
        'Error when dropping stash: %s. Git returned: "%s',
        selection.value,
        table.concat(stderr, " ")
      )
    )
  end
end

M.git_stash = function()
  builtin.git_stash({
    attach_mappings = function(_, map)
      map("i", "<c-a>", function()
        vim.api.nvim_win_close(0, true)
        vim.cmd(":stopinsert")
        vim.cmd(":G stash")
      end)

      map("i", "<c-d>", drop_stash)
      return true
    end,
  })
end

return M
