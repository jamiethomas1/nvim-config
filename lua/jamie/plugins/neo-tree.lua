local utils = require("utils")

return {
  "nvim-neo-tree/neo-tree.nvim",
  -- enabled = not utils.is_vscode,
  enabled = false,
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended
    "MunifTanjim/nui.nvim",
  },
  keys = {
    { "<leader>e", "<cmd>Neotree toggle<cr>", desc = "Neotree" }
  },
  config = function ()
    vim.fn.sign_define("DiagnosticSignError",
      {text = " ", texthl = "DiagnosticSignError"})
    vim.fn.sign_define("DiagnosticSignWarn",
      {text = " ", texthl = "DiagnosticSignWarn"})
    vim.fn.sign_define("DiagnosticSignInfo",
      {text = " ", texthl = "DiagnosticSignInfo"})
    vim.fn.sign_define("DiagnosticSignHint",
      {text = " ", texthl = "DiagnosticSignHint"})

    require("neo-tree").setup({
      close_if_last_window = true,
      filesystem = {
        follow_current_file = {
          enabled = true, -- Highlight active file in active buffer
          leave_dirs_open = false,
        },
        filtered_items = {
          hide_dotfiles = false,
        },
      },
      diagnostics = {
        enabled = true,
        show_on_dirs = true,
        icons = {
          error = "",
          warn = "",
          info = "",
          hint = "",
        }
      }
    })
  end
}
