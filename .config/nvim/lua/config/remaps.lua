vim.g.mapleader = " "

local set = vim.keymap.set
local opts = { noremap = true, silent = true }

-------------------------------------------------------------------------
set('i', 'jk', "<ESC>")

-- Window navigation
set('n','<leader>wk',"<C-w>k", opts)
set('n','<leader>wj',"<C-w>j", opts)
set('n','<leader>wl',"<C-w>l", opts)
set('n','<leader>wh',"<C-w>h", opts)
-------------------------------------------------------------------------
-- Splitting Windows
set('n','<leader>w-',"<cmd> split <CR>", opts)
set('n','<leader>w=',"<cmd> vsplit <CR>", opts)
-------------------------------------------------------------------------
-- Highlight the whole line
set('n','V',"0v$", opts);

-- Highlight the rest of the line
set('n','Y',"v$", opts)
-------------------------------------------------------------------------
-- Move selected line / block of text in visual mode
set("v", "J", ":m '>+1<CR>gv=gv", opts)
set("v", "K", ":m '<-2<CR>gv=gv", opts)
-------------------------------------------------------------------------
-- Buffer Operations
set("n", "<Leader>w", "<cmd> write!<CR>", opts)
set("n", "<Leader>q", "<cmd> q!<CR>", opts)
set('n', '<leader>x', "<cmd> bd <CR>", opts)
-------------------------------------------------------------------------
-- Select all
set("n", "<leader>a", "ggVG", opts)
-------------------------------------------------------------------------
-- Others
set('n','<ESC>',"<cmd> nohlsearch <CR>", opts)
set('n','<leader>r',"<cmd> source <CR>", opts)
-------------------------------------------------------------------------
set("n","p", function ()
        local row, col = unpack(vim.api.nvim_win_get_cursor(0))
        vim.cmd('put')
        vim.api.nvim_win_set_cursor(0, {row + 1, col})
end)
-------------------------------------------------------------------------
