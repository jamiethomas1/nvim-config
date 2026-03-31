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

---@type vim.keymap.set.Opts
local opts = {}

opts.desc = "Show LSP references"
vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

opts.desc = "Go to declaration"
vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

opts.desc = "Show LSP definitions"
vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

opts.desc = "Show LSP implementations"
vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

opts.desc = "Show LSP type definitions"
vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

opts.desc = "See available code actions"
vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

opts.desc = "Smart rename"
vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

opts.desc = "Show buffer diagnostics"
vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

opts.desc = "Show line diagnostics"
vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

opts.desc = "Go to previous diagnostic"
vim.keymap.set("n", "[d", vim.diagnostic.get_prev, opts) -- jump to previous diagnostic in buffer

opts.desc = "Go to next diagnostic"
vim.keymap.set("n", "]d", vim.diagnostic.get_next, opts) -- jump to next diagnostic in buffer

opts.desc = "Show documentation for what is under cursor"
vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

opts.desc = "Restart LSP"
vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary

vim.keymap.set("t", "<Esc><Esc>", "<C-\\><C-n>", { desc = "Exit terminal mode" })

vim.keymap.set({"n", "t"}, "<leader>bc", "<cmd>ClaudeCode<cr>", { desc = "Toggle Claude" })
vim.keymap.set({"n", "t"}, "<leader>bf", "<cmd>ClaudeCodeFocus<cr>", { desc = "Focus Claude" })
-- Close Claude Code panel from terminal insert mode without going through normal mode
vim.keymap.set("t", "<C-q>", "<C-\\><C-n><cmd>ClaudeCode<cr>", { desc = "Toggle Claude panel" })

vim.keymap.set({"n", "t"}, "<leader>br", "<cmd>ClaudeCode --resume<cr>", { desc = "Resume Claude" })
vim.keymap.set({"n", "t"}, "<leader>bC", "<cmd>ClaudeCode --continue<cr>", { desc = "Continue Claude" })
vim.keymap.set({"n", "t"}, "<leader>bm", "<cmd>ClaudeCodeSelectModel<cr>", { desc = "Select Claude model" })
vim.keymap.set({"n", "t"}, "<leader>bb", "<cmd>ClaudeCodeAdd %<cr>", { desc = "Add current buffer" })
vim.keymap.set("v", "<leader>bs", "<cmd>ClaudeCodeSend<cr>", { desc = "Send to Claude" })
vim.keymap.set("n", "<leader>bs", "<cmd>ClaudeCodeTreeAdd<cr>", { desc = "Add file" })
-- Diff management
vim.keymap.set({"n", "t"}, "<leader>ba", "<cmd>ClaudeCodeDiffAccept<cr>", { desc = "Accept diff" })
vim.keymap.set({"n", "t"}, "<leader>bd", "<cmd>ClaudeCodeDiffDeny<cr>", { desc = "Deny diff" })
