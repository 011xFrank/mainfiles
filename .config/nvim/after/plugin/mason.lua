local mason = require("mason")
local mason_lspconfig = require("mason-lspconfig")

mason.setup({
    ui = {
        border = "double",
        icons = {
            package_pending = "󰝦",
            package_installed = "󰄳",
            package_uninstalled = " 󰚌",
        },

        keymaps = {
            toggle_server_expand = "<CR>",
            install_server = "i",
            update_server = "u",
            check_server_version = "c",
            update_all_servers = "U",
            check_outdated_servers = "C",
            uninstall_server = "X",
            cancel_installation = "<C-c>",
        },
    },

})

mason_lspconfig.setup ({
    ensure_installed = {
        "lua_ls",
        "clangd"
    },

    max_concurrent_installers = 10,

    automatic_installation = false,
})
