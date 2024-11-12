local utils = require("utils")

return {
  "kylechui/nvim-surround",
  enabled = not utils.is_vscode,
  version = "*", -- Use for stability; omit to use `main` branch for the latest features
  event = "VeryLazy",
  config = function()
    require("nvim-surround").setup({})
  end
}
