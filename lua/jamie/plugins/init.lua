local utils = require("utils")

if utils.is_vscode then
  return {
    "matze/vim-move",
  }
end

return {
  "christoomey/vim-tmux-navigator",
  -- "voldikss/vim-floaterm",
  "bullets-vim/bullets.vim",
  "github/copilot.vim",
  "matze/vim-move",
  "nvim-treesitter/nvim-treesitter-context",
}
