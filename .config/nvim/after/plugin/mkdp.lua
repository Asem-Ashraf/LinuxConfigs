-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>mp', ':MarkdownPreview<CR>', { noremap = true })
vim.cmd(
[[
function OpenMarkdownPreview (url)
  execute "silent ! brave --new-window --app=" . a:url
endfunction
]]
)

vim.g.mkdp_browserfunc = 'OpenMarkdownPreview'

-- Default theme for preview (dark or light)
vim.g.mkdp_theme = 'dark'
