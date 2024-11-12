local utils = require("utils")

return {
  "folke/which-key.nvim",
  enabled = not utils.is_vscode,
  event = "VeryLazy",
  init = function()
    vim.o.timeout = true
    vim.o.timeoutlen = 300
  end,
  config = true
}
