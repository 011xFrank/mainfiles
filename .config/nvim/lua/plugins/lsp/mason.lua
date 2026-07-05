return {
	"williamboman/mason-lspconfig.nvim",
	opts = {
		ensure_installed = {
			"ts_ls",
			"bashls",
			"lua_ls",
			"clangd",
			"pyright",
			"phpactor",
			"intelephense"
		}
	},
	dependencies = {
		{
			"williamboman/mason.nvim",
			opts = {
				ui = {
					icons = {
						package_pending = " ",
						package_installed = "󰄳 ",
						package_uninstalled = " ",
					}
				}
			},
		},
	},
	config = function()
		require("mason").setup({
			ui = {
				border = {
					"╔", "═", "╗", "║", "╝", "═", "╚", "║"
				}
			}
		})
	end
}
