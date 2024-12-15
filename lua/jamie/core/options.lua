-- line numbers
vim.opt.relativenumber = true -- show relative line numbers
vim.opt.number = true -- shows absolute line number on cursor line (when relative number is on)

-- tabs & indentation
vim.opt.tabstop = 2 -- 2 spaces for tabs (prettier default)
vim.opt.shiftwidth = 2 -- 2 spaces for indent width
vim.opt.expandtab = true -- expand tab to spaces
vim.opt.autoindent = true -- copy indent from current line when starting new one

-- line wrapping
vim.opt.wrap = false -- disable line wrapping

-- search settings
vim.opt.ignorecase = true -- ignore case when searching
vim.opt.smartcase = true -- if you include mixed case in your search, assumes you want case-sensitive

-- cursor line
vim.opt.cursorline = true -- highlight the current cursor line

-- cursor block
vim.opt.guicursor = "n-v-i-c:block-Cursor"

-- appearance
vim.opt.termguicolors = true
vim.opt.background = "dark"
vim.opt.signcolumn = "yes" -- show sign column so that text doesn't shift
vim.opt.showmode = false

-- backspace
vim.opt.backspace = "indent,eol,start" -- allow backspace on indent, end of line or insert mode start position

-- clipboard
vim.opt.clipboard:append("unnamedplus") -- use system clipboard as default register

-- split windows
vim.opt.splitright = true -- split vertical window to the right
vim.opt.splitbelow = true -- split horizontal window to the bottom

-- mouse
vim.opt.mouse = ''


-- custom config
vim.api.nvim_create_autocmd("TextYankPost", {
  desc = "Highlight yanked text",
  group = vim.api.nvim_create_augroup('highlight_yank', {clear = true}),
  callback = function()
    vim.highlight.on_yank()
  end
})

vim.api.nvim_create_autocmd("TermOpen", {
  desc = "Disable line numbers in terminal",
  group = vim.api.nvim_create_augroup('term_open', {clear = true}),
  callback = function()
    vim.opt_local.number = false
    vim.opt_local.relativenumber = false
  end
})
