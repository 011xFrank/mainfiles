vim.g.mapleader = " "
vim.g.localmapleader = " "

require("config.lazy")
require("config.options")
require("config.remaps")
require("config.autocmds")

vim.cmd("colorscheme vague")
