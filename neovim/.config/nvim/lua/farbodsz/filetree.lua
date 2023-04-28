--------------------------------------------------------------------------------
-- File tree
--------------------------------------------------------------------------------

local nvim_tree = require("nvim-tree")
local api = require("nvim-tree.api")

local M = {}

function M.setup()
  nvim_tree.setup({
    disable_netrw = false, -- netrw needed for :GBrowse
    hijack_cursor = true, -- force cursor at start of filename in tree

    diagnostics = {
      enable = true,
      icons = { hint = "", info = "", warning = "", error = "" },
    },

    update_cwd = true,
    update_focused_file = {
      enable = true, -- un-collapse folders recursively until it finds this file
    },

    renderer = {
      group_empty = true,
      special_files = {},
    },

    view = {
      width = 36,
      side = "left",
    },

    on_attach = function(bufnr)
      local opts =
        { buffer = bufnr, noremap = true, silent = true, nowait = true }

      api.config.mappings.default_on_attach(bufnr)
      vim.keymap.set("n", "<Tab>", api.tree.change_root_to_node, opts)
      vim.keymap.set("n", "<S-Tab>", api.tree.change_root_to_parent, opts)
    end,
  })
end

return M
