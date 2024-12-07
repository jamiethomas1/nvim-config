vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

local keymap = vim.keymap -- for conciseness

---------------------
-- General Keymaps -------------------

-- lazy.nvim
keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Open Lazy" }) -- open lazy

-- clear search highlights
keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- increment/decrement numbers
keymap.set("n", "<leader>+", "<C-a>", { desc = "Increment number" }) -- increment
keymap.set("n", "<leader>-", "<C-x>", { desc = "Decrement number" }) -- decrement

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

keymap.set("n", "<F12>", ":FloatermToggle<CR>", { desc = "Open floating terminal" })
keymap.set("t", "<F12>", "<C-\\><C-n>:FloatermToggle<CR>", { desc = "Close floating terminal" })

-- navigation
keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Scroll half page down & center cursor" })
keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Scroll half page up & center cursor" })

-- git
keymap.set("n", "<leader>gg", ":Git<CR>", { noremap = true, silent = true, desc = "Open Fugitive" })
