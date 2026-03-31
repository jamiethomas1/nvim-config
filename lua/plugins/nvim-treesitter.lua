-- return {
--   'nvim-treesitter/nvim-treesitter',
--   lazy = false,
--   build = ':TSUpdate',
--   event = { 'BufRead', 'BufNewFile' },
--   install = {
--     "javascript",
--     "typescript",
--     "jsdoc",
--     "tsx",
--     "lua",
--     "bash",
--     "go",
--   }
-- }

return {
  'nvim-treesitter/nvim-treesitter',
  branch = 'master',
  lazy = false,
  build = ':TSUpdate',
  event = { 'BufRead', 'BufNewFile' },
  config = function ()
      local configs = require'nvim-treesitter.configs'

      configs.setup({
          ensure_installed = {
              "javascript",
              "typescript",
              "jsdoc",
              "tsx",
              "lua",
              "bash",
              "go",
          },
          sync_install = false,
          highlight = { enable = true },
          indent = {
              enable = true,
          },
          modules = {},
          auto_install = true,
          ignore_install = {},
      })
  end
}
