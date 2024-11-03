return {
  "MunifTanjim/prettier.nvim",
  config = function()
    require("prettier").setup({
      print_width = 80,
      tab_width = 2,
      single_quote = false,
      trailing_comma = "all",
      config_precedence = "prefer-file",
      bracket_spacing = true,
      jsx_bracket_same_line = false,
      arrow_parens = "avoid",
      prose_wrap = "preserve",
      plugins = {},
    })
  end,
}
