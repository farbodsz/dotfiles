--------------------------------------------------------------------------------
-- telescope configuration
--------------------------------------------------------------------------------

local M = {}

local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

M.setup = function()
  require("telescope").setup({
    defaults = {
      layout_config = {
        prompt_position = "top",
      },
      sorting_strategy = "ascending",

      mappings = {
        i = {
          -- Esc or <C-c> closes telescope instead of going into normal mode
          ["<C-c>"] = actions.close,
          ["<Esc>"] = actions.close,

          -- Navigating results
          ["<C-k>"] = actions.move_selection_previous,
          ["<C-j>"] = actions.move_selection_next,

          -- Quickfix list
          ["<C-q>"] = actions.send_selected_to_qflist,
          ["<C-a>"] = actions.send_to_qflist,

          -- Opening result
          ["<C-s>"] = actions.select_horizontal,
        },
      },
    },

    extensions = {
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "smart_case",
      },

      project = {
        base_dirs = {
          -- Include all git repos under home
          "~",
        },
      },
    },
  })

  require("telescope").load_extension("fzf")
  require("telescope").load_extension("project")
  require("telescope").load_extension("refactoring")
end

local opts_find_command = {
  "rg",
  "--files",
  "--hidden",
  "-g",
  "!{.git,.cache,node_modules}",
}

local opts_vimgrep_args = {
  "rg",
  "--color=never",
  "--no-heading",
  "--with-filename",
  "--line-number",
  "--column",
  "--smart-case",
  "--hidden",
  "-g",
  "!{.git,.cache,node_modules}",
}

M.find_files = function()
  builtin.find_files({ find_command = opts_find_command })
end

M.live_grep = function()
  builtin.live_grep({ vimgrep_arguments = opts_vimgrep_args })
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
