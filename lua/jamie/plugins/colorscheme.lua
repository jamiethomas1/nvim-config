return {
  -- "ellisonleao/gruvbox.nvim", 
  "luisiacc/gruvbox-baby",
  priority = 1000, -- load before all other plugins, default for plugins is 50
  config = function()
    -- vim.cmd([[colorscheme gruvbox]]) 
  vim.cmd([[colorscheme gruvbox-baby]])
  end,
}
