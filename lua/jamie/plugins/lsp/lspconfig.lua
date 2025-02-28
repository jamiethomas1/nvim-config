local utils = require("utils")

return {
  "neovim/nvim-lspconfig",
  enabled = not utils.is_vscode,
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true }
  },
  config = function ()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      vim.keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      vim.keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      vim.keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      vim.keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      vim.keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      vim.keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      vim.keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      vim.keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      vim.keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      vim.keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      vim.keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    local capabilities = cmp_nvim_lsp.default_capabilities() -- shorthand for enabling autocompletion - assign to each lsp server config

    local servers = {
      html = {
        capabilities = capabilities,
        filetypes = { "html" },
        on_attach = on_attach
      },
      htmx = {
        capabilities = capabilities,
        filetypes = { "html" },
        on_attach = on_attach
      },
      cssls = {
        capabilities = capabilities,
        filetypes = { "css", "scss", "less" },
        on_attach = on_attach
      },
      tailwindcss = {
        capabilities = capabilities,
        filetypes = { "html", "css", "scss", "less", "javascript", "typescript", "javascriptreact", "typescriptreact" },
        on_attach = on_attach
      },
      lua_ls = {
        capabilities = capabilities,
        filetypes = { "lua" },
        on_attach = on_attach,
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" }
            },
            workspace = {
              library = {
                [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                [vim.fn.stdpath("config") .. "/lua"] = true
              }
            }
          }
        }
      },
      emmet_ls = {
        capabilities = capabilities,
        filetypes = { "html", "css", "scss", "less", "javascript", "typescript", "javascriptreact", "typescriptreact" },
        on_attach = on_attach,
      },
      pyright = {
        capabilities = capabilities,
        filetypes = { "python" },
        on_attach = on_attach
      },
      bashls = {
        capabilities = capabilities,
        filetypes = { "sh", "bash" },
        on_attach = on_attach
      },
      clangd = {
        capabilities = capabilities,
        filetypes = { "c", "cpp" },
        on_attach = on_attach
      },
      cmake = {
        capabilities = capabilities,
        filetypes = { "cmake" },
        on_attach = on_attach
      },
      dockerls = {
        capabilities = capabilities,
        filetypes = { "dockerfile" },
        on_attach = on_attach
      },
      docker_compose_language_service = {
        capabilities = capabilities,
        filetypes = { "docker-compose" },
        on_attach = on_attach
      },
      eslint = {
       capabilities = capabilities,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
       on_attach = on_attach
       },
      glsl_analyzer = {
        capabilities = capabilities,
        filetypes = { "glsl" },
        on_attach = on_attach
      },
      gopls = {
        capabilities = capabilities,
        filetypes = { "go", "gomod", "gowork", "gotmpl" },
        on_attach = on_attach
      },
      jsonls = {
        capabilities = capabilities,
        filetypes = { "json" },
        on_attach = on_attach
      },
      marksman = {
        capabilities = capabilities,
        filetypes = { "markdown" },
        on_attach = on_attach
      },
      intelephense = {
        capabilities = capabilities,
        filetypes = { "php" },
        on_attach = on_attach
      },
      rust_analyzer = {
        capabilities = capabilities,
        filetypes = { "rust" },
        on_attach = on_attach
      },
      sqlls = {
        capabilities = capabilities,
        filetypes = { "sql" },
        on_attach = on_attach
      },
      lemminx = {
        capabilities = capabilities,
        filetypes = { "xml" },
        on_attach = on_attach
      },
      yamlls = {
        capabilities = capabilities,
        filetypes = { "yaml", "yml" },
        on_attach = on_attach
      },
      ts_ls = {
        capabilities = capabilities,
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact", "html" },
        on_attach = on_attach
      },
      prismals = {
        capabilities = capabilities,
        filetypes = { "prisma" },
        on_attach = on_attach
      },
      zls = {
        capabilities = capabilities,
        filetypes = { "zig" },
        on_attach = on_attach
      },
    }

    for server, config in pairs(servers) do
      lspconfig[server].setup(config)
    end
  end
}
