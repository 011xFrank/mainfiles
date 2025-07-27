return {
	"nvim-treesitter/nvim-treesitter", branch = 'master', lazy = false, build = ":TSUpdate",
	build = function()
		require("nvim-treesitter.install").update { with_sync = true }()
	end,
	event = "VeryLazy",
	config = function()
		require("nvim-treesitter.configs").setup {
			ensure_installed = {
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
				-- "ocaml",
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
			},
			sync_install = false,
			highlight = { enable = true },
			indent = {
				enable = true
			},
		}
	end,
}
