vim.g.mapleader = " " -- Make sure to set `mapleader` before lazy so your mappings are correct
vim.g.maplocalleader = "\\" -- Same for `maplocalleader`

---------------------
-- General Keymaps -------------------

vim.keymap.set("n", "<leader>q", ":quit<CR>", { desc = "Close buffer" })
vim.keymap.set("n", "<leader>Q", ":qall<CR>", { desc = "Close all buffers" })
vim.keymap.set("n", "<leader>w", ":write<CR>", { desc = "Write buffer" })
vim.keymap.set("n", "<leader>W", ":wall<CR>", { desc = "Write all buffers" })

vim.keymap.set("n", "<leader>-", ":Oil<CR>", { desc = "Open Oil" })

vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww ~/bin/.local/scripts/tmux-sessionizer.sh<CR>")

-- run lua code
vim.keymap.set("n", "<leader><leader>x", "<cmd>source %<CR>", { desc = "Source current file" })
vim.keymap.set("n", "<leader>x", ":.lua<CR>", { desc = "Run current line" })
vim.keymap.set("v", "<leader>x", ":lua<CR>", { desc = "Run current selection" })

-- lazy.nvim
vim.keymap.set("n", "<leader>l", "<cmd>Lazy<CR>", { desc = "Open Lazy" }) -- open lazy

-- clear search highlights
vim.keymap.set("n", "<leader>nh", ":nohl<CR>", { desc = "Clear search highlights" })

vim.keymap.set("n", "<leader>mm", function ()
  local current = vim.o.mouse
  if current == 'a' then
    vim.opt.mouse = ""
    vim.notify('Mouse input disabled', vim.log.levels.INFO)
  else
    vim.opt.mouse = 'a'
    vim.notify('Mouse input enabled', vim.log.levels.INFO)
  end
end, { noremap = true, silent = true, desc = "Toggle mouse input" })

vim.keymap.set("n", "<C-u>", "<C-u>zz", { noremap = true, silent = true, desc = "Scroll half page down & center cursor" })
vim.keymap.set("n", "<C-d>", "<C-d>zz", { noremap = true, silent = true, desc = "Scroll half page up & center cursor" })

vim.keymap.set("n", "<C-n>", "<cmd>cnext<CR>zz")
vim.keymap.set("n", "<C-p>", "<cmd>cprev<CR>zz")

-- substitute word under cursor
vim.keymap.set("n", "<leader>s", [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- retain position in paragraph after indenting
vim.keymap.set("n", "=ap", "ma=ap'a")

-- lsp
vim.keymap.set("n", "gd", "<C-u>zz", { noremap = true, silent = true, desc = "Scroll half page down & center cursor" })
