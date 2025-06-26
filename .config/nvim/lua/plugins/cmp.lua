return {
	{
		"hrsh7th/nvim-cmp",
		event = "InsertEnter",
		dependencies = {
			"L3MON4D3/LuaSnip",
			"onsails/lspkind.nvim",
			"saadparwaiz1/cmp_luasnip",
			"supermaven-inc/supermaven-nvim",
		},
		config = function()
			local cmp = require "cmp"
			local ls = require "luasnip"
			local lspkind = require "lspkind"

			require("luasnip/loaders/from_snipmate").lazy_load {
				paths = { "~/.config/home-manager/src/nvim/snippets" },
			}

			cmp.setup {
				sources = {
					{ name = "supermaven" },
					{ name = "nvim_lsp" },
					{ name = "luasnip" },
				},
				mapping = cmp.mapping.preset.insert {
					["<C-k>"] = cmp.mapping.select_prev_item(),
					["<C-j>"] = cmp.mapping.select_next_item(),
					["<C-f>"] = cmp.mapping.scroll_docs(-4),
					["<C-d>"] = cmp.mapping.scroll_docs(4),
					["<C-e>"] = cmp.mapping.close(),
					["<C-Space>"] = cmp.mapping.confirm {
						behavior = cmp.ConfirmBehavior.Insert,
						select = true,
					},
					["<Tab>"] = cmp.mapping(
						function(fallback)
							if cmp.visible() then
								cmp.select_next_item()
							elseif require("luasnip").expand_or_jumpable() then
								vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-expand-or-jump", true, true, true), "")
							else
								fallback()
							end
						end, { "i", "s",}
					),
					["<S-Tab>"] = cmp.mapping(
						function(fallback)
							if cmp.visible() then
								cmp.select_prev_item()
							elseif require("luasnip").jumpable(-1) then
								vim.fn.feedkeys(vim.api.nvim_replace_termcodes("<Plug>luasnip-jump-prev", true, true, true), "")
							else
								fallback()
							end
						end,{ "i", "s",}
					),
				},
				formatting = {
					format = lspkind.cmp_format {
						mode = "symbol",
						symbol_map = {
							Supermaven = "",
						},
					},
				},
				snippet = {
					expand = function(args)
						ls.lsp_expand(args.body)
					end,
				},
				window = {
					completion = cmp.config.window.bordered(),
					documentation = cmp.config.window.bordered(),
				},
			}
		end,
	},
	{
		"supermaven-inc/supermaven-nvim",
		config = function()
			require("supermaven-nvim").setup {
				disable_keymaps = true,
			}

			vim.keymap.set("i", "<C-j>", function()
				local suggestion = require "supermaven-nvim.completion_preview"

				if suggestion.has_suggestion() then
					suggestion.on_accept_suggestion()
				end
			end)
		end,
	},
}
