local utils = require("utils")

return {
  "williamboman/mason.nvim",
  enabled = not utils.is_vscode,
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function ()

    --- @class Mason
    --- @field setup fun(opts?: table)
    local mason = require("mason")

    --- @class MasonLspconfig
    --- @field setup fun(opts?: table)
    local mason_lspconfig = require("mason-lspconfig")

    mason.setup({
      ui = {
        icons = {
            package_installed = "✓",
            package_pending = "➜",
            package_uninstalled = "✗"
        }
      }
    })

    mason_lspconfig.setup({
      ensure_installed = {
        "html",
        "htmx",
        "cssls",
        "stylelint_lsp",
        "tailwindcss",
        "lua_ls",
        "emmet_ls",
        "pyright",
        "bashls",
        "clangd",
        "cmake",
        "dockerls",
        "docker_compose_language_service",
        "eslint",
        "glsl_analyzer",
        "gopls",
        "jsonls",
        "marksman",
        "intelephense",
        "rust_analyzer",
        "sqlls",
        "lemminx",
        "yamlls",
        "ts_ls",
        "ocamllsp",
        "prismals",
        "zls",
      },
      automatic_installation = true,
    })
  end
}
