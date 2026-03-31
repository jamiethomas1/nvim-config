local colorschemes = {
    -- {
    --     "rose-pine/neovim",
    --     enabled = true,
    --     priority = 1000, -- load before all other plugins, default for plugins is 50
    --     config = function ()
    --         require("rose-pine").setup({
    --             palette = {
    --                 moon = {
    --                     base = "#000000",
    --                     overlay = "#1a1820",
    --                 }
    --             },
    --             highlight_groups = {
    --                 TelescopeBorder = { fg = "highlight_high", bg = "none" },
    --                 TelescopeNormal = { bg = "none" },
    --                 TelescopePromptNormal = { bg = "base" },
    --                 TelescopeResultsNormal = { fg = "subtle", bg = "base" },
    --                 TelescopeSelection = { fg = "text", bg = "base" },
    --                 NormalFloat = { bg = "base" },
    --                 FloatBorder = { fg = "highlight_high", bg = "none" },
    --             }
    --         })
    --         vim.cmd([[colorscheme rose-pine-moon]])
    --     end
    -- },
    {
        "catppuccin/nvim",
        enabled = true,
        priority = 1000,
        name = "catppuccin",
        config = function ()
            ---@ type CatppuccinOptions catppuccin_options
            local catppuccin_options = {
                term_colors = false,
                flavour = "mocha",
                highlight_overrides = {
                    ---@ type CtpHighlightOverrideFn mocha
                    mocha = function (colors)
                        return {
                            Cursor = { fg = colors.crust, bg = colors.rosewater },
                        }
                    end
                }
            }

            require("catppuccin").setup(catppuccin_options)

            vim.cmd([[colorscheme catppuccin-mocha]])
        end
    }
}

return colorschemes[1]
