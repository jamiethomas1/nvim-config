return {
  "williamboman/mason.nvim",
  dependencies = {
    "williamboman/mason-lspconfig.nvim",
  },
  config = function ()
    local mason = require("mason")
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
        "jsonls",
        "marksman",
        "intelephense",
        "rust_analyzer",
        "sqlls",
        "lemminx",
        "yamlls",
        "ts_ls"
      },
      automatic_installation = true,
    })
  end
}
