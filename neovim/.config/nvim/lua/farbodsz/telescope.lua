--------------------------------------------------------------------------------
-- telescope configuration
--------------------------------------------------------------------------------
local M = {}

local actions = require("telescope.actions")

require("telescope").setup {
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,

    mappings = {
      i = {
        -- Esc or <C-c> closes telescope instead of going into normal mode
        ["<c-c>"] = actions.close,
        ["<esc>"] = actions.close,

        -- Navigating results
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-j>"] = actions.move_selection_next,
      }
    },

    pickers = {
      find_files = {
        find_command = {
          "rg",
          "--files",
          "--hidden",
        },
      }
    },

    vimgrep_arguments = {
      "rg",
      "--with-filename",
      "--hidden",
      "--line-number",
      "--column",
      "--smart-case",
    }
  },

  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require("telescope").load_extension("fzy_native")


M.search_dotfiles = function()
  require("telescope.builtin").find_files({
    prompt_title = "Dotfiles",
    cwd = "~/.dotfiles",
    hidden = true,
  })
end

M.search_home = function()
  require("telescope.builtin").find_files({
    prompt_title = "Home",
    cwd = "~/",
    hidden = true,
  })
end

return M
