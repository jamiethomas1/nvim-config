return {
    "folke/snacks.nvim",
    ---@type snacks.Config
    opts = {
        ---@type snacks.picker.Config
        picker = {
            ui_select = true,
        },
        terminal = { enabled = true },
        git = { enabled = true },
    },
}
