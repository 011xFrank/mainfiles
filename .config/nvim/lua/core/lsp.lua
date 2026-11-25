vim.lsp.enable({ "ts_ls", "bashls", "lua_ls", "intelephense", "pyright", "clangd", "phpactor" })

local keymap = vim.keymap -- for conciseness

-- Lazy wrapper so mini.extra is only required when a picker is actually used
local function lsp_pick(scope)
	return function()
		require("mini.extra").pickers.lsp({ scope = scope })
	end
end

local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require("blink.cmp").get_lsp_capabilities(capabilities)

vim.lsp.config("*", {
	capabilities = capabilities,
})

vim.api.nvim_create_autocmd("LspAttach", {
	group = vim.api.nvim_create_augroup("UserLspConfig", {}),
	callback = function(ev)
		local opts = { buffer = ev.buf, silent = true }

		opts.desc = "Show LSP references"
		keymap.set("n", "gr", lsp_pick("references"), opts)

		opts.desc = "Go to declaration"
		keymap.set("n", "gD", vim.lsp.buf.declaration, opts)

		opts.desc = "Show LSP definition"
		keymap.set("n", "gd", vim.lsp.buf.definition, opts)

		opts.desc = "Show LSP implementations"
		keymap.set("n", "gi", lsp_pick("implementation"), opts)

		opts.desc = "Show LSP type definitions"
		keymap.set("n", "gt", lsp_pick("type_definition"), opts)

		opts.desc = "Document symbols"
		keymap.set("n", "<leader>fs", lsp_pick("document_symbol"), opts)

		opts.desc = "Workspace symbols"
		keymap.set("n", "<leader>fS", lsp_pick("workspace_symbol"), opts)

		opts.desc = "See available code actions"
		keymap.set({ "n", "v" }, "<leader>ca", vim.lsp.buf.code_action, opts)

		opts.desc = "Smart rename"
		keymap.set("n", "<leader>rn", vim.lsp.buf.rename, opts)

		opts.desc = "Show buffer diagnostics"
		keymap.set("n", "<leader>D", function()
			require("mini.extra").pickers.diagnostic({ scope = "current" })
		end, opts)

		opts.desc = "Show workspace diagnostics"
		keymap.set("n", "<leader>fd", function()
			require("mini.extra").pickers.diagnostic({ scope = "all" })
		end, opts)

		opts.desc = "Show line diagnostics"
		keymap.set("n", "<leader>d", vim.diagnostic.open_float, opts)

		opts.desc = "Go to previous diagnostic"
		keymap.set("n", "[d", function()
			vim.diagnostic.jump({ count = -1, float = true })
		end, opts)

		opts.desc = "Go to next diagnostic"
		keymap.set("n", "]d", function()
			vim.diagnostic.jump({ count = 1, float = true })
		end, opts)

		opts.desc = "Show documentation for what is under cursor"
		keymap.set("n", "K", function()
			vim.lsp.buf.hover({ border = "rounded" })
		end, opts)
	end,
})

vim.lsp.inlay_hint.enable(false)

vim.diagnostic.config({
	signs = {
		text = {
			[vim.diagnostic.severity.ERROR] = "",
			[vim.diagnostic.severity.WARN] = "",
			[vim.diagnostic.severity.HINT] = "󰠠",
			[vim.diagnostic.severity.INFO] = "",
		},
	},
})

-- Replaces the stray hover()/signature_help() calls (see note 1)
vim.o.winborder = "single"
