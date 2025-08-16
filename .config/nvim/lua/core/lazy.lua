local lazypath = vim.fn.stdpath "data" .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
	vim.fn.system {
		"git",
		"clone",
		"--filter=blob:none",
		"https://github.com/folke/lazy.nvim.git",
		"--branch=stable",
		lazypath,
	}
end
vim.opt.rtp:prepend(lazypath)

vim.g.mapleader = " "
vim.keymap.set({ "n", "v" }, "<Space>", "<Nop>", { silent = true })

require("lazy").setup({
	change_detection = { enabled = false, notify = false },
	spec = { import = "plugins" },
	ui = {
		border = "double",
		icons = {
			cmd = " ",
			config = "",
			event = " ",
			favorite = " ",
			ft = " ",
			init = " ",
			import = " ",
			keys = " ",
			lazy = "󰒲 ",
			loaded = " ",
			not_loaded = " ",
			plugin = " ",
			runtime = "󱑂 ",
			require = "󰢱 ",
			source = " ",
			start = "  ",
			task = "✔ ",
			list = {
				"●",
				"➜",
				"★",
				"‒",
			},
		}
	},
})
