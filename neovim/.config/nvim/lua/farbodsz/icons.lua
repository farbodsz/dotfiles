local devicons = require("nvim-web-devicons")
local M = {}

function M.setup()
  devicons.setup({
    override = {
      [".ghci"] = {
        icon = "",
        color = "#a074c4",
        name = "GHCI",
      },
      ["decks"] = {
        icon = "",
        color = "#26A69A",
        name = "Decks",
      },
    },
  })
end

return M
