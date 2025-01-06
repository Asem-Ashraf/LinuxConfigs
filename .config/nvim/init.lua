require("asem")
function OpenMarkdownPreview(url)
  vim.fn.system({'brave ', '--new-window ', url})  -- Using vim.fn.system to execute the shell command
end
