return {
    { "L3MON4D3/LuaSnip", keys = {} },
    {
        "saghen/blink.cmp",
        dependencies = {
            "rafamadriz/friendly-snippets",
        },
        event = "InsertEnter",
        version = "*",
        config = function()
            -- local cmd = vim.cmd
            -- cmd('highlight Pmenu guibg=none')
            -- cmd('highlight PmenuExtra guibg=none')
            -- cmd('highlight FloatBorder guibg=none')
            -- cmd('highlight NormalFloat guibg=none')
            require("blink.cmp").setup({
                snippets = { preset = "luasnip" },
                signature = { enabled = true },
                appearance = {
                    use_nvim_cmp_as_default = false,
                    nerd_font_variant = "normal",
                },
                sources = {},
                keymap = {
                    -- Documentation scrolling (matching your nvim-cmp config)
                    ["<C-f>"] = { "scroll_documentation_up", "fallback" },
                    ["<C-d>"] = { "scroll_documentation_down", "fallback" },

                    -- Close completion menu
                    ["<C-e>"] = { "hide", "fallback" },

                    -- Confirm selection (matching your C-Space behavior)
                    ["<C-Space>"] = { "accept_and_enter", "fallback" },

                    -- Tab navigation (matching your Tab behavior)
                    ['<S-Tab>'] = { 'select_prev', 'fallback' },
                    ['<Tab>'] = { 'select_next', 'fallback' },
                },
                completion = {
                    menu = {
                        border = nil,
                        scrolloff = 1,
                        scrollbar = false,
                        draw = {
                            columns = {
                                { "kind_icon" },
                                { "label",      "label_description", gap = 1 },
                                { "kind" },
                                { "source_name" },
                            },
                        },
                    },
                    documentation = {
                        window = {
                            border = nil,
                            scrollbar = false,
                            winhighlight = 'Normal:BlinkCmpDoc,FloatBorder:BlinkCmpDocBorder,EndOfBuffer:BlinkCmpDoc',
                        },
                        auto_show = true,
                        auto_show_delay_ms = 500,
                    },
                    -- Configure acceptance behavior to match nvim-cmp
                    accept = {
                        auto_brackets = {
                            enabled = true,
                        },
                    },
                    list = {
                        selection = {
                            preselect = true, auto_insert = false
                        }
                    }
                },
            })

            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
