return {
    'stevearc/conform.nvim',
    opts = {},
    config = function ()
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
