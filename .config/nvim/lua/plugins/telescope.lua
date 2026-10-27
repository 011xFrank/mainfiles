return {
	"nvim-telescope/telescope.nvim",
	-- Removed branch = "0.1.x" to use the latest master version
	dependencies = {
		"nvim-lua/plenary.nvim",
		{ "nvim-telescope/telescope-fzf-native.nvim", build = "make" },
		"nvim-tree/nvim-web-devicons",
		"folke/todo-comments.nvim",
	},
	config = function()
		local actions = require("telescope.actions")

		require("telescope").setup({
			defaults = {
				mappings = {
					i = {
						-- Map Ctrl+Space in insert mode to open the file
						["<C-Space>"] = actions.select_default,
					},
					n = {
						-- Map Ctrl+Space in normal mode to open the file
						["<C-Space>"] = actions.select_default,
					},
				},
			},
		})

		local builtin = require("telescope.builtin")
		vim.keymap.set("n", "<leader><leader>", builtin.find_files, {})
		vim.keymap.set("n", "<leader>tg", builtin.live_grep, {})
		vim.keymap.set("n", "<leader>tb", builtin.buffers, {})
		vim.keymap.set("n", "<leader>th", builtin.help_tags, {})
	end,
}
