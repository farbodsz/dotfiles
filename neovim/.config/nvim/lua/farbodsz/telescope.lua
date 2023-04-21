--------------------------------------------------------------------------------
-- telescope configuration
--------------------------------------------------------------------------------

local M = {}

local telescope = require("telescope")
local actions = require("telescope.actions")
local builtin = require("telescope.builtin")

local browser_actions = require("telescope").extensions.file_browser.actions

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

M.setup = function()
  telescope.setup({
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
      file_browser = {
        hijack_netrw = false,
        mappings = {
          ["i"] = {
            ["<C-a>"] = browser_actions.create,
            ["<C-d>"] = browser_actions.remove,
            ["<C-r>"] = browser_actions.rename,
            ["<C-o>"] = browser_actions.open,
          },
          ["n"] = {
            ["<leader>rn"] = browser_actions.rename,
            ["dd"] = browser_actions.remove,
            ["cc"] = browser_actions.move,
            ["yy"] = browser_actions.copy,
            ["<C-o>"] = browser_actions.open,
          },
        },
      },

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

          -- Include all git repos under apps dir at work
          vim.fn.getenv("APPS_HOME"),
        },
      },
    },
  })

  telescope.load_extension("file_browser")
  telescope.load_extension("fzf")
  telescope.load_extension("harpoon")
  telescope.load_extension("project")
  telescope.load_extension("refactoring")
end

M.find_files = function()
  builtin.find_files({ find_command = opts_find_command })
end

---Returns the start/end position of the current visual selection.
---@return integer,integer,integer,integer
local function visual_selection_range()
  local _, start_row, start_col, _ = unpack(vim.fn.getpos("'<"))
  local _, end_row, end_col, _ = unpack(vim.fn.getpos("'>"))
  if start_row < end_row or (start_row == end_row and start_col <= end_col) then
    return start_row - 1, start_col, end_row, end_col
  else
    return end_row - 1, end_col, start_row, start_col
  end
end

local function get_selection_text(start_row, start_col, end_row, end_col)
  local lines = vim.api.nvim_buf_get_lines(0, start_row, end_row, false)
  for i, line in ipairs(lines) do
    local sub_start, sub_end = 1, string.len(line)
    if i == 1 and start_col then
      sub_start = start_col
    end
    if lines[i + 1] == nil and end_col then
      sub_end = end_col
    end
    lines[i] = string.sub(line, sub_start, sub_end)
  end
  return table.concat(lines, " ")
end

M.live_grep = function()
  builtin.live_grep({ vimgrep_arguments = opts_vimgrep_args })
end

M.live_grep_visual = function()
  local startr, startc, endr, endc = visual_selection_range()
  builtin.live_grep({
    default_text = get_selection_text(startr, startc, endr, endc),
    vimgrep_arguments = opts_vimgrep_args,
  })
end

M.search_dotfiles = function()
  builtin.find_files({
    find_command = opts_find_command,
    prompt_title = "Dotfiles",
    cwd = vim.env.DOTFILES,
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
