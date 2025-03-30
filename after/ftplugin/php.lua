vim.keymap.set(
  "n",
  "<leader>cl",
  "oLog::debug(\"\");<Esc>F\"i",
  { buffer = true }
)

---@param title string What to display in the prompt
---@param pattern string What to search for with rg
local function laravel_find_files(title, pattern)
  require('telescope.builtin').find_files({
    prompt_title = title,
    find_command = { "rg", "--files", "--glob", pattern },
    path_display = { "smart" },
  })
end

vim.keymap.set('n', '<leader>fc', function()
  laravel_find_files("Controllers", "**/app/Http/Controllers/**")
end, { desc = "Find Controllers" })

vim.keymap.set('n', '<leader>fm', function()
  laravel_find_files("Models", "**/app/Models/**")
end, { desc = "Find Models" })
