local utils = require("utils")

return {
  {
    "hrsh7th/nvim-cmp",
    enabled = not utils.is_vscode,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer", -- source for text in buffer
      "hrsh7th/cmp-path", -- source for file system paths
      "L3M0N4D3/LuaSnip", -- snippet engine
      "saadparwaiz1/cmp_luasnip", -- for autocompletion
      "rafamadriz/friendly-snippets", -- useful snippets
      "onsails/lspkind.nvim", -- vs-code like pictograms
    },
    config = function ()
      local cmp = require("cmp")

      local luasnip = require("luasnip")
      luasnip.filetype_extend("javascriptreact", { "html" }) -- display html snippets in jsx files

      local lspkind = require("lspkind")
      require("luasnip.loaders.from_vscode").lazy_load()

      cmp.setup({
        completion = {
          completeopt = "menu,menuone,preview,noselect", -- Display completion menu, show menu even for only one choice, show docs for selected option, don't automatically select
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body) -- When a snippet is selected, send it to luasnip for expansion
          end
        },
        mapping = cmp.mapping.preset.insert({
          ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
          ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
          ["<C-b>"] = cmp.mapping.scroll_docs(-4),
          ["<C-f>"] = cmp.mapping.scroll_docs(4),
          ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
          ["<C-e>"] = cmp.mapping.abort(), -- close completion window
          ["<CR>"] = cmp.mapping.confirm({ select = true }),
        }),
        sources = cmp.config.sources({
          { name = "nvim_lsp" },
          { name = "luasnip" },
          { name = "buffer" },
          { name = "path" },
        }),
        formatting = {
          format = lspkind.cmp_format({
            maxwidth = 50,
            ellipsis_char = "...",
          })
        }
      })
    end
  },
  {
    "L3M0N4D3/LuaSnip",
    version = "v2.*",
    build = "make install_jsregexp",
  }
}
