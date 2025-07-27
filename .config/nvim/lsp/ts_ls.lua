return {
    cmd = { 'typescript-language-server', '--stdio' },
    root_markers = { 'package.json', 'tsconfig.json', 'jsconfig.json', '.git' },
    filetypes = { "javascript", "typescript", "javascriptreact", "typescriptreact", "vue" },
    init_options = {
        plugins = {
            {
                name = "@vue/typescript-plugin",
                languages = { "vue" },
            },
        },
    },
}
