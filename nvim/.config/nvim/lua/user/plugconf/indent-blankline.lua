require('indent_blankline').setup {
	char = '▏',
	-- space_char_blankline = ' ',	--not needed
	use_treesitter = true,
	show_first_indent_level = false,
	show_trailing_blankline_indent = false,
	-- show_current_context = true,
	buftype_exclude = { 'terminal', 'nofile' },
	filetype_exclude = {
		'help',
		'startify',
		'dashboard',
		'packer',
		'neogitstatus',
		'NvimTree',
		'Trouble',
		'text',
	},
}
