return {
    "nvim-lualine/lualine.nvim",
    config = function ()
        require('lualine').setup {
            options = {
                theme = 'auto', -- or your preferred theme
                component_separators = { left = '|', right = '|'},
                section_separators = { left = '', right = ''},
            },
            sections = {
                lualine_a = {'mode'},
                lualine_b = {
                    {
                        'filename',
                        path = 1, -- 0 = just filename, 1 = relative path, 2 = absolute path
                    }
                },
                lualine_c = {
                    {
                        function()
                            -- Get active LSP clients
                            local clients = vim.lsp.get_active_clients({ bufnr = 0 })
                            if next(clients) == nil then
                                return 'No LSP'
                            end

                            local client_names = {}
                            for _, client in ipairs(clients) do
                                table.insert(client_names, client.name)
                            end
                            return 'LSP: ' .. table.concat(client_names, ', ')
                        end,
                        icon = '', -- Optional icon
                    }
                },
                lualine_x = {'filetype'},
                lualine_y = {'progress'},
                lualine_z = {'location'}
            }
        }
    end
}
