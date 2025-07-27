return {
    {
        "sainnhe/gruvbox-material",
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.gruvbox_material_better_performance = 1
            vim.g.gruvbox_material_foreground = "material"
            vim.g.gruvbox_material_transparent_background = 1
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
                    keywords = {"bold"},
                    strings = {"italic"},
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
        "thesimonho/kanagawa-paper.nvim",
        lazy = false,
        enabled = false,
        priority = 1000,
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
                cache = false,

                styles = {
                    -- style for comments
                    comment = { italic = true },
                    -- style for functions
                    functions = { italic = true},
                    -- style for keywords
                    keyword = { italic = true, bold = false },
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
    },

    {
        "vague2k/vague.nvim",
        enabled = false,
        config = function()
            -- NOTE: you do not need to call setup if you don't want to.
            require("vague").setup({
                transparent = true, -- don't set background
                -- disable bold/italic globally in `style`
                bold = true,
                italic = true,
                style = {
                    -- "none" is the same thing as default. But "italic" and "bold" are also valid options
                    boolean = "bold",
                    number = "none",
                    float = "none",
                    error = "bold",
                    comments = "italic",
                    conditionals = "none",
                    functions = "none",
                    headings = "bold",
                    operators = "none",
                    strings = "italic",
                    variables = "none",

                    -- keywords
                    keywords = "none",
                    keyword_return = "italic",
                    keywords_loop = "none",
                    keywords_label = "none",
                    keywords_exception = "none",

                    -- builtin
                    builtin_constants = "bold",
                    builtin_functions = "none",
                    builtin_types = "bold",
                    builtin_variables = "none",
                },
                -- plugin styles where applicable
                -- make an issue/pr if you'd like to see more styling options!
                plugins = {
                    cmp = {
                        match = "bold",
                        match_fuzzy = "bold",
                    },
                    dashboard = {
                        footer = "italic",
                    },
                    lsp = {
                        diagnostic_error = "bold",
                        diagnostic_hint = "none",
                        diagnostic_info = "italic",
                        diagnostic_ok = "none",
                        diagnostic_warn = "bold",
                    },
                    neotest = {
                        focused = "bold",
                        adapter_name = "bold",
                    },
                    telescope = {
                        match = "bold",
                    },
                },

                -- Override highlights or add new highlights
                on_highlights = function(highlights, colors) end,

                -- Override colors
                colors = {
                    -- Backgrounds
                    bg = "#0f0e15",           -- Dimmer than your current and Rose Pine's base
                    fg = "#b8b5cb",           -- Dimmer version of Rose Pine Text
                    floatBorder = "#5d5c70",  -- Muted and slightly darker than Rose Pine Muted
                    line = "#1a1920",         -- Darker version of a subtle line color
                    comment = "#535069",      -- Darker, desaturated purple-gray, like Rose Pine Muted but dimmer

                    -- Syntax / Semantic Highlighting (inspired by Rose Pine hues, but dimmed)
                    builtin = "#7c9baa",      -- Dimmed Rose Pine Foam/Pine blend
                    func = "#a66b7d",         -- Dimmed Rose Pine Love/Rose
                    string = "#b98c6b",       -- Dimmed Rose Pine Gold
                    number = "#af8051",       -- Dimmer Gold/Orange
                    property = "#9b9aac",     -- Dimmer Subtle/Text
                    constant = "#8e8eaf",     -- Dimmer Iris/Text
                    parameter = "#9b7f9d",    -- Dimmer Iris/Love
                    operator = "#78879b",     -- Dimmer Pine/Subtle
                    keyword = "#5b7a91",      -- Dimmer Pine

                    -- Visual States
                    visual = "#2b2f34",       -- A very dark, subtle selection color
                    search = "#303d4f",       -- Darker search highlight

                    -- Feedback / Indicators
                    error = "#bf5069",        -- Dimmer Rose Pine Love
                    warning = "#cc9d63",      -- Dimmer Rose Pine Gold
                    hint = "#677fc1",         -- Dimmer Rose Pine Iris
                    plus = "#6b8c56",         -- Dimmed green (adjusting your original)
                    delta = "#cc9d63",        -- Same as warning for consistency, or adjust as needed
                    type = "#7a9097",         -- Dimmer Foam/Subtle
                }
            })
        end
    },
}
