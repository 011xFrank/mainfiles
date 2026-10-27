return {
	"nvim-treesitter/nvim-treesitter",
	branch = "main",
	lazy = false,
	build = ":TSUpdate",
	config = function()
		-- 1. Initialize the new top-level module
		require("nvim-treesitter").setup()

		-- 2. List the parsers you want installed
		local ensure_installed = {
			"arduino",
			"php",
			"astro",
			"bash",
			"c",
			"clojure",
			"cpp",
			"css",
			"elixir",
			"gdscript",
			"gleam",
			"go",
			"haskell",
			"heex",
			"html",
			"hyprlang",
			"java",
			"javascript",
			"json",
			"lua",
			"make",
			"markdown",
			"markdown_inline",
			"nix",
			"python",
			"rust",
			"sql",
			"svelte",
			"tcl",
			"tsx",
			"typescript",
			"typst",
			"verilog",
			"yaml",
		}

		-- 3. Automatically install any missing parsers
		local already_installed = require("nvim-treesitter.config").get_installed()
		local parsers_to_install = vim.iter(ensure_installed):filter(function(parser)
			return not vim.tbl_contains(already_installed, parser)
		end):totable()

		if #parsers_to_install > 0 then
			require("nvim-treesitter").install(parsers_to_install)
		end
	end,
	init = function()
		-- 4. Enable native syntax highlighting and indentation on FileType
		vim.api.nvim_create_autocmd("FileType", {
			callback = function()
				pcall(vim.treesitter.start)
				vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
			end,
		})
	end,
}
