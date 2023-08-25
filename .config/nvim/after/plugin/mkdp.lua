-- Enable markdown-preview.nvim
vim.g.mkdp_auto_start = 0
vim.g.mkdp_auto_close = 1
vim.g.mkdp_refresh_slow = 0
vim.g.mkdp_command_for_global = 0
vim.g.mkdp_open_to_the_world = 0
-- Set your preferred browser (e.g., 'firefox', 'google-chrome', etc.)
vim.g.mkdp_browser = 'falkon' 

-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>mp', ':MarkdownPreview<CR>', { noremap = true })
-- vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'
-- function OpenMarkdownPreview(url)
-- 	vim.fn.system("brave --new-window " .. url)
-- end
