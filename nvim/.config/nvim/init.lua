local g = vim.g
local o = vim.o

-- Vim Options --
g.mapleader = ','
o.mouse = 'a'
o.wrap = false
o.number = true
o.signcolumn = 'yes'
o.smarttab = true
o.autoindent = true
o.smartindent = true
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = true
--o.mousemoveevent = true --will work in nvim 0.8+
o.splitbelow = true
o.splitright = true


require('user.plugins')
require('user.plugconf')
require('user.keybindings')


-- Color/Theme --
o.termguicolors = true
o.background = 'dark'
g.gruvbox_material_background = 'medium'
g.gruvbox_material_foreground = 'material'
g.gruvbox_material_disable_italic_comment = 1
g.gruvbox_material_better_performance = 1

vim.cmd [[colorscheme gruvbox-material]]
--vim.cmd [[set fillchars+=vert:\║]]            --unnecessary now
--vim.cmd [[highlight WinSeparator guibg=#282828, guifg=#5a524c]]
vim.cmd [[highlight WinSeparator guifg=#32302f guibg=#32302f]]

vim.cmd [[highlight NvimTreeNormal guibg=#212121]]
vim.cmd [[highlight NvimTreeEndOfBuffer guifg=#212121 guibg=#212121]]
--vim.cmd [[highlight NvimTreeWinSeparator guibg=#282828, guifg=#5a524c]]
vim.cmd [[highlight NvimTreeWinSeparator guifg=#32302f guibg=#32302f]]
