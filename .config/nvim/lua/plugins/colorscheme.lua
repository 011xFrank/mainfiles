return {
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

                -- override highlight groups [function/table]
                -- highlights = function(colors)
                    -- return {
                        -- Comment = { fg = colors.red },
                        -- CmpBorder = { fg = colors.none },
                    -- }
                -- end,

                -- override style groups
                -- e.g. comments = { "italic", "bold" }
                styles = {
                    comments = {"italic"},
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
    },

    {
        "sainnhe/gruvbox-material",
        lazy = true,
        config = function ()
            vim.g.gruvbox_material_background = 'hard'
            vim.g.gruvbox_material_transparent_background = 2
            vim.g.gruvbox_material_float_style = 'dim'
        end
    },

    {
        "thesimonho/kanagawa-paper.nvim",
        lazy = true,
        opts = {},
        config = function ()
            require("kanagawa-paper").setup({
                -- enable undercurls for underlined text
                undercurl = true,
                -- transparent background
                transparent = true,
                -- highlight background for the left gutter
                gutter = false,
                -- background for diagnostic virtual text
                diag_background = false,
                -- dim inactive windows. Disabled when transparent
                dim_inactive = false,
                -- set colors for terminal buffers
                terminal_colors = true,
                -- cache highlights and colors for faster startup.
                -- see Cache section for more details.
                cache = true,

                styles = {
                    -- style for comments
                    comment = { italic = true },
                    -- style for functions
                    functions = { italic = false },
                    -- style for keywords
                    keyword = { italic = false, bold = false },
                    -- style for statements
                    statement = { italic = false, bold = false },
                    -- style for types
                    type = { italic = false },
                },
                -- override default palette and theme colors
                colors = {
                    palette = {},
                    theme = {
                        ink = {},
                        canvas = {},
                    },
                },
                -- adjust overall color balance for each theme [-1, 1]
                color_offset = {
                    ink = { brightness = 0, saturation = 0 },
                    canvas = { brightness = 0, saturation = 0 },
                },
                -- override highlight groups
                overrides = function(colors)
                    return {}
                end,

                -- uses lazy.nvim, if installed, to automatically enable needed plugins
                auto_plugins = true,
                -- enable highlights for all plugins (disabled if using lazy.nvim)
                all_plugins = package.loaded.lazy == nil,
                -- manually enable/disable individual plugins.
                -- check the `groups/plugins` directory for the exact names
                plugins = {
                    -- examples:
                    -- rainbow_delimiters = true
                    -- which_key = false
                },

                -- enable integrations with other applications
                integrations = {
                    -- automatically set wezterm theme to match the current neovim theme
                    wezterm = {
                        enabled = false,
                        -- neovim will write the theme name to this file
                        -- wezterm will read from this file to know which theme to use
                        path = (os.getenv("TEMP") or "/tmp") .. "/nvim-theme",
                    },
                },
            })
        end
    }
}
