return {
	'stevearc/conform.nvim',
	opts = {},
	config = function()
		local conform = require('conform')

		conform.setup({
			formatters_by_ft = {
				javascript = { 'prettier' },
				python = { 'black','prettier' },
				typescript = { 'prettier' },
				javascriptreact = { 'prettier' },
				typescriptreact = { 'prettier' },
				json = { 'prettier' },
				html = { 'prettier' },
				css = { 'prettier' },
				php = { 'trim_whitespace' },
			},
			format_on_save = {
				timeout_ms = 3000, -- Increased from 500ms to avoid black timing out
				lsp_format = 'fallback',
			},
		})

		-- Manual formatting keymap using Conform
		vim.keymap.set('n', '<leader>fm', function()
			conform.format({
				async = true,
				timeout_ms = 3000,
				lsp_format = 'fallback',
			})
		end, { desc = 'Format buffer' })
	end,
}
