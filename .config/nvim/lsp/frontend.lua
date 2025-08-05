local cssls = {
    cmd = { 'emmet-language-server', '--stdio' },
    root_markers = { 'package.json', '.git' },
    filetypes = { "php", "vue", "css", "html", "javascript", "typescript", "less", "sass", "scss" },
}

local html = {
    cmd = { 'vscode-html-language-server', '--stdio' },
    root_markers = { 'package.json', '.git' },
    filetypes = { 'html' },
}

local tailwindcss = {
    cmd = { 'tailwindcss-language-server', '--stdio' },
    root_markers = { 'tailwind.config.js', 'tailwind.config.cjs', 'tailwind.config.ts', 'postcss.config.js', '.git' },
    filetypes = { 'html', 'css', 'scss', 'javascript', 'javascriptreact', 'typescript', 'typescriptreact', 'vue' },
}

local emmet_language_server = {
    cmd = { 'emmet-language-server', '--stdio' },
    root_markers = { 'package.json', '.git' },
    filetypes = { "php", "vue", "css", "html", "javascript", "typescript", "less", "sass", "scss" },
}


return {
    cssls = cssls,
    html = html,
    tailwindcss = tailwindcss,
    emmet_language_server = emmet_language_server
}
