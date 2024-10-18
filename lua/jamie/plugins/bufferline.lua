return {
  "akinsho/bufferline.nvim",
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
