return {
  "nvim-neo-tree/neo-tree.nvim",
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
    require("neo-tree").setup({
      filesystem = {
        follow_current_file = {
          enabled = true, -- Highlight active file in active buffer
          leave_dirs_open = false,
        },
        filtered_items = {
          hide_dotfiles = false,
        },
      }
    })
  end
}
