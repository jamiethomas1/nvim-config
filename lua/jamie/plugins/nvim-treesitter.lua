return {
  "nvim-treesitter/nvim-treesitter",
  dependencies = {
    "nvim-treesitter/nvim-treesitter-textobjects"
  },
  build = ":TSUpdate",
  config = function ()
    local configs = require("nvim-treesitter.configs")
    require 'nvim-treesitter.install'.prefer_git = false

    configs.setup({
      ensure_installed = { "c", "lua", "vim", "vimdoc", "javascript", "html", "css", "rust", "cpp", "php", "yaml", "toml", "markdown", "haskell", "python", "bash", "dockerfile", "fish", "glsl", "hlsl", "json", "scss", "sql", "xml", "ini", "typescript", "tsx" },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = false },
      autotag = { enable = true },
      textobjects = {
        lsp_interop = {
          enable = true,
          border = 'none',
          floating_preview_opts = {},
          peek_definition_code = {
            ["<leader>df"] = "@function.outer",
            ["<leader>dF"] = "@class.outer",
          }
        }
      }
    })
  end
}
