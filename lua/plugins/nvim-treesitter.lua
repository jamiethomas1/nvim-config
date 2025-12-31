return {
  'nvim-treesitter/nvim-treesitter',
  lazy = false,
  build = ':TSUpdate',
  install = {
    "javascript",
    "typescript",
    "jsdoc",
    "tsx",
    "lua",
  }
}
