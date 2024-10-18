return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects"
  },
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = { "lua", "vim", "vimdoc", "javascript", "typescript", "html", "css", "tsx", "markdown", "python", "bash", "dockerfile", "fish", "json", "scss" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },
    })
  end
}
