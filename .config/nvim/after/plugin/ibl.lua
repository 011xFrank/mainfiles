require("ibl").setup({
    indent = {
        char = '│',
    },
    scope = {
        enabled = false
    },
    exclude = {
        filetypes = {'sh','asm','make','vimwiki','gitconfig','c','cpp','rust','text'},
    },
})
