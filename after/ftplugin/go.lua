vim.keymap.set(
  "n",
  "<leader>ee",
  "oif err != nil {<CR>}<Esc>Oreturn err<Esc>",
  { buffer = true }
)

vim.keymap.set(
  "n",
  "<leader>ef",
  "oif err != nil {<CR>}<Esc>Olog.Fatalf(\"\")<Esc>F\"i",
  { buffer = true }
)

vim.keymap.set(
  "n",
  "<leader>jt",
  "A `json:\"\"`<Esc>F\"i",
  { buffer = true }
)

vim.keymap.set(
  "n",
  "<leader>cl",
  "ofmt.Println(\"\")<Esc>F\"i",
  { buffer = true }
)
