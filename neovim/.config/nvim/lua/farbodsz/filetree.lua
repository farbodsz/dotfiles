--------------------------------------------------------------------------------
-- File tree
--------------------------------------------------------------------------------

local M = {}

function M.setup()
  require("nvim-tree").setup({
    disable_netrw = false, -- netrw needed for :GBrowse

    open_on_setup = false,
    hijack_cursor = true, -- force cursor at start of filename in tree

    diagnostics = {
      enable = true,
      icons = { hint = "", info = "", warning = "", error = "" },
    },

    update_cwd = true,
    update_focused_file = {
      enable = true, -- un-collapse folders recursively until it finds this file
    },

    -- Required for dirbuf.nvim
    hijack_directories = { enable = false },

    renderer = {
      group_empty = true,
      special_files = {},
    },

    view = {
      width = 36,
      side = "left",

      mappings = {
        custom_only = false,
        list = {
          { key = { "<Tab>" }, action = "cd" },
          { key = { "<S-Tab>" }, action = "dir_up" },
        },
      },
    },
  })
end

return M
