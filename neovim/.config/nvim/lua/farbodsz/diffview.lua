--------------------------------------------------------------------------------
-- diffview.nvim configuration
--------------------------------------------------------------------------------

local diffview = require("diffview")
local actions = require("diffview.actions")

local M = {}

function M.setup()
  diffview.setup({
    git_cmd = { vim.env.HOME .. "/.local/bin/git" },

    diff_binaries = false,
    enhanced_diff_hl = true,
    use_icons = true,

    default_args = {
      DiffviewOpen = {},
      DiffviewFileHistory = {},
    },

    file_panel = {
      listing_style = "tree",
      tree_options = {
        flatten_dirs = true,
        folder_statuses = "only_folded",
      },
      win_config = {
        position = "left",
        width = 40,
      },
    },

    file_history_panel = {
      log_options = {
        git = {
          single_file = {
            follow = true,
          },
        },
      },
      win_config = {
        position = "bottom",
        height = 16,
      },
    },

    keymaps = {
      disable_defaults = true,
      file_panel = {
        ["<cr>"] = actions.select_entry,
        ["k"] = actions.prev_entry,
        ["j"] = actions.next_entry,
        ["[f"] = actions.select_prev_entry,
        ["]f"] = actions.select_next_entry,
        ["<leader>t"] = actions.toggle_files,
        ["gf"] = actions.goto_file,
        ["<C-w>f"] = actions.goto_file_split,
        ["<C-w><C-f>"] = actions.goto_file_split,
        ["<C-w>gf"] = actions.goto_file_tab,
        ["u"] = actions.toggle_stage_entry,
        ["s"] = actions.toggle_stage_entry,
        ["X"] = actions.restore_entry,
        ["R"] = actions.refresh_files,
        ["i"] = actions.listing_style,
        [","] = actions.toggle_flatten_dirs,
      },
      file_history_panel = {
        ["<cr>"] = actions.select_entry,
        ["k"] = actions.prev_entry,
        ["j"] = actions.next_entry,
        ["[f"] = actions.select_prev_entry,
        ["]f"] = actions.select_next_entry,
        ["<leader>t"] = actions.toggle_files,
        ["g?"] = actions.options,
        ["zC"] = actions.close_all_folds,
        ["zM"] = actions.close_all_folds,
        ["zO"] = actions.open_all_folds,
        ["zR"] = actions.open_all_folds,
        ["<leader>gD"] = actions.open_in_diffview,
        ["gf"] = actions.goto_file,
        ["<C-w>f"] = actions.goto_file_split,
        ["<C-w><C-f>"] = actions.goto_file_split,
        ["<C-w>gf"] = actions.goto_file_tab,
      },
      view = {
        ["[f"] = actions.select_prev_entry,
        ["]f"] = actions.select_next_entry,
        ["<leader>t"] = actions.toggle_files,
        ["gf"] = actions.goto_file,
        ["<C-w>f"] = actions.goto_file_split,
        ["<C-w><C-f>"] = actions.goto_file_split,
        ["<C-w>gf"] = actions.goto_file_tab,
      },
      option_panel = {
        ["<cr>"] = actions.select_entry,
        ["q"] = actions.close,
      },
    },
  })
end

return M
