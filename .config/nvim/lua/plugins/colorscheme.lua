return {
        "drwxs/ash.nvim",
        lazy = false,
        priority = 1000,
        config = function ()
            require("ash").setup {
                compile_path = vim.fn.stdpath("cache") .. "/ash",

                transparent = true, -- transparent background
                term_colors = true, -- terminal colors (e.g. g:terminal_color_x)
                no_italic = false, -- disable italics
                no_bold = false, -- disable bold
                no_underline = false, -- disable underlines

                -- override style groups
                -- e.g. comments = { "italic", "bold" }
                styles = {
                    comments = {},
                    conditionals = {},
                    loops = {},
                    functions = {},
                    keywords = {},
                    strings = {},
                    variables = {},
                    numbers = {},
                    booleans = {},
                    properties = {},
                    types = {},
                    operators = {},
                },
            }

            vim.cmd.colorscheme ("ash")
        end
}
