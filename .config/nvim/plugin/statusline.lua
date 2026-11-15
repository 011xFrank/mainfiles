-- 1. Create a helper function to fetch active LSP servers for the current buffer
_G.get_lsp_status = function()
	-- Use get_clients (Neovim 0.10+) with a fallback to get_active_clients for older versions
	local get_clients = vim.lsp.get_clients or vim.lsp.get_active_clients
	local clients = get_clients({ bufnr = 0 })

	if #clients == 0 then
		return "No LSP" -- Displayed if no language server is attached
	end

	local names = {}
	for _, client in ipairs(clients) do
		table.insert(names, client.name)
	end

	return "LSP: " .. table.concat(names, ", ")
end

-- 2. Set the statusline combining the full path (%F) and the LSP status
vim.opt.statusline = "%F %m %r %= %{v:lua.get_lsp_status()}   %y   %l:%c   %p%%"
