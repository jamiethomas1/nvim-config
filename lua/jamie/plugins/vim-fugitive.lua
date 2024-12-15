 local utils = require("utils")

 vim.api.nvim_create_autocmd("FileType", {
   pattern = "fugitive",
   callback = function()
     local opts = { buffer = true, silent = true }
     vim.keymap.set("n", "<Esc>", ":q<CR>", opts)
     vim.keymap.set("n", "q", ":q<CR>", opts)
   end,
 })

 if not utils.is_vscode then
   return {
     "tpope/vim-fugitive",
   }
 end

 return {}
