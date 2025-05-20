return {
    "nvim-lualine/lualine.nvim",
    config = function ()
        local kanagawa_paper = require("lualine.themes.kanagawa-paper-ink")

        local colors = {
            blue   = '#5E81AC',
            cyan   = '#88C0D0',
            black  = '#2E3440',
            white  = '#ECEFF4',
            red    = '#BF616A',
            violet = '#B48EAD',
            grey   = '#4C566A',
            green  = '#A3BE8C',
            orange = '#D08770',
        }

        local bubbles_theme = {
            normal = {
                a = { fg = colors.black, bg = colors.blue },
                b = { fg = colors.white, bg = colors.grey },
                c = { fg = colors.gery, bg = colors.black },
            },

            insert = { a = { fg = colors.black, bg = colors.green } },
            visual = { a = { fg = colors.black, bg = colors.violet } },
            replace = { a = { fg = colors.black, bg = colors.red } },

            inactive = {
                a = { fg = colors.white, bg = colors.black },
                b = { fg = colors.white, bg = colors.black },
                c = { fg = colors.black, bg = colors.black },
            },
        }

        require('lualine').setup {
            options = {
                theme = ash,
                component_separators = '',
                section_separators = { left = '', right = '' },
            },
            sections = {
                lualine_a = { { 'mode', separator = { left = '' }, right_padding = 2 } },
                lualine_b = { 'filename', 'branch' },
                lualine_c = {
                    '%=', --[[ add your center components here in place of this comment ]]
                },
                lualine_x = {},
                lualine_y = { 'filetype', 'progress' },
                lualine_z = {
                    { 'location', separator = { right = '' }, left_padding = 2 },
                },
            },
            inactive_sections = {
                lualine_a = { 'filename' },
                lualine_b = {},
                lualine_c = {},
                lualine_x = {},
                lualine_y = {},
                lualine_z = { 'location' },
            },
            tabline = {},
            extensions = {},
        }
    end
}
