local utils = require("utils")

-- Previous colorschemes: 
-- "rebelot/kanagawa.nvim",
-- "catppuccin/nvim",
-- "rose-pine/neovim",

local colorschemes = {
  {
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
        },
        highlight_groups = {
          TelescopeBorder = { fg = "highlight_high", bg = "none" },
          TelescopeNormal = { bg = "none" },
          TelescopePromptNormal = { bg = "base" },
          TelescopeResultsNormal = { fg = "subtle", bg = "base" },
          TelescopeSelection = { fg = "text", bg = "base" },
          NormalFloat = { bg = "base" },
          FloatBorder = { fg = "highlight_high", bg = "none" },
        }
      })
      vim.cmd([[colorscheme rose-pine-moon]])
    end
  },
  {
    "catppuccin/nvim",
    enabled = not utils.is_vscode,
    priority = 1000, -- load before all other plugins, default for plugins is 50
    config = function ()
      require("catppuccin").setup({
        color_overrides = {
          all = {
            base = "#000000",
            mantle = "#000000",
            crust = "#000000",
          },
        },
        custom_highlights = {
          Cursor = { fg = "#000000", bg = "#56526E" },
        }
      })
      vim.cmd([[colorscheme catppuccin-mocha]])
    end
  },
  {
    "rebelot/kanagawa.nvim",
    enabled = not utils.is_vscode,
    priority = 1000, -- load before all other plugins, default for plugins is 50
    config = function ()
      require("kanagawa").setup({
        transparent = true,
        colors = {
          theme = {
            all = {
              ui = {
                bg_gutter = "none",
              },
            },
          },
        },
        overrides = function(colors)
          return {
            Cursor = { fg = colors.base, bg = "#56526E" }
          }
        end
      })
      vim.cmd([[colorscheme kanagawa-wave]])
    end
  },
  {
    "neanias/everforest-nvim",
    enabled = not utils.is_vscode,
    priority = 1000, -- load before all other plugins, default for plugins is 50
    config = function ()
      require("everforest").setup({
        transparent_background_level = 2,
        background = "soft",
        italics = true,
      })
      vim.cmd([[colorscheme everforest]])
    end
  },
}

return colorschemes[1]
