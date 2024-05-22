require("ibl").setup({
    indent = {
        char = '│',
    },
    scope = {
        enabled = false
    },
    exclude = {
        filetypes = {'make','vimwiki','gitconfig','c','cpp','rust','text'},
    },
})
