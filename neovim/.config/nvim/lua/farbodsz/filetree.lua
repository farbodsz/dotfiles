--------------------------------------------------------------------------------
-- File tree
--------------------------------------------------------------------------------

require("nvim-tree").setup({
  open_on_setup = false,
  auto_close = false, -- auto-close nvim when tree is last window
  hijack_cursor = true, -- force cursor at start of filename in tree

  diagnostics = {
    enable = true,
    icons = { hint = "", info = "", warning = "", error = "" },
  },

  update_cwd = true,
  update_focused_file = {
    enable = true, -- un-collapse folders recursively until it finds this file
  },

  view = {
    width = 30,
    side = "left",
  },
})
