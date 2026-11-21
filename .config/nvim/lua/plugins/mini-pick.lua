return {
	"echasnovski/mini.pick",
	version = false,
	dependencies = {
		"echasnovski/mini.extra",
		"nvim-tree/nvim-web-devicons", -- optional, for file icons
	},
	keys = {
		{
			"<leader><leader>",
			function()
				require("mini.pick").builtin.files()
			end,
			desc = "Find files",
		},
		{
			"<leader>tg",
			function()
				require("mini.pick").builtin.grep_live()
			end,
			desc = "Live grep",
		},
		{
			"<leader>tb",
			function()
				require("mini.pick").builtin.buffers()
			end,
			desc = "Buffers",
		},
		{
			"<leader>th",
			function()
				require("mini.pick").builtin.help()
			end,
			desc = "Help tags",
		},
		-- carried over from the LSP config
		{
			"<leader>fd",
			function()
				require("mini.extra").pickers.diagnostic({ scope = "all" })
			end,
			desc = "Workspace diagnostics",
		},
		{
			"<leader>fr",
			function()
				require("mini.pick").builtin.resume()
			end,
			desc = "Resume last picker",
		},
	},
	config = function()
		require("mini.extra").setup()
		require("mini.pick").setup({
			mappings = {
				move_down = "<C-j>",
				move_up = "<C-k>",

				refine = "<M-c>",
				choose_ctrl_space = {
					char = "<C-Space>",
					func = function()
						vim.api.nvim_feedkeys(vim.keycode("<CR>"), "t", false)
					end,
				},
			},
		})

		-- replaces telescope-ui-select
		vim.ui.select = MiniPick.ui_select
	end,
}
