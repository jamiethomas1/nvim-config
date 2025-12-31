---@type vim.lsp.Config
return {
    cmd = { "typescript-language-server", "--stdio" },
    root_markers = { "jsconfig.json", "tsconfig.json" },
}
