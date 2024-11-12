local utils = require("utils")

return {
  'rmagatti/auto-session',
  lazy = false,
  enabled = not utils.is_vscode,

  --- enables autocomplete for opts
  ---@module "auto-session"
  ---@type AutoSession.Config
  opts = {
    suppressed_dirs = { '~/', '/' }
  }
}
