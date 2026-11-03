return {
	"vague-theme/vague.nvim",
	config = function()
		require("vague").setup({
			transparent = true, -- If true, background is not set
			bold = true, -- Disable bold globally
			italic = true, -- Disable italic globally
			on_highlights = function(hl, colors) end,
			colors = {
				bg = "#0d0d0f",
				inactiveBg = "#121216",
				fg = "#b8b8b8",
				floatBorder = "#686868",
				line = "#1a1a21",
				comment = "#4d4d63",
				builtin = "#9abfba",
				func = "#b06d6d",
				string = "#d49d70",
				number = "#cc8e51",
				property = "#afafc2",
				constant = "#9a9bc0",
				parameter = "#a688a6",
				visual = "#26292b",
				error = "#c24e68",
				warning = "#dea665",
				hint = "#6782d4",
				operator = "#7c8c9e",
				keyword = "#597f9c",
				type = "#849da4",
				search = "#313d4f",
				plus = "#6b8f4f",
				delta = "#dea665",
			},
		})
	end,
}
