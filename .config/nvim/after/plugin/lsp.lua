local keymap = vim.keymap
local opts = { noremap = true, silent = true }

local on_attach = function(client, bufnr)
    opts.buffer = bufnr

    opts.desc = "Show LSP declaration"
    keymap.set("n", "gd", vim.lsp.buf.declaration, opts)

    opts.desc = "Show documentation for what is under cursor"
    keymap.set("n", "K", vim.lsp.buf.hover, opts)

    opts.desc = "Restart LSP"
    keymap.set("n", "<leader>rs", ":LspRestart<CR>", opts)

    opts.desc = "Show line diagnostics"
    keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

    opts.desc = "See available code actions"
    keymap.set({ "n", "v" }, "<leader>ca",vim.lsp.buf.code_action, opts)

    opts.desc = "Smart rename"
    keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts) -- smart rename
end

----------------------------------------------------------------------------------

local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }

for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
end

----------------------------------------------------------------------------------

local cmp_nvim_lsp = require("cmp_nvim_lsp")
local capabilities = cmp_nvim_lsp.default_capabilities()
local lspconfig = require("lspconfig")

lspconfig["clangd"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
})

lspconfig["lua_ls"].setup({
    capabilities = capabilities,
    on_attach = on_attach,
    settings = { -- custom settings for lua
        Lua = {
            -- make the language server recognize "vim" global
            diagnostics = { globals = { "vim" }, },
            workspace = {
                -- make language server aware of runtime files
                library = {
                    [vim.fn.expand("$VIMRUNTIME/lua")] = true,
                    [vim.fn.stdpath("config") .. "/lua"] = true,
                },
            },
        },
    },
})

----------------------------------------------------------------------------------

local border = "double"

vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
    vim.lsp.handlers.hover, { border = border }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
    vim.lsp.handlers.signature_help, { border = border }
)

vim.diagnostic.config { float = { border=border } }

require('lspconfig.ui.windows').default_options = { border = border }

----------------------------------------------------------------------------------
