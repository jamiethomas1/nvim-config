return {
  "neovim/nvim-lspconfig",
  event = { "BufReadPre", "BufNewFile" },
  dependencies = {
    "hrsh7th/cmp-nvim-lsp",
    { "antosha417/nvim-lsp-file-operations", config = true }
  },
  config = function ()
    local lspconfig = require("lspconfig")
    local cmp_nvim_lsp = require("cmp_nvim_lsp")

    local keymap = vim.keymap -- for conciseness

    local opts = { noremap = true, silent = true }
    local on_attach = function(client, bufnr)
      opts.buffer = bufnr

      -- set keybinds
      opts.desc = "Show LSP references"
      keymap.set("n", "gR", "<cmd>Telescope lsp_references<CR>", opts) -- show definition, references

      opts.desc = "Go to declaration"
      keymap.set("n", "gD", vim.lsp.buf.declaration, opts) -- go to declaration

      opts.desc = "Show LSP definitions"
      keymap.set("n", "gd", "<cmd>Telescope lsp_definitions<CR>", opts) -- show lsp definitions

      opts.desc = "Show LSP implementations"
      keymap.set("n", "gi", "<cmd>Telescope lsp_implementations<CR>", opts) -- show lsp implementations

      opts.desc = "Show LSP type definitions"
      keymap.set("n", "gt", "<cmd>Telescope lsp_type_definitions<CR>", opts) -- show lsp type definitions

      opts.desc = "See available code actions"
      keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts) -- see available code actions, in visual mode will apply to selection

      opts.desc = "Smart rename"
      keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename

      opts.desc = "Show buffer diagnostics"
      keymap.set("n", "<leader>D", "<cmd>Telescope diagnostics bufnr=0<CR>", opts) -- show  diagnostics for file

      opts.desc = "Show line diagnostics"
      keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts) -- show diagnostics for line

      opts.desc = "Go to previous diagnostic"
      keymap.set("n", "[d", vim.diagnostic.goto_prev, opts) -- jump to previous diagnostic in buffer

      opts.desc = "Go to next diagnostic"
      keymap.set("n", "]d", vim.diagnostic.goto_next, opts) -- jump to next diagnostic in buffer

      opts.desc = "Show documentation for what is under cursor"
      keymap.set("n", "K", vim.lsp.buf.hover, opts) -- show documentation for what is under cursor

      opts.desc = "Restart LSP"
      keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts) -- mapping to restart lsp if necessary
    end

    local capabilities = cmp_nvim_lsp.default_capabilities() -- shorthand for enabling autocompletion - assign to each lsp server config

    -- local signs = {}
    
    -- configure html server
    lspconfig["html"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure cssls server
    lspconfig["cssls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure tailwindcss server
    lspconfig["tailwindcss"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure lua_ls server
    lspconfig["lua_ls"].setup({
      capabilities = capabilities,
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
    })

    -- configure emmet_ls server
    lspconfig["emmet_ls"].setup({
      capabilities = capabilities,
      on_attach = on_attach,
    })

    -- configure pyright server
    lspconfig["pyright"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure bashls server
    lspconfig["bashls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure clangd server
    lspconfig["clangd"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure cmake server
    lspconfig["cmake"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure dockerls server
    lspconfig["dockerls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure docker_compose_language_service server
    lspconfig["docker_compose_language_service"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- -- configure eslint server
    -- lspconfig["eslint"].setup({
    --   capabilities = capabilities,
    --   on_attach = on_attach
    -- })

    -- configure glsl_analyzer server
    lspconfig["glsl_analyzer"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure jsonls server
    lspconfig["jsonls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure marksman server
    lspconfig["marksman"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure intelephense server
    lspconfig["intelephense"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure rust_analyzer server
    lspconfig["rust_analyzer"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure sqlls server
    lspconfig["sqlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure lemminx server
    lspconfig["lemminx"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure yamlls server
    lspconfig["yamlls"].setup({
      capabilities = capabilities,
      on_attach = on_attach
    })

    -- configure ts_ls server
    lspconfig["ts_ls"].setup({
      capabilities = capabilities,
      filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
      on_attach = on_attach
    })
  end
}
