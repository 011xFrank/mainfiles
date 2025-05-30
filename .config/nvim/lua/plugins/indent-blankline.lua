return {
	"lukas-reineke/indent-blankline.nvim",
	main = "ibl",
	opts = {},
	dependencies = "tpope/vim-sleuth",
	config = function()
		require("ibl").setup({
			indent = {
				-- char = '🭲',
				char = "┆",
				-- char = '├'
			},
			scope = { enabled = false },
			exclude = {
				filetypes = {"lua", "python", "cpp", "c", "sh", "asm", "make", "gitconfig", "rust", "text" },
			},
		})
	end,
}
