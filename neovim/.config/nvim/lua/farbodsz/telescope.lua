--------------------------------------------------------------------------------
-- telescope configuration
--------------------------------------------------------------------------------

local M = {}

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

require("telescope").setup {
  defaults = {
    file_sorter = require("telescope.sorters").get_fzy_sorter,

    layout_config = {
      prompt_position = "top"
    },
    sorting_strategy = "ascending",

    mappings = {
      i = {
        -- Esc or <C-c> closes telescope instead of going into normal mode
        ["<c-c>"] = actions.close,
        ["<esc>"] = actions.close,

        -- Navigating results
        ["<c-k>"] = actions.move_selection_previous,
        ["<c-j>"] = actions.move_selection_next,
        
        -- Quickfix list
        ["<c-q>"] = actions.send_selected_to_qflist,
        ["<c-Q>"] = actions.send_to_qflist,
      }
    },
  },

  extensions = {
    fzy_native = {
      override_generic_sorter = false,
      override_file_sorter = true,
    }
  }
}

require("telescope").load_extension("fzy_native")


local opts_find_command = {
  "rg",
  "--files",
  "--hidden",
  "-g",
  "!{.git,.cache,node_modules}",
}

local opts_vimgrep_args = {
  "rg",
  "--column",
  "--no-heading",
  "--line-number",
  "--color=always",
  "--hidden",
  "-g",
  "!{.git,.cache,node_modules}",
}

M.find_files = function()
  builtin.find_files({find_command = opts_find_command})
end

M.live_grep = function()
  builtin.live_grep({vimgrep_arguments = opts_vimgrep_args})
end

M.search_dotfiles = function()
  builtin.find_files({
    find_command = opts_find_command,
    prompt_title = "Dotfiles",
    cwd = "~/.dotfiles",
  })
end

M.search_home = function()
  builtin.find_files({
    find_command = opts_find_command,
    prompt_title = "Home",
    cwd = "~/",
  })
end

return M
