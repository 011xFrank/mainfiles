return {
    {
        'echasnovski/mini.icons', version = '*'
    },
    {
        "tpope/vim-sleuth"
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    {
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    },

    {
        "meznaric/key-analyzer.nvim",
        config = function()
            require("key-analyzer").setup()
        end
    },

    {
        "kylechui/nvim-surround",
        version = "*", -- Use for stability: omit to use `main` branch for the latest features
        event = "VeryLazy",
        config = function()
            require("nvim-surround").setup()
        end
    },

    {
        "mbbill/undotree",
        config = function()
            vim.keymap.set('n', '<F7>', vim.cmd.UndotreeToggle)
        end
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        enabled = false,
        main = "ibl",
        opts = {},
        config = function()
            require("ibl").setup({
                indent = {
                    char = '┆'
                },
                scope = {
                    show_start = false
                }
            })
        end
    },

    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function()
            local comment = require("Comment")

            comment.setup({
                toggler = {
                    line = "<leader>/",
                },
                opleader = {
                    line = "<leader>/",
                    block = "<leader>/"
                }
            })
        end
    },

    {
        "folke/flash.nvim",
        ---@type Flash.Config
        opts = {},
        keys = {
            { "<leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
            { "<leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
            { "r",         mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
            { "R",         mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>",     mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
        },
    },

    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
        config = function()
            require('fidget').setup(
                {
                    notification = {
                        window = {
                            normal_hl = "Comment", -- Base highlight group in the notification window
                            winblend = 0,          -- Background color opacity in the notification window
                            border = "none",       -- Border around the notification window
                            zindex = 45,           -- Stacking priority of the notification window
                            max_width = 0,         -- Maximum width of the notification window
                            max_height = 0,        -- Maximum height of the notification window
                            x_padding = 1,         -- Padding from right edge of window boundary
                            y_padding = 0,         -- Padding from bottom edge of window boundary
                            align = "bottom",      -- How to align the notification window
                            relative = "editor",   -- What the notification window position is relative to
                        },
                    },
                }
            )
        end
    },

    {
        "lewis6991/gitsigns.nvim",
        config = function()
            require("gitsigns").setup({
                signs = {
                    add = { text = "│" },
                    change = { text = "│" },
                    delete = { text = "" },
                    topdelete = { text = "" },
                    changedelete = { text = "~" },
                    untracked = { text = "│" },
                },
            })
        end
    },

    {
        "RRethy/vim-illuminate",
        config = function()
            -- default configuration
            require('illuminate').configure({
                -- providers: provider used to get references in the buffer, ordered by priority
                providers = {
                    'lsp',
                    'treesitter',
                    'regex',
                },
                -- delay: delay in milliseconds
                delay = 100,
                -- filetype_overrides: filetype specific overrides.
                -- The keys are strings to represent the filetype while the values are tables that
                -- supports the same keys passed to .configure except for filetypes_denylist and filetypes_allowlist
                filetype_overrides = {},
                -- filetypes_denylist: filetypes to not illuminate, this overrides filetypes_allowlist
                filetypes_denylist = {
                    'dirbuf',
                    'dirvish',
                    'fugitive',
                },
                -- filetypes_allowlist: filetypes to illuminate, this is overridden by filetypes_denylist
                -- You must set filetypes_denylist = {} to override the defaults to allow filetypes_allowlist to take effect
                filetypes_allowlist = {},
                -- modes_denylist: modes to not illuminate, this overrides modes_allowlist
                -- See `:help mode()` for possible values
                modes_denylist = {},
                -- modes_allowlist: modes to illuminate, this is overridden by modes_denylist
                -- See `:help mode()` for possible values
                modes_allowlist = {},
                -- providers_regex_syntax_denylist: syntax to not illuminate, this overrides providers_regex_syntax_allowlist
                -- Only applies to the 'regex' provider
                -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
                providers_regex_syntax_denylist = {},
                -- providers_regex_syntax_allowlist: syntax to illuminate, this is overridden by providers_regex_syntax_denylist
                -- Only applies to the 'regex' provider
                -- Use :echom synIDattr(synIDtrans(synID(line('.'), col('.'), 1)), 'name')
                providers_regex_syntax_allowlist = {},
                -- under_cursor: whether or not to illuminate under the cursor
                under_cursor = true,
                -- large_file_cutoff: number of lines at which to use large_file_config
                -- The `under_cursor` option is disabled when this cutoff is hit
                large_file_cutoff = 10000,
                -- large_file_config: config to use for large files (based on large_file_cutoff).
                -- Supports the same keys passed to .configure
                -- If nil, vim-illuminate will be disabled for large files.
                large_file_overrides = nil,
                -- min_count_to_highlight: minimum number of matches required to perform highlighting
                min_count_to_highlight = 1,
                -- should_enable: a callback that overrides all other settings to
                -- enable/disable illumination. This will be called a lot so don't do
                -- anything expensive in it.
                should_enable = function(bufnr) return true end,
                -- case_insensitive_regex: sets regex case sensitivity
                case_insensitive_regex = false,
                -- disable_keymaps: disable default keymaps
                disable_keymaps = false,
            })
            vim.api.nvim_create_autocmd('ColorScheme', {
                pattern = '*',
                callback = function()
                    vim.api.nvim_set_hl(0, 'IlluminatedWordText', { underline = true })
                    vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { underline = true })
                    vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { underline = true })
                end,
            })
        end
    },

    { { "shortcuts/no-neck-pain.nvim", version = "*" } }
}
