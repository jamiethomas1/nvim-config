vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2

vim.keymap.set(
  "n",
  "<leader>cl",
  "oconsole.log(\"\")<Esc>F\"i",
  { buffer = true }
)
