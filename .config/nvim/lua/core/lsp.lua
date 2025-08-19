vim.diagnostic.config({
        virtual_text = true, -- Now opt-in in 0.11
        signs = true,
        underline = true,
        update_in_insert = false,
        severity_sort = true,
        -- float = { border = "double" }
})

vim.lsp.enable({
        'clangd',
        'lua_ls',
        'pylsp',
        'html',
        'cssls',
        'tailwindcss',
        'emmet_language_server',
        'intelephense',
        'ts_ls',
        'phpactor'
})

-- Custom diagnostic signs (same as your original)
vim.diagnostic.config({
        signs = {
                text = {
                        [vim.diagnostic.severity.ERROR] = " ",
                        [vim.diagnostic.severity.WARN] = " ",
                        [vim.diagnostic.severity.HINT] = " ",
                        [vim.diagnostic.severity.INFO] = "",
                }
        }
})

-- LspAttach autocommand for keymaps and completion
vim.api.nvim_create_autocmd('LspAttach', {
        group = vim.api.nvim_create_augroup('UserLspConfig', {}),
        callback = function(ev)
                local client = vim.lsp.get_client_by_id(ev.data.client_id)
                local bufnr = ev.buf

                -- Your custom keymaps (preserved from original config)
                local opts = { noremap = true, silent = true, buffer = bufnr }

                vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
                vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
                vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
                vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
                vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
                vim.keymap.set("n", "<leader>A", vim.lsp.buf.code_action, opts)
        end,
})
