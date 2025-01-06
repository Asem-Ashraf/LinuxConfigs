require("asem.set")
require("asem.remap")
require("asem.packer")

function OpenMarkdownPreview(url)
  vim.fn.system({'brave ', '--new-window ', url})  -- Using vim.fn.system to execute the shell command
end

-- See `:help vim.highlight.on_yank()`
local highlight_group = vim.api.nvim_create_augroup('YankHighlight', { clear = true })
vim.api.nvim_create_autocmd('TextYankPost', {
  callback = function()
    vim.highlight.on_yank()
  end,
  group = highlight_group,
  pattern = '*',
})

