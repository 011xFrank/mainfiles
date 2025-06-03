vim.g.mapleader = " "
vim.g.localmapleader = " "

vim.g.loaded_netrwPlugin = 1
vim.g.loaded_netrw = 1

require("config.lazy")
require("config.options")
require("config.remaps")
require("config.autocmds")

-- vim.cmd('highlight LineNr guifg=#7f8497')
