return {
  "catppuccin/nvim",
  priority = 1000, -- load before all other plugins, default for plugins is 50
  config = function ()
    vim.cmd([[colorscheme catppuccin-mocha]])
  end
}
