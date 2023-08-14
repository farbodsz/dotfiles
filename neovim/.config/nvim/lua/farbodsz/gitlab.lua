--------------------------------------------------------------------------------
-- gitlab.nvim
--------------------------------------------------------------------------------

local nnoremap = require("farbodsz.utils.keymap").nnoremap
local gitlab = require("gitlab")

local M = {}

function M.setup()
  gitlab.setup({
    keymaps = {
      -- The popup for comment creation, editing, and replying
      popup = {
        exit = "q",
        perform_action = "<leader>w",
      },

      discussion_tree = {
        relative = "editor",
        position = "bottom",
        size = "20%",

        jump_to_location = "o",
        edit_comment = "e",
        delete_comment = "dd",
        reply_to_comment = "r",
        toggle_node = "<Enter>",
      },

      dialogue = {
        focus_next = { "j", "<Down>", "<Tab>" },
        focus_prev = { "k", "<Up>", "<S-Tab>" },
        close = { "<Esc>", "<C-c>" },
        submit = { "<CR>" },
      },
    },
  })

  nnoremap("<leader>Gr<space>", function()
    require("telescope").extensions.menu.gitlab({})
  end)
  vim.keymap.set("v", "<leader>Grc", function()
    gitlab.create_comment()
  end)
end

M.telescope_menu_items = {
  {
    "Summary",
    function()
      gitlab.summary()
    end,
  },
  {
    "Approve",
    function()
      gitlab.approve()
    end,
  },
  {
    "Revoke approval",
    function()
      gitlab.revoke()
    end,
  },
  {
    "List discussions",
    function()
      gitlab.list_discussions()
    end,
  },
  {
    "Add comment",
    function()
      gitlab.create_comment()
    end,
  },
  {
    "Edit comment",
    function()
      gitlab.edit_comment()
    end,
  },
  {
    "Delete comment",
    function()
      gitlab.delete_comment()
    end,
  },
  {
    "Reply to comment",
    function()
      gitlab.reply()
    end,
  },
}

return M
