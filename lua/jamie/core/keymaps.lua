vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- run lua code
keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file" })
keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Run current line" })
keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Run current selection" })

-- lazy.nvim
keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Open Lazy" }) -- open lazy

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
keymap.set("n", "<leader>sf", "<C-w>|", { desc = "Fullscreen current split" }) -- make split windows equal width & height
keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
keymap.set("n", "<leader>ss", "<C-w>x", { desc = "Swap window with next" }) -- swap window with next
keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

keymap.set("n", "<leader>gf", ":lua toggle_formatter()<CR>", { noremap = true, silent = true, desc = "Toggle formatter" })

-- terminal
keymap.set("n", "<leader>st", function()
  vim.cmd.vnew()
  vim.cmd.term()
  vim.cmd.wincmd("J")
  vim.api.nvim_win_set_height(0, 15)
end, { noremap = true, silent = true, desc = "Open small terminal" })
keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })

-- navigation
keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Scroll half page down & center cursor" })
keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Scroll half page up & center cursor" })

-- git
keymap.set("n", "<leader>gg", ":Git<CR>", { noremap = true, silent = true, desc = "Open Fugitive" })

-- oil
keymap.set("n", "<leader>-", ":Oil<CR>", { noremap = true, silent = true, desc = "Open Oil" })
