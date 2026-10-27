return {
	"williamboman/mason-lspconfig.nvim",
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = {
				ui = {
					border = {
						"╔", "═", "╗", "║", "╝", "═", "╚", "║",
					},
					icons = {
						package_pending = " ",
						package_installed = "󰄳 ",
						package_uninstalled = " ",
					},
				},
			},
		},
	},
	opts = {
		ensure_installed = {
			"ts_ls",
			"bashls",
			"lua_ls",
			"clangd",
			"pyright",
			"phpactor",
			"intelephense",
			"rust_analyzer", -- Fixed: underscore instead of hyphen
		},
	},
}
