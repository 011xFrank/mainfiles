vim.g.mapleader = " "
local set = vim.keymap.set
local opts = { noremap = true, silent = true }

require("harpoon").setup()

set('n',"<leader>hm",":lua require('harpoon.mark').add_file() <CR>", opts)
set('n',"<leader>hM",":Telescope harpoon marks <CR>", opts)
set('n',"<leader>hp",":lua require('harpoon.ui').nav_prev() <CR>", opts)
set('n',"<leader>hn",":lua require('harpoon.ui').nav_next() <CR>", opts)
