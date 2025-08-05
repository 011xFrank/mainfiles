local blink = require("blink.cmp")

local phpactor = {
    cmd = { 'phpactor', 'language-server' },
    root_markers = { 'composer.json', '.phpactor.json', '.phpactor.yml', '.git' },
    filetypes = { 'php' },
    init_options = {
        ["language_server_phpstan.enabled"] = false,
        ["language_server_psalm.enabled"] = false,
        ["code_transform.import_globals"] = true,
        ["completion_worse_limit"] = 1000,
    },
    settings = {
        phpactor = {
            files = {
                maxSize = 5000000,
            },
        },
    },
}

local intelephense = {
    cmd = { "intelephense", "--stdio" },
    filetypes = { "php", "blade" },
    root_markers = { "composer.json", ".git" },
    capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        blink.get_lsp_capabilities()
    ),
}

return {
    phpactor = phpactor,
    intelephense = intelephense
}
