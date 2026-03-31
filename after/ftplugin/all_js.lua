vim.opt_local.tabstop = 4
vim.opt_local.shiftwidth = 4

-- run formatter (prettier / biome / oxfmt) on current buffer - same for all filetypes
-- just run the command `npm run format` in the project root.
-- if `pnpm format` is available, use that instead.
vim.keymap.set(
    "n",
    "<leader>gf",
    function ()
        local format_cmd = "npm run format"
        if vim.fn.executable("pnpm") == 1 then
            format_cmd = "pnpm format"
        end
        vim.cmd("silent !" .. format_cmd)
        vim.cmd("edit!")
    end,
    { desc = "Format current buffer" }
)
