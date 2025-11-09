return {
    "folke/flash.nvim",
    -- Adopt the highly customized opts from the first example
    opts = {
        highlight = {
            backdrop = false,
        },
        jump = {
            autojump = true,
            nohlsearch = true,
        },
        labels = "asdfqwerzxcv", -- Crucial for left-hand jumping
        modes = {
            char = {
                char_actions = function()
                    return {
                        [";"] = "next",
                        ["F"] = "left",
                        ["f"] = "right",
                    }
                end,
                enabled = true,
                keys = { "f", "F", "t", "T", ";" },
                highlight = {
                    backdrop = false,
                },
                jump_labels = false,
                multi_line = true, -- Multi-line f/t/F/T motions
            },
            search = {
                enabled = true,
                highlight = {
                    backdrop = false,
                },
                jump = {
                    autojump = false, -- Only enable for jump(), not search
                },
            },
        },
        prompt = {
            win_config = { border = "none" },
        },
        search = {
            wrap = true,
        },
    },
    -- Keep your explicit key bindings
    keys = {
        { "<leader>s", mode = { "n", "x", "o" }, function() require("flash").jump() end,              desc = "Flash" },
        { "<leader>S", mode = { "n", "x", "o" }, function() require("flash").treesitter() end,        desc = "Flash Treesitter" },
        { "r",         mode = "o",               function() require("flash").remote() end,            desc = "Remote Flash" },
        { "R",         mode = { "o", "x" },      function() require("flash").treesitter_search() end, desc = "Treesitter Search" },
        { "<c-s>",     mode = { "c" },           function() require("flash").toggle() end,            desc = "Toggle Flash Search" },
    },
}
