--------------------------------------------------------------------------------
-- File tree
--------------------------------------------------------------------------------

local tree = require("nvim-tree")
local tree_cb = require("nvim-tree.config").nvim_tree_callback

tree.setup({
  disable_netrw = false, -- netrw needed for :GBrowse

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

    mappings = {
      custom_only = false,
      list = {
        { key = { "<Tab>" }, cb = tree_cb("cd") },
        { key = { "<S-Tab>" }, cb = tree_cb("dir_up") },
      },
    },
  },
})

vim.g.nvim_tree_group_empty = 1
vim.g.nvim_tree_special_files = {}
