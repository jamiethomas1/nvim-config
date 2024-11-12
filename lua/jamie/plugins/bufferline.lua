local utils = require("utils")

return {
  "akinsho/bufferline.nvim",
  enabled = not utils.is_vscode,
  version = "*",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  opts = {
    options = {
      mode = "tabs",
      separator_style = "thin",
    },
    highlights = {
      buffer_selected = {
        italic = false,
      }
    }
  }
}
