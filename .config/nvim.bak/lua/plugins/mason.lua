return {
	"williamboman/mason.nvim",
	dependencies = {
		"williamboman/mason-lspconfig.nvim",
		"WhoIsSethDaniel/mason-tool-installer.nvim"
	},
	config = function()
		local mason = require("mason")
		local mason_lspconfig = require("mason-lspconfig")
		local mason_tool_installer = require("mason-tool-installer")

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

		mason_tool_installer.setup({
			ensure_installed = {
				"pylint",
				"black",
				"pylsp",
				"lua_ls",
				"clangd",
				"html",
				"cssls",
				"tailwindcss",
				"lua_ls",
				"emmet_language_server",
				"phpactor",
				-- "volar",
				"intelephense",
				"ts_ls",
			}
		})
	end,
}
