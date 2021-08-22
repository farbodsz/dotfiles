--------------------------------------------------------------------------------
-- diffview.nvim configuration
--------------------------------------------------------------------------------

local cb = require("diffview.config").diffview_callback

require("diffview").setup {
  diff_binaries = false,

  file_panel = {
    width = 40,
    use_icons = false 
  },

  key_bindings = {
    disable_defaults = false,
    file_panel = {
      ["<leader>t"] = cb("toggle_files")
    },
    view = {
      ["<c-j>"] = cb("select_next_entry"),
      ["<c-k>"] = cb("select_prev_entry"),
      ["<leader>t"] = cb("toggle_files")
    }
  }

}
