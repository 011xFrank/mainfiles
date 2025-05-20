local opt = vim.opt

opt.fileencoding = "utf-8"
opt.list = true
opt.listchars = {trail = '·', tab = '···', space = ' '}
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
opt.scrolloff = 10
opt.sidescrolloff = 5
opt.laststatus = 3
opt.timeoutlen = 400

-- Indenting
opt.expandtab = true
opt.shiftwidth = 4
opt.smartindent = true
opt.tabstop = 4
opt.softtabstop = 4
opt.autoindent = true

-- Numbers
opt.number = true
opt.relativenumber = true
opt.numberwidth = 2
opt.ruler = false

opt.swapfile = false
opt.backup = false
opt.undodir = os.getenv("HOME") .. "/.vim/undodir"
opt.undofile = true

-- Enable Vim's settings
vim.opt.compatible = false

-- Enable filetype plugins
vim.cmd('filetype plugin on')

-- Enable syntax highlighting
vim.cmd('syntax on')
