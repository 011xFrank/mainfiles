return {
    {
        "David-Kunz/jester",
        ft = { "javascript", "typescript" },
        keys = {
            { "<leader>jt", function() require("jester").run() end,      desc = "Run Jest test" },
            { "<leader>jf", function() require("jester").run_file() end, desc = "Run Jest file" },
            { "<leader>js", function() require("jester").run_last() end, desc = "Run last Jest test" },
        },
        config = function()
            require("jester").setup({
                cmd = "npm test -- --no-coverage",   -- run command
                identifiers = { "test", "it" },      -- used to identify tests
                prepend = { "describe" },            -- prepend describe blocks
                expressions = { "call_expression" }, -- tree-sitter query language
                path_to_jest_run = 'jest',
                path_to_jest_debug = 'jest',
            })
        end,
    },

    {
        "MaxMEllon/vim-jsx-pretty",
        ft = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
    },

    {
        "pmizio/typescript-tools.nvim",
        ft = { "typescript", "typescriptreact" },
        dependencies = { "nvim-lua/plenary.nvim", "neovim/nvim-lspconfig" },
        config = function()
            require("typescript-tools").setup({
                capabilities = require('blink.cmp').get_lsp_capabilities(),
                settings = {
                    separate_diagnostic_server = true,
                    publish_diagnostic_on = "insert_leave",
                    expose_as_code_action = {},
                    tsserver_path = nil,
                    tsserver_plugins = {},
                    tsserver_max_memory = "auto",
                    tsserver_format_options = {},
                    tsserver_file_preferences = {
                        includeInlayParameterNameHints = "all",
                        includeInlayParameterNameHintsWhenArgumentMatchesName = false,
                        includeInlayFunctionParameterTypeHints = true,
                        includeInlayVariableTypeHints = true,
                        includeInlayPropertyDeclarationTypeHints = true,
                        includeInlayFunctionLikeReturnTypeHints = true,
                        includeInlayEnumMemberValueHints = true,
                    },
                },
            })
        end,
    },

    {
        "windwp/nvim-ts-autotag",
        ft = {
            "html",
            "javascript",
            "typescript",
            "javascriptreact",
            "typescriptreact",
            "svelte",
            "vue",
            "tsx",
            "jsx",
        },
        config = function()
            require("nvim-ts-autotag").setup({
                opts = {
                    enable_close = true,
                    enable_rename = true,
                    enable_close_on_slash = false
                },
                per_filetype = {
                    ["html"] = {
                        enable_close = false
                    }
                }
            })
        end,
    },
}
