local M = {} --table containing color palette in use

local o = vim.o
local g = vim.g

o.termguicolors = true
o.background = 'dark'

--- currently all for gruvbox
g.gruvbox_material_disable_italic_comment = 1
g.gruvbox_material_better_performance = 1
-- g.gruvbox_material_diagnostic_line_highlight = 1 -- seems to not work with this color scheme setup
g.gruvbox_material_diagnostic_virtual_text = 'colored'

vim.cmd.colorscheme('gruvbox-material')
local gruvbox_config = vim.api.nvim_call_function('gruvbox_material#get_configuration', {})
local gruvbox_palette = vim.api.nvim_call_function(
    'gruvbox_material#get_palette',
    { gruvbox_config.background, gruvbox_config.foreground, gruvbox_config.colors_override }
)
for k, v in pairs(gruvbox_palette) do
    gruvbox_palette[k] = v[1]
end
-- vim.pretty_print(gruvbox_palette)

-- vim.api.nvim_set_hl(0, 'rainbowcol1', { fg = gruvbox_palette.fg0})
-- vim.api.nvim_set_hl(0, 'rainbowcol2', { fg = gruvbox_palette.fg0})
-- vim.api.nvim_set_hl(0, 'rainbowcol3', { fg = gruvbox_palette.rasdasd})
-- vim.api.nvim_set_hl(0, 'rainbowcol4', { fg = gruvbox_palette.fg1})
-- vim.api.nvim_set_hl(0, 'rainbowcol5', { fg = gruvbox_palette.fg0})
-- vim.api.nvim_set_hl(0, 'rainbowcol6', { fg = gruvbox_palette.fg1})
-- vim.api.nvim_set_hl(0, 'rainbowcol7', { fg = gruvbox_palette.fg0})


--- nvim-navic
vim.api.nvim_set_hl(0, 'NavicIconsFile', { fg = gruvbox_palette.fg0, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsModule', { fg = gruvbox_palette.yellow, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsNamespace', { fg = gruvbox_palette.fg0, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsPackage', { fg = gruvbox_palette.red, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsClass', { fg = gruvbox_palette.orange, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsMethod', { fg = gruvbox_palette.blue, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsProperty', { fg = gruvbox_palette.green, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsField', { fg = gruvbox_palette.green, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsConstructor', { fg = gruvbox_palette.orange, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsEnum', { fg = gruvbox_palette.orange, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsInterface', { fg = gruvbox_palette.orange, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsFunction', { fg = gruvbox_palette.blue, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsVariable', { fg = gruvbox_palette.purple, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsConstant', { fg = gruvbox_palette.purple, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsString', { fg = gruvbox_palette.green, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsNumber', { fg = gruvbox_palette.orange, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsBoolean', { fg = gruvbox_palette.orange, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsArray', { fg = gruvbox_palette.orange, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsObject', { fg = gruvbox_palette.orange, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsKey', { fg = gruvbox_palette.purple, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsKeyword', { fg = gruvbox_palette.purple, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsNull', { fg = gruvbox_palette.orange, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsEnumMember', { fg = gruvbox_palette.green, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsStruct', { fg = gruvbox_palette.orange, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsEvent', { fg = gruvbox_palette.orange, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsOperator', { fg = gruvbox_palette.fg0, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicIconsTypeParameter', { fg = gruvbox_palette.green, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicText', { fg = gruvbox_palette.fg0, bg = gruvbox_palette.none })
vim.api.nvim_set_hl(0, 'NavicSeparator', { fg = gruvbox_palette.fg1, bg = gruvbox_palette.none })


--- nvim-tree
vim.cmd([[highlight NvimTreeNormal guibg=#212121]])
vim.cmd([[highlight NvimTreeEndOfBuffer guifg=#212121 guibg=#212121]])
vim.cmd([[highlight NvimTreeWinSeparator guifg=#32302f guibg=#32302f]])


--- Neovim
vim.cmd([[highlight WinSeparator guifg=#32302f guibg=#32302f]])

M.palette = gruvbox_palette
return M
