return {
    {
        "sainnhe/gruvbox-material",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_better_performance = 1
            vim.g.gruvbox_material_foreground = "material"
            vim.g.gruvbox_material_background = "soft"
            vim.g.gruvbox_material_ui_contrast = "low"
            vim.g.gruvbox_material_float_style = "dim"
            vim.g.gruvbox_material_enable_italic = 0
            vim.g.gruvbox_material_disable_italic_comment = 1
            vim.g.gruvbox_material_cursor = "red"
            vim.g.gruvbox_material_disable_terminal_colors = 1
            vim.g.gruvbox_material_transparent_background = 1

            local function set_highlights()
                local highlights_groups = {
                    Normal = {bg = "#000000"},
                    Cursor = {bg = "#ffffff"},
                }

                for group, styles in pairs(highlights_groups) do
                    vim.api.nvim_set_hl(0, group, styles)
                end
            end

            vim.api.nvim_create_autocmd("ColorScheme", {
                callback = function()
                    if vim.g.colors_name == "gruvbox-material" then
                        set_highlights()
                    end
                end,
            })

            -- To make the content area transparent
            -- vim.api.nvim_set_hl(0, "NormalFloat", { bg = "NONE" })

            -- To make the border transparent
            -- vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE" })
        end,
    },

    {
        "drewxs/ash.nvim",
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
        end
    }
}
