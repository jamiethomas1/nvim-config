local utils = require("utils")

return {
  "catppuccin/nvim",
  enabled = not utils.is_vscode,
  priority = 1000, -- load before all other plugins, default for plugins is 50
  config = function ()
    vim.cmd([[colorscheme catppuccin-mocha]])
  end
}
