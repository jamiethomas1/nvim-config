return {
  cmd = { "tailwindcss-language-server", "--stdio" },
  filetypes = { "html", "css", "scss", "less", "javascript", "typescript", "javascriptreact", "typescriptreact" },
	root_markers = {
		"package.json",
		".git",
	},
  settings = {
    tailwindCSS = {
      experimental = {
        classRegex = {
          { "cva\\(((?:[^()]|\\([^()]*\\))*)\\)", "[\"'`]([^\"'`]*).*?[\"'`]" },
          { "cx\\(((?:[^()]|\\([^()]*\\))*)\\)", "(?:'|\"|`)([^']*)(?:'|\"|`)" }
        }
      }
    }
  }
}
