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
            vim.cmd('highlight Pmenu guibg=none')
            vim.cmd('highlight PmenuExtra guibg=none')
            vim.cmd('highlight FloatBorder guibg=none')
            vim.cmd('highlight NormalFloat guibg=none')
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
                    ["<C-Space>"] = { "accept", "fallback" },

                    -- Tab navigation (matching your Tab behavior)
                    ["<Tab>"] = {
                        function(cmp)
                            if cmp.is_visible() then
                                return cmp.select_next()
                            elseif require("luasnip").expand_or_jumpable() then
                                return require("luasnip").expand_or_jump()
                            else
                                return false -- fallback
                            end
                        end,
                        "fallback"
                    },

                    -- Shift-Tab navigation (matching your S-Tab behavior)
                    ["<S-Tab>"] = {
                        function(cmp)
                            if cmp.is_visible() then
                                return cmp.select_prev()
                            elseif require("luasnip").jumpable(-1) then
                                return require("luasnip").jump(-1)
                            else
                                return false -- fallback
                            end
                        end,
                        "fallback"
                    },

                    -- Enter key (matching your CR behavior - only confirm if manually selected)
                    ["<CR>"] = { "accept", "fallback" },
                },
                cmdline = {
                    enabled = false,
                    completion = { menu = { auto_show = true } },
                    keymap = {
                        ["<C-Space>"] = { "accept_and_enter", "fallback" },
                    },
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
                },
            })
            require("luasnip.loaders.from_vscode").lazy_load()
        end,
    },
}
