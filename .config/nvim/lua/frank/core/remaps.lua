vim.g.mapleader = " "

local set = vim.keymap.set
local opts = { noremap = true, silent = true }

-------------------------------------------------------------------------
-- Toggle Neotree
set('n', '<leader>n', ":Neotree toggle <CR>", opts)
-------------------------------------------------------------------------
-- Window navigation
set('n','<leader>wk',"<C-w>k", opts)
set('n','<leader>wj',"<C-w>j", opts)
set('n','<leader>wl',"<C-w>l", opts)
set('n','<leader>wh',"<C-w>h", opts)
-------------------------------------------------------------------------
-- Splitting Windows
set('n','<leader>-',":split <CR>", opts)
set('n','<leader>=',":vsplit <CR>", opts)
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
set("n", "<Leader>w", ":write!<CR>", opts)
set("n", "<Leader>q", ":q!<CR>", opts)
set('n', '<leader>x', ":bd <CR>", opts)
-------------------------------------------------------------------------
-- Select all
set("n", "<leader>a", "ggVG", opts)
-------------------------------------------------------------------------
-- Others
set('n','<ESC>',":nohlsearch <CR>", opts)
set('n','<leader>r',":source <CR>", opts)
-------------------------------------------------------------------------
