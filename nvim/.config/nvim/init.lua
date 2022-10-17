local g = vim.g
local o = vim.o
local opt = vim.opt

-- Vim Options --
g.mapleader = ','
o.mouse = 'a'
o.wrap = false
o.number = true
o.relativenumber = true
o.signcolumn = 'yes'
o.smarttab = true
o.autoindent = true
o.smartindent = true
o.tabstop = 4
o.shiftwidth = 4
o.expandtab = false
o.mousemoveevent = true
o.splitbelow = true
o.splitright = true
o.cmdheight = 0
o.laststatus = 3
o.updatetime = 100
o.hidden = true


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
-- g.gruvbox_material_diagnostic_line_highlight = 1 -- seems to not work with this color scheme setup
g.gruvbox_material_diagnostic_virtual_text = 'colored'


vim.cmd.colorscheme('gruvbox-material')
local config = vim.api.nvim_call_function('gruvbox_material#get_configuration', {})
local palette = vim.api.nvim_call_function('gruvbox_material#get_palette', {config.background, config.foreground, config.colors_override})
for k,v in pairs(palette) do palette[k] = v[1] end

-- navic
vim.api.nvim_set_hl(0, 'NavicIconsFile', { fg = palette.fg0, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsModule', { fg = palette.yellow, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsNamespace', { fg = palette.fg0, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsPackage', { fg = palette.red, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsClass', { fg = palette.orange, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsMethod', { fg = palette.blue, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsProperty', { fg = palette.green, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsField', { fg = palette.green, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsConstructor', { fg = palette.orange, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsEnum', { fg = palette.orange, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsInterface', { fg = palette.orange, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsFunction', { fg = palette.blue, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsVariable', { fg = palette.purple, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsConstant', { fg = palette.purple, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsString', { fg = palette.green, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsNumber', { fg = palette.orange, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsBoolean', { fg = palette.orange, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsArray', { fg = palette.orange, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsObject', { fg = palette.orange, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsKey', { fg = palette.purple, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsKeyword', { fg = palette.purple, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsNull', { fg = palette.orange, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsEnumMember', { fg = palette.green, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsStruct', { fg = palette.orange, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsEvent', { fg = palette.orange, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsOperator', { fg = palette.fg0, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsTypeParameter', { fg = palette.green, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicText', { fg = palette.fg0, bg = palette.none })
vim.api.nvim_set_hl(0, 'NavicSeparator', { fg = palette.fg1, bg = palette.none })

-- TODO: Figure out why this scheme isn't working with treesitter, like the other garbage one is

vim.cmd [[highlight WinSeparator guifg=#32302f guibg=#32302f]]

vim.cmd [[highlight NvimTreeNormal guibg=#212121]]
vim.cmd [[highlight NvimTreeEndOfBuffer guifg=#212121 guibg=#212121]]
vim.cmd [[highlight NvimTreeWinSeparator guifg=#32302f guibg=#32302f]]
