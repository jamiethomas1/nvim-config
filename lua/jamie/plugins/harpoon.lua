return {
  "ThePrimeagen/harpoon",
  branch = "harpoon2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    local harpoon = require("harpoon")

    harpoon.setup()

    vim.keymap.set("n", "<leader>a", function() harpoon:list():add() end)
    vim.keymap.set("n", "<leader>o", function() harpoon.ui:toggle_quick_menu(harpoon:list()) end)

    vim.defer_fn(function()
      vim.keymap.set("n", "<A-h>", function() harpoon:list():select(1) end)
      vim.keymap.set("n", "<A-t>", function() harpoon:list():select(2) end)
      vim.keymap.set("n", "<A-n>", function() harpoon:list():select(3) end)
      vim.keymap.set("n", "<A-s>", function() harpoon:list():select(4) end)
    end, 100)

    -- Toggle previous & next buffers stored within Harpoon list
    vim.keymap.set("n", "<C-S-P>", function() harpoon:list():prev() end)
    vim.keymap.set("n", "<C-S-N>", function() harpoon:list():next() end)
  end,
}
