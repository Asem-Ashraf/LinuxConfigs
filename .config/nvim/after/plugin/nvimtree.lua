require("nvim-tree").setup({
	disable_netrw = true,
	hijack_netrw = true,
	update_cwd = true,
	hijack_directories = {
		enable = true,
	},
})
-- Already in remap.lua
-- vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>',{silent = true})
