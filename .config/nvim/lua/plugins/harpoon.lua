return {
	"ThePrimeagen/harpoon",
	branch = "harpoon2",
	dependencies = { "nvim-lua/plenary.nvim" },
	opts = {
		settings = {
			save_on_toggle = true,
		},
	},
	keys = function()
		-- Require lazily inside functions so the plugin isn't loaded
		-- when lazy.nvim builds the keys table.
		local function harpoon()
			return require("harpoon")
		end

		local keys = {
			{
				"<leader>ha",
				function()
					harpoon():list():add()
				end,
				desc = "Harpoon: add file",
			},
			{
				"<leader>hh",
				function()
					harpoon().ui:toggle_quick_menu(harpoon():list(), {
						ui_max_width = vim.api.nvim_win_get_width(0) - 4,
					})
				end,
				desc = "Harpoon: quick menu",
			},
			{
				"<leader>hn",
				function()
					harpoon():list():next()
				end,
				desc = "Harpoon: next file",
			},
			{
				"<leader>hp",
				function()
					harpoon():list():prev()
				end,
				desc = "Harpoon: previous file",
			},
			{
				"<leader>hC",
				function()
					harpoon():list():clear()
				end,
				desc = "Harpoon: clear list",
			},
		}

		for i = 1, 5 do
			table.insert(keys, {
				"<leader>" .. i,
				function()
					harpoon():list():select(i)
				end,
				desc = "Harpoon: file " .. i,
			})
		end

		return keys
	end,
	config = function(_, opts)
		local harpoon = require("harpoon")
		harpoon:setup(opts)

		harpoon:extend({
			UI_CREATE = function(cx)
				local map = function(lhs, fn, desc)
					vim.keymap.set("n", lhs, fn, { buffer = cx.bufnr, desc = desc })
				end

				-- Ctrl+Space selects the file under the cursor.
				-- <C-@> is included because some terminals send Ctrl+Space as NUL.
				for _, lhs in ipairs({ "<C-Space>", "<C-@>" }) do
					map(lhs, function()
						harpoon.ui:select_menu_item()
					end, "Harpoon: open file under cursor")
				end

				map("<C-v>", function()
					harpoon.ui:select_menu_item({ vsplit = true })
				end, "Harpoon: open in vertical split")

				map("<C-x>", function()
					harpoon.ui:select_menu_item({ split = true })
				end, "Harpoon: open in horizontal split")

				map("<C-t>", function()
					harpoon.ui:select_menu_item({ tabedit = true })
				end, "Harpoon: open in new tab")
			end,
		})
	end,
}
