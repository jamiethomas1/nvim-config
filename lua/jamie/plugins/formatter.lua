local utils = require("utils")

vim.g.FormatterEnabled = true

local function toggle_formatter()
  vim.g.FormatterEnabled = not vim.g.FormatterEnabled
  local status = vim.g.FormatterEnabled and "Formatting Enabled" or "Formatting Disabled"
  vim.notify(status, vim.log.levels.INFO)
end

_G.toggle_formatter = toggle_formatter

return {
  "mhartington/formatter.nvim",
  enabled = not utils.is_vscode,
  config = function()
    require("formatter").setup({
      logging = false,
      filetype = {
        -- prettierd
        javascript = {
          function()
            return {
              exe = "prettierd",
              args = { vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        javascriptreact = {
          function()
            return {
              exe = "prettierd",
              args = { vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        typescript = {
          function()
            return {
              exe = "prettierd",
              args = { vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        typescriptreact = {
          function()
            return {
              exe = "prettierd",
              args = { vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        json = {
          function()
            return {
              exe = "prettierd",
              args = { vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        css = {
          function()
            return {
              exe = "prettierd",
              args = { vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        html = {
          function()
            return {
              exe = "prettierd",
              args = { vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        markdown = {
          function()
            return {
              exe = "prettierd",
              args = { vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
      }
    })

    local augroup = vim.api.nvim_create_augroup
    local autocmd = vim.api.nvim_create_autocmd
    augroup("__formatter__", { clear = true })
    autocmd("BufWritePost", {
      group = "__formatter__",
      callback = function()
        if vim.g.FormatterEnabled then
          vim.cmd("FormatWrite")
        end
      end,
    })
  end,
}
