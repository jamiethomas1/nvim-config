local utils = require("utils")

return {
  'nvim-telescope/telescope.nvim', 
  enabled = not utils.is_vscode,
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'nvim-tree/nvim-web-devicons',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = "make"}
  },
  config = function()
    local telescope = require("telescope")
    local telescope_builtin = require("telescope.builtin")
    local actions = require("telescope.actions")
    local action_state = require("telescope.actions.state")

    local show_hidden = false

    local function toggle_hidden_files(prompt_bufnr)
      local query = action_state.get_current_line()
      show_hidden = not show_hidden
      actions.close(prompt_bufnr)

      telescope_builtin.find_files({
        hidden = show_hidden,
        no_ignore = show_hidden,
        default_text = query
      })
    end

    telescope.setup({
      defaults = {
        mappings = {
          i = {
            ["<C-k>"] = actions.move_selection_previous, -- move to prev result
            ["<C-j>"] = actions.move_selection_next, -- move to next result
            ["<C-q>"] = actions.send_selected_to_qflist + actions.open_qflist,
          }
        }
      },
      extensions = {
        fzf = {}
      },
      pickers = {
        find_files = {
          hidden = false,
          attach_mappings = function(_, map)
            map("i", "<C-h>", toggle_hidden_files)
            map("n", "<C-h>", toggle_hidden_files)
            return true
          end
        },
      }
    })

    telescope.load_extension("fzf");

    -- set keymaps

    vim.keymap.set("n", "<leader>ff", "<cmd>Telescope find_files<cr>", { desc = "Fuzzy find files in cwd" })
    vim.keymap.set("n", "<leader>fr", "<cmd>Telescope oldfiles<cr>", { desc = "Fuzzy find recent files" })
    vim.keymap.set("n", "<leader>fs", "<cmd>Telescope live_grep<cr>", { desc = "Find string in cwd" })
    vim.keymap.set("n", "<leader>fc", "<cmd>Telescope grep_string<cr>", { desc = "Find string under cursor in cwd" })
    vim.keymap.set("n", "<leader>fh", "<cmd>Telescope help_tags<cr>", { desc = "Find in help" })
    vim.keymap.set("n", "<leader>fb", "<cmd>Telescope buffers<cr>", { desc = "Find in buffers" })
    vim.keymap.set("n", "<leader>fl", "<cmd>Telescope lsp_document_symbols<cr>", { desc = "Find symbols in buffer" })
  end
}
