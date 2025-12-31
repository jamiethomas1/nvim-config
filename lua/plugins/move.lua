return {
  "matze/vim-move",
  config = function()
    vim.g.move_left_key = ""
    vim.g.move_right_key = ""

    vim.api.nvim_del_keymap("n", "<A-h>")
    vim.api.nvim_del_keymap("n", "<A-l>")
  end
}
