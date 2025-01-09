local utils = require("utils")

-- Previous colorschemes: 
-- "rebelot/kanagawa.nvim",
-- "catppuccin/nvim",
-- "rose-pine/neovim",

return {
  "rose-pine/neovim",
  enabled = not utils.is_vscode,
  priority = 1000, -- load before all other plugins, default for plugins is 50
  config = function ()
    require("rose-pine").setup({
      palette = {
        moon = {
          base = "#000000",
          overlay = "#1a1820",
        }
      }
    })
    vim.cmd([[colorscheme rose-pine-moon]])
  end
}
