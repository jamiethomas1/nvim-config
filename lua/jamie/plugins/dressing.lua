local utils = require("utils")

return {
  "stevearc/dressing.nvim",
  enabled = not utils.is_vscode,
  event = "VeryLazy",
}
