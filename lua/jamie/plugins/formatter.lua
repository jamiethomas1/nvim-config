local utils = require("utils")

vim.g.FormatterEnabled = true

local function load_formatter_state()
  local state_file = vim.fn.stdpath("data") .. "/formatter_enabled"
  local file = io.open(state_file, "r")
  if file then
    local state = file:read("*l") -- Read the first line
    file:close()
    vim.g.FormatterEnabled = state == "true"
  else
    vim.g.FormatterEnabled = true -- Default to enabled if no file exists
  end
end

load_formatter_state()

local function toggle_formatter()
  vim.g.FormatterEnabled = not vim.g.FormatterEnabled
  local status = vim.g.FormatterEnabled and "Formatting Enabled" or "Formatting Disabled"
  vim.notify(status, vim.log.levels.INFO)

  -- Save the state to a file
  local state_file = vim.fn.stdpath("data") .. "/formatter_enabled"
  local file = io.open(state_file, "w")
  if file then
    file:write(tostring(vim.g.FormatterEnabled)) -- Save as "true" or "false"
    file:close()
  end
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
        -- html = {
        --   function()
        --     return {
        --       exe = "prettierd",
        --       args = { vim.api.nvim_buf_get_name(0) },
        --       stdin = true,
        --     }
        --   end,
        -- },
        markdown = {
          function()
            return {
              exe = "prettierd",
              args = { vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        cpp = {
          function()
            return {
              exe = "prettierd",
              args = { vim.api.nvim_buf_get_name(0) },
              stdin = true,
            }
          end,
        },
        go = {
          require("formatter.filetypes.go").gofmt,
        },
        ocaml = {
          require("formatter.filetypes.ocaml").ocamlformat,
        },
        rust = {
          require("formatter.filetypes.rust").rustfmt,
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
