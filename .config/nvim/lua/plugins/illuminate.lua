return {
    "RRethy/vim-illuminate",
    config = function()
        -- default configuration
        require('illuminate').configure({
            -- providers: provider used to get references in the buffer, ordered by priority
            providers = {
                'lsp',
                -- 'treesitter',
                'regex',
            },
            filetypes_denylist = {
                'dirbuf',
                'dirvish',
                'fugitive',
            },
            under_cursor = true,
            min_count_to_highlight = 1,
            should_enable = function(bufnr) return true end,
            case_insensitive_regex = false,
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
}
