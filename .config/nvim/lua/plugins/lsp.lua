-- Migrated LSP configuration for Neovim 0.11
-- This replaces your nvim-lspconfig plugin setup

return {
	-- You can now remove nvim-lspconfig dependency entirely, or keep it minimal
	-- for any remaining servers that don't have native configs yet
	{
		"antosha417/nvim-lsp-file-operations",
		config = true
	},
	-- Main LSP configuration
	{
		name = "native-lsp-config",
		dir = vim.fn.stdpath("config"), -- Dummy plugin to run our config
		config = function()
			-- Global floating window border (replaces the old handler method)
			-- vim.o.winborder = 'single'

			-- Diagnostic configuration
			vim.diagnostic.config({
				virtual_text = true, -- Now opt-in in 0.11
				signs = true,
				underline = true,
				update_in_insert = false,
				severity_sort = true,
				-- float = { border = "double" }
			})

			vim.lsp.enable({
				'clangd',
				'lua_ls',
				'pylsp',
				'html',
				'cssls',
				'tailwindcss',
				'emmet_language_server',
				'intelephense',
				'ts_ls',
				'phpactor'
			})

			-- Custom diagnostic signs (same as your original)
			local signs = { Error = " ", Warn = " ", Hint = "󰠠 ", Info = " " }
			for type, icon in pairs(signs) do
				local hl = "DiagnosticSign" .. type
				vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
			end

			-- LspAttach autocommand for keymaps and completion
			vim.api.nvim_create_autocmd('LspAttach', {
				group = vim.api.nvim_create_augroup('UserLspConfig', {}),
				callback = function(ev)
					local client = vim.lsp.get_client_by_id(ev.data.client_id)
					local bufnr = ev.buf

					-- Your custom keymaps (preserved from original config)
					local opts = { noremap = true, silent = true, buffer = bufnr }

					vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
					vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
					vim.keymap.set("n", "[d", vim.diagnostic.goto_next, opts)
					vim.keymap.set("n", "]d", vim.diagnostic.goto_prev, opts)
					vim.keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)
					vim.keymap.set("n", "<leader>A",vim.lsp.buf.code_action, opts)

					-- Note: 0.11 adds these as defaults, but your custom ones will take precedence:
					-- grn - vim.lsp.buf.rename()
					-- grr - vim.lsp.buf.references() 
					-- gri - vim.lsp.buf.implementation()
					-- gO  - vim.lsp.buf.document_symbol()
					-- gra - vim.lsp.buf.code_action()
				end,
			})
		end
	}
}
