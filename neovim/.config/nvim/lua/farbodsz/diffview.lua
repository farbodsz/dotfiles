--------------------------------------------------------------------------------
-- diffview.nvim configuration
--------------------------------------------------------------------------------

local diffview = require("diffview")
local cb = require("diffview.config").diffview_callback

local M = {}

function M.setup()
  diffview.setup({
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
      win_config = {
        position = "bottom",
        height = 16,
      },
    },

    keymaps = {
      disable_defaults = true,
      file_panel = {
        ["<cr>"] = cb("select_entry"),
        ["k"] = cb("prev_entry"),
        ["j"] = cb("next_entry"),
        ["[f"] = cb("select_prev_entry"),
        ["]f"] = cb("select_next_entry"),
        ["<leader>t"] = cb("toggle_files"),
        ["gf"] = cb("goto_file"),
        ["<C-w>f"] = cb("goto_file_split"),
        ["<C-w><C-f>"] = cb("goto_file_split"),
        ["<C-w>gf"] = cb("goto_file_tab"),
        ["s"] = cb("toggle_stage_entry"),
        ["X"] = cb("restore_entry"),
        ["R"] = cb("refresh_files"),
        ["i"] = cb("listing_style"),
        [","] = cb("toggle_flatten_dirs"),
      },
      file_history_panel = {
        ["<cr>"] = cb("select_entry"),
        ["k"] = cb("prev_entry"),
        ["j"] = cb("next_entry"),
        ["[f"] = cb("select_prev_entry"),
        ["]f"] = cb("select_next_entry"),
        ["<leader>t"] = cb("toggle_files"),
        ["g?"] = cb("options"),
        ["zC"] = cb("close_all_folds"),
        ["zM"] = cb("close_all_folds"),
        ["zO"] = cb("open_all_folds"),
        ["zR"] = cb("open_all_folds"),
        ["<leader>gD"] = cb("open_in_diffview"),
        ["gf"] = cb("goto_file"),
        ["<C-w>f"] = cb("goto_file_split"),
        ["<C-w><C-f>"] = cb("goto_file_split"),
        ["<C-w>gf"] = cb("goto_file_tab"),
      },
      view = {
        ["[f"] = cb("select_prev_entry"),
        ["]f"] = cb("select_next_entry"),
        ["<leader>t"] = cb("toggle_files"),
        ["gf"] = cb("goto_file"),
        ["<C-w>f"] = cb("goto_file_split"),
        ["<C-w><C-f>"] = cb("goto_file_split"),
        ["<C-w>gf"] = cb("goto_file_tab"),
      },
      option_panel = {
        ["<cr>"] = cb("select"),
        ["q"] = cb("close"),
      },
    },
  })
end

return M
