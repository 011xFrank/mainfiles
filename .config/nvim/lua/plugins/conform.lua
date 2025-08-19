return {
    'stevearc/conform.nvim',
    opts = {},
    config = function()
        require('conform').setup({
            formatters_by_ft = {
                javascript = { 'prettier' },
                typescript = { 'prettier' },
                javascriptreact = { 'prettier' },
                typescriptreact = { 'prettier' },
                json = { 'prettier' },
                html = { 'prettier' },
                css = { 'prettier' },
            },
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
        })
        -- Set up autoformat on save
        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = { "*.html", "*.css" },
            callback = function()
                vim.lsp.buf.format({ async = false })
            end,
        })

        -- Manual formatting keymap
        vim.keymap.set("n", "<leader>fm", vim.lsp.buf.format, { desc = "Format buffer" })
    end
}
