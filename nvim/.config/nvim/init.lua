local g = vim.g
local o = vim.o
local opt = vim.opt

-- Vim Options --
g.mapleader = ','
o.mouse = 'a'
o.termguicolors = true
o.fileencoding = 'utf-8'
o.wrap = true
o.number = true
o.relativenumber = true
o.cursorline = true
o.cursorlineopt = 'number'
o.signcolumn = 'yes'
o.undofile = true

o.autoindent = true
o.smartindent = true
o.smarttab = true
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true

o.mousemoveevent = true
o.splitbelow = true
o.splitright = true
o.cmdheight = 0
o.laststatus = 3
o.updatetime = 50
o.hidden = true
o.scrolloff = 8
o.sidescrolloff = 8
o.incsearch = true
o.hlsearch = true

opt.shortmess:append('c') --don't show redundant ins-completion-menu messages
opt.shortmess:append('I') --don't show intro message

require('user.plugins')
require('user.plugconf')
require('user.keybindings')
require('user.colorscheme')
