require("ibl").setup({
    indent = {
        char = '│',
    },
    scope = {
        enabled = false
    },
    exclude = {
        filetypes = {'asm','make','vimwiki','gitconfig','c','cpp','rust','text'},
    },
})
