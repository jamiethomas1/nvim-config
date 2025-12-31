local colorschemes = {
    {
        "rose-pine/neovim",
        enabled = true,
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
}

return colorschemes[1]
