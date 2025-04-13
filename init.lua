require("jamie.core")
require("jamie.lazy")

vim.lsp.enable({
  "luals",
  "html",
  "cssls",
  "stylelint_lsp",
  "tailwindcss",
  "pyright",
  "gopls",
  "eslint",
})

vim.api.nvim_create_autocmd('LspAttach', {
  callback = function(ev)
    local client = vim.lsp.get_client_by_id(ev.data.client_id)
    if client and client:supports_method("textDocument/completion") then
      vim.lsp.completion.enable(true, client.id, ev.buf, { autotrigger = true })
    end
  end,
})

vim.keymap.set('i', '<C-Space>', function()
  vim.lsp.completion.get()
end)

vim.cmd[[set completeopt+=menuone,noselect,popup]]
