require'nvim-treesitter.configs'.setup {
	ensure_installed = { "c","cpp","python", "lua", "vim", "vimdoc", "query" },

	sync_install = false,

	auto_install = true,

	ignore_install = { "javascript" },

	highlight = {
		enable = true,
		additional_vim_regex_highlighting = false,
	},
	indent = { -- Configure indentation for Lua files
		enable = true,
		default_indent = 8,  -- Adjust this to 8 for 8 spaces
		lowercase = false,
	},
}
