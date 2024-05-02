local opt = vim.opt

opt.fileencoding = "utf-8"
opt.background = "dark"
opt.clipboard:append("unnamedplus")
opt.fillchars = { eob = " " }
opt.mouse = "a"
opt.signcolumn = "yes"
opt.backspace = "indent,eol,start"

opt.hlsearch = false
opt.wrap = false
opt.showmode = false
opt.cursorline = false
opt.ignorecase = true
opt.smartcase = true
opt.splitbelow = true
opt.splitright = true
opt.termguicolors = true
opt.undofile = true

opt.updatetime = 200
opt.scrolloff = 15
opt.sidescrolloff = 5
opt.laststatus = 3
opt.timeoutlen = 400

-- Indenting
opt.expandtab = true
opt.shiftwidth = 8
opt.smartindent = true
opt.tabstop = 8
opt.softtabstop = 8

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false


-- Enable Vim's settings
vim.opt.compatible = false

-- Enable filetype plugins
vim.cmd('filetype plugin on')

-- Enable syntax highlighting
vim.cmd('syntax on')
