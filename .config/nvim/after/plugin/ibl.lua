require("ibl").setup({
    indent = {
        char = '│',
    },
    scope = {
        enabled = false
    },
    exclude = {
        filetypes = {'vimwiki','gitconfig','c','cpp','rust','text'},
    },
})
