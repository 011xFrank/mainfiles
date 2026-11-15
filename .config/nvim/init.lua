require("core.lazy")
require("core.autocmds")
require("core.keymaps")
require("core.lsp")
require("core.options")

-- vim.cmd("colorscheme koda-dark")
-- vim.cmd("colorscheme ember")
-- vim.cmd("colorscheme rose-pine-moon")
-- vim.cmd("colorscheme oxide")

vim.g.gruvbox_material_transparent_background = 2

vim.api.nvim_create_autocmd("ColorScheme", {
	pattern = "gruvbox-material",
	callback = function()
		local groups = { "NormalFloat", "FloatBorder", "FloatTitle" }
		for _, g in ipairs(groups) do
			vim.api.nvim_set_hl(0, g, { bg = "NONE" })
		end
		-- Optional: keep the border visible
		vim.api.nvim_set_hl(0, "FloatBorder", { bg = "NONE", fg = "#928374" })
	end,
})

vim.cmd.colorscheme("gruvbox-material")
