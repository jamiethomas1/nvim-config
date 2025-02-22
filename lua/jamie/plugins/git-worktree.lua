return {
  "polarmutex/git-worktree.nvim",
  version = "^2",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope.nvim"
  },
  enabled = true,
  config = function()
    require("telescope").load_extension("git_worktree")

    vim.keymap.set("n", "<leader>fw", function ()
      require("telescope").extensions.git_worktree.git_worktree()
    end, { noremap = true, silent = true, desc = "Git worktrees" })
  end,
}
