vim.g.mapleader = " "
local set = vim.keymap.set
local opts = { noremap = true, silent = true }

-------------------------------------------------------------------------
set('n', '<leader>n', ":Neotree toggle <CR>")
-------------------------------------------------------------------------
set('n', '<leader>x', ":bd <CR>")
-------------------------------------------------------------------------
set('n','<UP>',"<C-w>k")
set('n','<DOWN>',"<C-w>j")
set('n','<RIGHT>',"<C-w>l")
set('n','<LEFT>',"<C-w>h")
-------------------------------------------------------------------------
set('n','<leader>-',":split <CR>")
set('n','<leader>=',":vsplit <CR>")
-------------------------------------------------------------------------
set('n','<ESC>',":nohlsearch <CR>")
-------------------------------------------------------------------------
set('n','<leader>r',":source <CR>")
-------------------------------------------------------------------------
set('n','V',"0v$");
set('n','Y',"v$")
-------------------------------------------------------------------------
set('n',"<leader>hm",":lua require('harpoon.mark').add_file() <CR>")
set('n',"<leader>hM",":Telescope harpoon marks <CR>")
set('n',"<leader>hp",":lua require('harpoon.ui').nav_prev() <CR>")
set('n',"<leader>hn",":lua require('harpoon.ui').nav_next() <CR>")
-------------------------------------------------------------------------
-- Move selected line / block of text in visual mode
set("v", "J", ":m '>+1<CR>gv=gv", opts)
set("v", "K", ":m '<-2<CR>gv=gv", opts)
-------------------------------------------------------------------------
-- Fast saving
set("n", "<Leader>w", ":write!<CR>", opts)
set("n", "<Leader>q", ":q!<CR>", opts)
-------------------------------------------------------------------------
-- better indenting
set("v", "<", "<gv")
set("v", ">", ">gv")
-------------------------------------------------------------------------
-- Select all
set("n", "<C-a>", "ggVG", opts)
