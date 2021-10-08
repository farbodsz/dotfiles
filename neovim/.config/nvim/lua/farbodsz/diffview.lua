--------------------------------------------------------------------------------
-- diffview.nvim configuration
--------------------------------------------------------------------------------

local cb = require("diffview.config").diffview_callback

require("diffview").setup({
  diff_binaries = false,
  use_icons = true,

  file_panel = {
    position = "left",
    width = 40,
    listing_style = "tree",
    tree_options = {
      folder_statuses = "only_folded",
    },
  },

  file_history_panel = {
    position = "bottom",
    height = 16,
    log_options = {
      follow = true,
    },
  },

  key_bindings = {
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
