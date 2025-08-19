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
				-- Python tools
				-- "pylint",
				-- "black",
				-- "pylsp",

				-- Web Development Language Servers
				"html-lsp",        -- HTML language server
				"css-lsp",         -- CSS language server
				"typescript-language-server", -- JavaScript/TypeScript
				"eslint-lsp",      -- JavaScript/TypeScript linting
				"emmet-language-server", -- Emmet abbreviations
				"tailwindcss-language-server", -- Tailwind CSS

				-- JavaScript/TypeScript Formatters & Linters
				"prettier", -- Code formatter for JS/TS/HTML/CSS
				"eslint_d", -- Fast ESLint daemon
				"js-debug-adapter", -- JavaScript debugger

				-- CSS Tools
				"stylelint", -- CSS linter
				"stylelint-lsp", -- Stylelint language server

				-- Other Language Servers
				"lua-language-server",
				"clangd",

				-- PHP language server
				"intelephense", -- PHP language server
				"phpactor"
			}
		})
	end,
}
