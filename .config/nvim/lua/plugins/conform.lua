return {
    "stevearc/conform.nvim",
    event = {"BufReadPre", "BufNewFile"},
    config = function ()
        local conform = require("conform")

        conform.setup({
            formatters_by_ft = {
                lua = {"stylua"},
                -- python = {"isort", "black"}
            }
        })

        vim.api.nvim_create_autocmd("BufWritePre", {
            pattern = "*",
            callback = function(args)
                require("conform").format({ bufnr = args.buf })
            end,
        })
    end
}
