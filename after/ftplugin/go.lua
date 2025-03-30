vim.keymap.set(
  "n",
  "<leader>ee",
  "oif err != nil {<CR>}<Esc>Oreturn err<Esc>",
  { buffer = true }
)

vim.keymap.set(
  "n",
  "<leader>ef",
  "oif err != nil {<CR>}<Esc>Olog.Fatal(err)<Esc>j",
  { buffer = true }
)

vim.keymap.set(
  "n",
  "<leader>jt",
  function()
    local line = vim.api.nvim_get_current_line()
    local cursor = vim.api.nvim_win_get_cursor(0)

    -- Append the `json:""` text at the end of the line
    line = line .. ' `json:""`'
    vim.api.nvim_set_current_line(line)

    -- Move the cursor to the correct position inside the quotes
    vim.api.nvim_win_set_cursor(0, { cursor[1], #line - 2 })
    vim.cmd("startinsert")
  end,
  { buffer = true }
)

vim.keymap.set(
  "n",
  "<leader>cl",
  "ofmt.Println(\"\")<Esc>F\"i",
  { buffer = true }
)
