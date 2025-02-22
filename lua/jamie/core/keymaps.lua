vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

---------------------
-- General Keymaps -------------------

vim.keymap.set("n", "<leader>q", ":quit<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>Q", ":qall<CR>", { desc = "Close all buffers" })
vim.keymap.set("n", "<leader>w", ":write<CR>", { desc = "Write buffer" })
vim.keymap.set("n", "<leader>W", ":wall<CR>", { desc = "Write all buffers" })

-- run lua code
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Run current line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Run current selection" })

-- lazy.nvim
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Open Lazy" }) -- open lazy

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

-- window management
-- vim.keymap.set("n", "<leader>sv", "<C-w>v", { desc = "Split window vertically" }) -- split window vertically
-- vim.keymap.set("n", "<leader>sh", "<C-w>s", { desc = "Split window horizontally" }) -- split window horizontally
-- vim.keymap.set("n", "<leader>sf", "<C-w>|", { desc = "Fullscreen current split" }) -- make split windows equal width & height
-- vim.keymap.set("n", "<leader>se", "<C-w>=", { desc = "Make splits equal size" }) -- make split windows equal width & height
-- vim.keymap.set("n", "<leader>ss", "<C-w>x", { desc = "Swap window with next" }) -- swap window with next
-- vim.keymap.set("n", "<leader>sx", "<cmd>close<CR>", { desc = "Close current split" }) -- close current split window

vim.keymap.set("n", "<leader>to", "<cmd>tabnew<CR>", { desc = "Open new tab" }) -- open new tab
vim.keymap.set("n", "<leader>tx", "<cmd>tabclose<CR>", { desc = "Close current tab" }) -- close current tab
vim.keymap.set("n", "<leader>tn", "<cmd>tabn<CR>", { desc = "Go to next tab" }) --  go to next tab
vim.keymap.set("n", "<leader>tp", "<cmd>tabp<CR>", { desc = "Go to previous tab" }) --  go to previous tab
vim.keymap.set("n", "<leader>tf", "<cmd>tabnew %<CR>", { desc = "Open current buffer in new tab" }) --  move current buffer to new tab

-- formatting
vim.keymap.set("n", "<leader>gf", ":lua toggle_formatter()<CR>", { noremap = true, silent = true, desc = "Toggle formatter" })

-- terminal
-- vim.keymap.set("n", "<leader>st", function()
--   vim.cmd.vnew()
--   vim.cmd.term()
--   vim.cmd.wincmd("J")
--   vim.api.nvim_win_set_height(0, 15)
-- end, { noremap = true, silent = true, desc = "Open small terminal" })

vim.keymap.set("t", "<Esc>", "<C-\\><C-n>", { noremap = true, silent = true, desc = "Exit terminal mode" })

-- navigation
vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Scroll half page down & center cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Scroll half page up & center cursor" })

-- git
vim.keymap.set("n", "<leader>gg", ":Git<CR>", { noremap = true, silent = true, desc = "Open Fugitive" })

-- oil
vim.keymap.set("n", "<leader>-", ":Oil<CR>", { noremap = true, silent = true, desc = "Open Oil" })

-- quickfix list
vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")

-- substitute word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- retain position in paragraph after indenting
vim.keymap.set("n", "=ap", "ma=ap'a")

-- launch tmux-sessionizer
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/bin/.local/scripts/tmux-sessionizer.sh<CR>")
