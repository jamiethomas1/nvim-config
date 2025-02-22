local utils = require("utils")

if not utils.is_vscode then
  return {
    "christoomey/vim-tmux-navigator",
    "bullets-vim/bullets.vim",
    -- "github/copilot.vim",
    "nvim-treesitter/nvim-treesitter-context",
    "JoosepAlviste/nvim-ts-context-commentstring",
  }
end
