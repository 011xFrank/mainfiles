return {
    {
        "sainnhe/gruvbox-material",
        -- enabled = false,
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
                    Normal = { bg = "#000000" },
                    Cursor = { bg = "#ffffff" },
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
        enabled = false,
        lazy = false,
        priority = 1000,
        config = function()
            require("ash").setup {
                compile_path = vim.fn.stdpath("cache") .. "/ash",

                transparent = true,   -- transparent background
                term_colors = true,   -- terminal colors (e.g. g:terminal_color_x)
                no_italic = false,    -- disable italics
                no_bold = false,      -- disable bold
                no_underline = false, -- disable underlines

                -- override style groups
                -- e.g. comments = { "italic", "bold" }
                styles = {
                    comments = {},
                    conditionals = {},
                    loops = {},
                    functions = {},
                    keywords = { "bold" },
                    strings = { "italic" },
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
        enabled = false,
        priority = 1000,
        opts = {},
        config = function()
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
    },

    {
        "vague2k/vague.nvim",
        enabled = false,
        lazy = false,
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
                    strings = "none",
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
                    bg = "#0f0e15",          -- Dimmer than your current and Rose Pine's base
                    fg = "#b8b5cb",          -- Dimmer version of Rose Pine Text
                    floatBorder = "#5d5c70", -- Muted and slightly darker than Rose Pine Muted
                    line = "#1a1920",        -- Darker version of a subtle line color
                    comment = "#535069",     -- Darker, desaturated purple-gray, like Rose Pine Muted but dimmer

                    -- Syntax / Semantic Highlighting (inspired by Rose Pine hues, but dimmed)
                    builtin = "#7c9baa",   -- Dimmed Rose Pine Foam/Pine blend
                    func = "#a66b7d",      -- Dimmed Rose Pine Love/Rose
                    string = "#b98c6b",    -- Dimmed Rose Pine Gold
                    number = "#af8051",    -- Dimmer Gold/Orange
                    property = "#9b9aac",  -- Dimmer Subtle/Text
                    constant = "#8e8eaf",  -- Dimmer Iris/Text
                    parameter = "#9b7f9d", -- Dimmer Iris/Love
                    operator = "#78879b",  -- Dimmer Pine/Subtle
                    keyword = "#5b7a91",   -- Dimmer Pine

                    -- Visual States
                    visual = "#2b2f34", -- A very dark, subtle selection color
                    search = "#303d4f", -- Darker search highlight

                    -- Feedback / Indicators
                    error = "#bf5069",   -- Dimmer Rose Pine Love
                    warning = "#cc9d63", -- Dimmer Rose Pine Gold
                    hint = "#677fc1",    -- Dimmer Rose Pine Iris
                    plus = "#6b8c56",    -- Dimmed green (adjusting your original)
                    delta = "#cc9d63",   -- Same as warning for consistency, or adjust as needed
                    type = "#7a9097",    -- Dimmer Foam/Subtle
                }
            })
        end
    },

    {
        "neanias/everforest-nvim",
        enabled = false,
        version = false,
        lazy = false,
        priority = 1000, -- make sure to load this before all the other start plugins
        -- Optional; default configuration will be used if setup isn't called.
        config = function()
            require("everforest").setup({
                ---Controls the "hardness" of the background. Options are "soft", "medium" or "hard".
                ---Default is "medium".
                background = "medium",
                ---How much of the background should be transparent. 2 will have more UI
                ---components be transparent (e.g. status line background)
                transparent_background_level = 2,
                ---Whether italics should be used for keywords and more.
                italics = false,
                ---Disable italic fonts for comments. Comments are in italics by default, set
                ---this to `true` to make them _not_ italic!
                disable_italic_comments = false,
                ---By default, the colour of the sign column background is the same as the as normal text
                ---background, but you can use a grey background by setting this to `"grey"`.
                sign_column_background = "none",
                ---The contrast of line numbers, indent lines, etc. Options are `"high"` or
                ---`"low"` (default).
                ui_contrast = "low",
                ---Dim inactive windows. Only works in Neovim. Can look a bit weird with Telescope.
                ---
                ---When this option is used in conjunction with show_eob set to `false`, the
                ---end of the buffer will only be hidden inside the active window. Inside
                ---inactive windows, the end of buffer filler characters will be visible in
                ---dimmed symbols. This is due to the way Vim and Neovim handle `EndOfBuffer`.
                dim_inactive_windows = false,
                ---Some plugins support highlighting error/warning/info/hint texts, by
                ---default these texts are only underlined, but you can use this option to
                ---also highlight the background of them.
                diagnostic_text_highlight = false,
                ---Which colour the diagnostic text should be. Options are `"grey"` or `"coloured"` (default)
                diagnostic_virtual_text = "coloured",
                ---Some plugins support highlighting error/warning/info/hint lines, but this
                ---feature is disabled by default in this colour scheme.
                diagnostic_line_highlight = false,
                ---By default, this color scheme won't colour the foreground of |spell|, instead
                ---colored under curls will be used. If you also want to colour the foreground,
                ---set this option to `true`.
                spell_foreground = false,
                ---Whether to show the EndOfBuffer highlight.
                show_eob = true,
                ---Style used to make floating windows stand out from other windows. `"bright"`
                ---makes the background of these windows lighter than |hl-Normal|, whereas
                ---`"dim"` makes it darker.
                ---
                ---Floating windows include for instance diagnostic pop-ups, scrollable
                ---documentation windows from completion engines, overlay windows from
                ---installers, etc.
                ---
                ---NB: This is only significant for dark backgrounds as the light palettes
                ---have the same colour for both values in the switch.
                float_style = "bright",
                ---Inlay hints are special markers that are displayed inline with the code to
                ---provide you with additional information. You can use this option to customize
                ---the background color of inlay hints.
                ---
                ---Options are `"none"` or `"dimmed"`.
                inlay_hints_background = "none",
                ---You can override specific highlights to use other groups or a hex colour.
                ---This function will be called with the highlights and colour palette tables.
                ---@param highlight_groups Highlights
                ---@param palette Palette
                on_highlights = function(highlight_groups, palette) end,
                ---You can override colours in the palette to use different hex colours.
                ---This function will be called once the base and background colours have
                ---been mixed on the palette.
                ---@param palette Palette
                colours_override = function(palette) end,
            })
        end,
    }
}
