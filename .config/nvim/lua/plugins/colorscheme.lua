return {
    {
        "sainnhe/gruvbox-material",
        config = function ()
            vim.g.gruvbox_material_background = 'hard'
            vim.g.gruvbox_material_transparent_background = '1'
        end
    },

    {
        "vague2k/vague.nvim",
        config = function()
            require("vague").setup({
                -- optional configuration here
                transparent = true,
                style = {
                    -- "none" is the same thing as default. But "italic" and "bold" are also valid options
                    boolean = "none",
                    number = "none",
                    float = "none",
                    error = "none",
                    comments = "none",
                    conditionals = "none",
                    functions = "none",
                    headings = "bold",
                    operators = "none",
                    strings = "italic",
                    variables = "none",

                    -- keywords
                    keywords = "none",
                    keyword_return = "none",
                    keywords_loop = "none",
                    keywords_label = "none",
                    keywords_exception = "none",

                    -- builtin
                    builtin_constants = "none",
                    builtin_functions = "none",
                    builtin_types = "none",
                    builtin_variables = "none",
                },
                colors = {
                    func = "#bc96b0",
                    keyword = "#787bab",
                    -- string = "#d4bd98",
                    string = "#8a739a",
                    -- string = "#f2e6ff",
                    -- number = "#f2e6ff",
                    -- string = "#d8d5b1",
                    number = "#8f729e",
                    -- type = "#dcaed7",
                },
            })
        end
    }
}