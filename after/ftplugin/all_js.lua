vim.opt_local.tabstop = 2
vim.opt_local.shiftwidth = 2

vim.keymap.set(
  "n",
  "<leader>cl",
  "oconsole.log(\"\")<Esc>F\"i",
  { buffer = true }
)

vim.keymap.set(
  "n",
  "<leader>us",
  "oconst [] = useState(null)<Esc>F]i",
  { buffer = true }
)

-- i18next translation change operator for JavaScript files
-- Add this to ~/.config/nvim/ftplugin/javascript.lua (or typescript.lua)

-- Define the function that implements the translation change operator
local function i18n_change_operator(type)
  -- Save registers to restore later
  local old_reg = vim.fn.getreg('"')
  local old_reg_type = vim.fn.getregtype('"')
  
  if type == "line" then
    vim.cmd("normal! '[V']d")
  elseif type == "block" then
    vim.cmd("normal! `[\\<C-V>`]d")
  elseif type == "v" or type == "V" or type == "\\<C-V>" then
    vim.cmd("normal! gvd")
  else
    vim.cmd("normal! `[v`]d")
  end
  
  -- Get the deleted text
  local deleted_text = vim.fn.getreg('"')
  
  -- Check if the text is already wrapped in quotes (for quote text objects)
  -- and remove them if they exist
  local quote_pattern = "^['\"`](.+)['\"`]$"
  local inner_text = deleted_text:match(quote_pattern)
  
  if inner_text then
    -- If text was already quoted, use the inner text
    vim.fn.setreg('"', inner_text)
  end
  
  -- Insert the translation markup
  vim.cmd("normal! i{t(\"")
  vim.cmd("normal! a\")}")
  vim.cmd("normal! F\"a")
  vim.cmd("startinsert") -- Enter insert mode
  
  -- Restore registers
  vim.fn.setreg('"', old_reg, old_reg_type)
end

-- Create a global reference to the function
_G.i18n_change_operator = i18n_change_operator

-- Setup the operator function with gT mapping
vim.api.nvim_buf_set_keymap(0, 'n', 'gT', ":<C-u>set opfunc=v:lua.i18n_change_operator<CR>g@", {noremap = true, silent = true})

-- Add visual mode support
vim.api.nvim_buf_set_keymap(0, 'x', 'gT', ":<C-u>lua i18n_change_operator(vim.fn.mode())<CR>", {noremap = true, silent = true})
