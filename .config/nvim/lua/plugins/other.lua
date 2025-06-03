return {
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
        config = function ()
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
        config = function ()
            vim.keymap.set('n', '<F7>', vim.cmd.UndotreeToggle)
        end
    },

    {
        "numToStr/Comment.nvim",
        lazy = false,
        config = function ()
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
            { "<leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end, desc = "Flash" },
            { "<leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end, desc = "Flash Treesitter" },
            { "r", mode = "o", function() require("flash").remote() end, desc = "Remote Flash" },
            { "R", mode = { "o", "x" }, function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
            { "<c-s>", mode = { "c" }, function() require("flash").toggle() end, desc = "Toggle Flash Search" },
        },
    },

    {
        "j-hui/fidget.nvim",
        opts = {
            -- options
        },
        config = function ()
            require('fidget').setup(
                {
                    notification = {
                        window = {
                            normal_hl = "Comment",      -- Base highlight group in the notification window
                            winblend = 0,             -- Background color opacity in the notification window
                            border = "none",            -- Border around the notification window
                            zindex = 45,                -- Stacking priority of the notification window
                            max_width = 0,              -- Maximum width of the notification window
                            max_height = 0,             -- Maximum height of the notification window
                            x_padding = 1,              -- Padding from right edge of window boundary
                            y_padding = 0,              -- Padding from bottom edge of window boundary
                            align = "bottom",           -- How to align the notification window
                            relative = "editor",        -- What the notification window position is relative to
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
        "dnlhc/glance.nvim",
        config = function()
            require('glance').setup()

            vim.keymap.set('n', 'gd', '<CMD>Glance definitions<CR>')
            vim.keymap.set('n', 'gr', '<CMD>Glance references<CR>')
            vim.keymap.set('n', 'gy', '<CMD>Glance type_definitions<CR>')
            vim.keymap.set('n', 'gm', '<CMD>Glance implementations<CR>')
        end,
    }
}
