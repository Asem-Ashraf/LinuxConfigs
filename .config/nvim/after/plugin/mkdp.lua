-- Key mappings
vim.api.nvim_set_keymap('n', '<leader>mp', ':MarkdownPreview<CR>', { noremap = true })

-- Markdown Preview Configuration in Neovim (Lua)
vim.g.mkdp_auto_start = 0  -- set to 1 to open the preview window after entering the Markdown buffer
vim.g.mkdp_auto_close = 1  -- set to 1 to auto close the preview window when changing buffers
vim.g.mkdp_refresh_slow = 0  -- set to 1 for slow refresh, 0 for faster refresh when saving or leaving insert mode
vim.g.mkdp_command_for_global = 0  -- set to 1 for the MarkdownPreview command to be used globally
vim.g.mkdp_open_to_the_world = 0  -- set to 1 for the server to be accessible from your network
vim.g.mkdp_open_ip = ''  -- custom IP for previewing (useful for remote work)
vim.g.mkdp_browser = 'brave'  -- specify browser for opening preview page
vim.g.mkdp_echo_preview_url = 0  -- set to 1 to echo the preview URL in the command line


-- Markdown preview options
vim.g.mkdp_preview_options = {
  mkit = {},
  katex = {},
  uml = {},
  maid = {},
  disable_sync_scroll = 0,
  sync_scroll_type = 'middle',  -- options: 'middle', 'top', 'relative'
  hide_yaml_meta = 1,
  sequence_diagrams = {},
  flowchart_diagrams = {},
  content_editable = false,
  disable_filename = 0,
  toc = {}
}

-- Custom CSS for Markdown and syntax highlighting
vim.g.mkdp_markdown_css = ''  -- absolute path to custom markdown.css
vim.g.mkdp_highlight_css = ''  -- absolute path to custom highlight.css


-- Preview page title format
vim.g.mkdp_page_title = ''

-- Custom location for images
-- vim.g.mkdp_images_path = '/home/user/.markdown_images'

-- Recognized filetypes for Markdown preview
vim.g.mkdp_filetypes = { 'markdown' }

-- Default theme for preview (dark or light)
vim.g.mkdp_theme = 'dark'

-- Combine preview window (reuse previous opened window)
vim.g.mkdp_combine_preview = 0  -- set to 1 to reuse the preview window

-- Auto refresh combined preview when changing the markdown buffer (only when combining preview is enabled)
vim.g.mkdp_combine_preview_auto_refresh = 1

