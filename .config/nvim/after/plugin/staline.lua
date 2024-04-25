require("staline").setup({
    sections = {
        left = { '  ', 'mode', ' ', 'lsp' },
        mid = {'branch'},
        right = {'file_name' }
    },
    mode_colors = {
        i = "#9ccfd8",
        n = "#ea9a97",
        c = "#8fbf7f",
        v = "#c4a7e7",
    },
    defaults = {
        true_colors = true,
        line_column = " [%l/%L] :%c  ",
        branch_symbol = " "
    }
})

