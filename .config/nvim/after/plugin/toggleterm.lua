require("toggleterm").setup{
	open_mapping = [[<c-\>]],
	hide_numbers = true, -- hide the number column in toggleterm buffers
	shade_terminals = true, -- NOTE: this option takes priority over highlights specified so if you specify Normal highlights you should set this to false
	start_in_insert = true,
	insert_mappings = true, -- whether or not the open mapping applies in insert mode
	terminal_mappings = true, -- whether or not the open mapping applies in the opened terminals
	direction = 'float',
	-- direction = 'vertical' | 'horizontal' | 'tab' | 'float',
	auto_scroll = true -- automatically scroll to the bottom on terminal output
}
