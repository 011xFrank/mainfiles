return {
	{
		"bjarneo/ash.nvim",
		priority = 1000,
	},
	{
		"ember-theme/nvim",
		name = "ember",
		priority = 1000,
		config = function()
			require("ember").setup({
				variant = "ember", -- "ember", "ember-soft", "ember-light", "ember-auto"
				styles = {
					comments = { italic = false },
					keywords = { bold = true, italic = false },
					functions = { italic = false },
					types = { bold = true, italic = false },
				},
				transparent = true, -- transparent editor background
				transparent_floats = nil, -- follows `transparent` by default; set explicitly to override
				dark_variant = "ember", -- used by `ember-auto` when background = "dark"
				light_variant = "ember-light", -- used by `ember-auto` when background = "light"
				on_colors = nil, -- function(palette) - modify palette before theme builds
				on_highlights = nil, -- function(highlights, theme) - modify highlight groups
			})
		end,
	},
	{
		"sainnhe/gruvbox-material",
		lazy = false,
		priority = 1000,
		config = function()
			vim.g.gruvbox_material_enable_italic = true
			vim.g.gruvbox_material_transparent_background = 2
			vim.g.gruvbox_material_float_style = "dim" -- "bright" (default) or "dim"
		end,
	},
	{
		"oxidescheme/nvim",
		name = "oxide",
		lazy = false,
		priority = 1000,
		config = function()
			require("oxide").setup({
				transparent = true, -- Enable transparent background
				terminal_colors = true, -- Configure terminal colors

				styles = {
					comments = { italic = true },
					keywords = { bold = true },
					functions = {},
					variables = {},
					strings = {},
					booleans = {},
					numbers = {},
				},

				-- Override colors
				on_colors = function(colors)
					colors.red = "#ff0000" -- Make red more intense
				end,

				-- Override highlight groups
				on_highlights = function(highlights, colors)
					highlights.Comment = { fg = colors.green, italic = true }
				end,
			})
		end,
	},
	-- example lazy.nvim install setup
	{
		"slugbyte/lackluster.nvim",
		lazy = false,
		priority = 1000,
		config = function()
			local lackluster = require("lackluster")
			lackluster.setup({
				-- You can overwrite the following syntax colors by setting them to one of...
				--   1) a hexcode like "#a1b2c3" for a custom color.
				--   2) "default" or nil will just use whatever lackluster's default is.
				tweak_syntax = {
					string = "default",
					-- string = "#a1b2c3", -- custom hexcode
					-- string = color.green, -- lackluster color
					string_escape = "default",
					comment = "default",
					builtin = "default", -- builtin modules and functions
					type = "default",
					keyword = "default",
					keyword_return = "default",
					keyword_exception = "default",
				},
				-- You can overwrite the following background colors by setting them to one of...
				--   1) a hexcode like "#a1b2c3" for a custom color
				--   2) "none" for transparency
				--   3) "default" or nil will just use whatever lackluster's default is.
				tweak_background = {
					-- normal = "default", -- main background
					normal = "none", -- transparent
					-- normal = '#a1b2c3',    -- hexcode
					-- normal = color.green,    -- lackluster color
					telescope = "none", -- telescope
					menu = "none", -- nvim_cmp, wildmenu ... (bad idea to transparent)
					popup = "none", -- lazy, mason, whichkey ... (bad idea to transparent)
				},
			})
		end,
	},
	{
		"rose-pine/neovim",
		name = "rose-pine",
		config = function()
			require("rose-pine").setup({
				variant = "moon", -- auto, main, moon, or dawn
				dark_variant = "moon", -- main, moon, or dawn
				dim_inactive_windows = false,
				extend_background_behind_borders = true,

				enable = {
					terminal = true,
					legacy_highlights = true, -- Improve compatibility for previous versions of Neovim
					migrations = true, -- Handle deprecated options automatically
				},

				styles = {
					bold = true,
					italic = true,
					transparency = true,
				},

				groups = {
					border = "muted",
					link = "iris",
					panel = "surface",

					error = "love",
					hint = "iris",
					info = "foam",
					note = "pine",
					todo = "rose",
					warn = "gold",

					git_add = "foam",
					git_change = "rose",
					git_delete = "love",
					git_dirty = "rose",
					git_ignore = "muted",
					git_merge = "iris",
					git_rename = "pine",
					git_stage = "iris",
					git_text = "rose",
					git_untracked = "subtle",

					h1 = "iris",
					h2 = "foam",
					h3 = "rose",
					h4 = "gold",
					h5 = "pine",
					h6 = "foam",
				},

				palette = {
					-- Override the builtin palette per variant
					-- moon = {
					--     base = '#18191a',
					--     overlay = '#363738',
					-- },
				},

				-- NOTE: Highlight groups are extended (merged) by default. Disable this
				-- per group via `inherit = false`
				highlight_groups = {
					-- Comment = { fg = "foam" },
					-- StatusLine = { fg = "love", bg = "love", blend = 15 },
					-- VertSplit = { fg = "muted", bg = "muted" },
					-- Visual = { fg = "base", bg = "text", inherit = false },
				},

				before_highlight = function(group, highlight, palette)
					-- Disable all undercurls
					-- if highlight.undercurl then
					--     highlight.undercurl = false
					-- end
					--
					-- Change palette colour
					-- if highlight.fg == palette.pine then
					--     highlight.fg = palette.foam
					-- end
				end,
			})

			vim.cmd("colorscheme rose-pine")
			-- vim.cmd("colorscheme rose-pine-main")
			-- vim.cmd("colorscheme rose-pine-moon")
			-- vim.cmd("colorscheme rose-pine-dawn")
		end,
	},
}
