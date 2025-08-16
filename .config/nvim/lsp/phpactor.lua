-- ~/.config/nvim/lua/lsp/php.lua

-- Define the on_attach function
local on_attach = function(client, bufnr)
    -- Keymaps for LSP functionality
    if client.name == 'phpactor' then
        local opts = { noremap = true, silent = true, buffer = bufnr }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, opts)
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, opts)
        vim.keymap.set('n', 'K', vim.lsp.buf.hover, opts)
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, opts)
        vim.keymap.set('n', '<C-k>', vim.lsp.buf.signature_help, opts)
        vim.keymap.set('n', '<leader>rn', vim.lsp.buf.rename, opts)
        vim.keymap.set('n', '<leader>ca', vim.lsp.buf.code_action, opts)
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, opts)
    end
end

-- Configure Phpactor using vim.lsp.config
return {
    cmd = { 'phpactor language-server' },
    filetypes = { 'php' },
    root_dir = function(fname)
        return vim.fs.root(fname, {
            'composer.json',
            '.git',
            '.phpactor.json',
            '.phpactor.yml'
        })
    end,
    on_attach = on_attach,
    init_options = {
        ['language_server_phpstan.enabled'] = false,
        ['language_server_psalm.enabled'] = false,
    }
}
