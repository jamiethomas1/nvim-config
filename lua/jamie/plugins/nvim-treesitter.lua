return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects",
    "windwp/nvim-ts-autotag",
  },
  build = ":TSUpdate",
  config = function ()
    require("nvim-ts-autotag").setup()
    local configs = require("nvim-treesitter.configs")

    configs.setup({
      ensure_installed = {
        "lua",
        "vim",
        "vimdoc",
        "javascript",
        "typescript",
        "jsdoc",
        "html",
        "css",
        "tsx",
        "markdown",
        "python",
        "bash",
        "dockerfile",
        "fish",
        "json",
        "scss",
        "glsl",
        "prisma",
        "yaml",
        "zig",
        "go",
        "elixir",
      },
      sync_install = false,
      highlight = { enable = true },
      indent = {
        enable = true,
        disable = { "html" }
      },
    })
  end
}
