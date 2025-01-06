require("nvim-tree").setup({
	disable_netrw = false,
	hijack_netrw = false,
	update_cwd = true,
	hijack_directories = {
		enable = false,
	},
})
-- Already in remap.lua
-- vim.keymap.set('n', '<leader>t', ':NvimTreeToggle<CR>',{silent = true})
