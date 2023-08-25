local lsp = require("lsp-zero").preset("minimal")
require('lspconfig').arduino_language_server.setup{}

lsp.setup_nvim_cmp({
    mapping = cmp_mappings
})

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '',
        warn = '',
        hint = 'H',
        info = ''
    }
})

lsp.on_attach(function(client, bufnr)
    -- lsp.default_keymaps({buffer = bufnr})
    local opts = {buffer = bufnr, remap = false}

    vim.keymap.set("n", "gd",           function() vim.lsp.buf.definition() end, opts)
    vim.keymap.set("n", "gD",           function() vim.lsp.buf.declaration() end, opts)
    vim.keymap.set("n", "gi",           function() vim.lsp.buf.implementation() end, opts)
    vim.keymap.set("n", "K",            function() vim.lsp.buf.hover() end, opts)
    vim.keymap.set("n", "<leader>vws",  function() vim.lsp.buf.workspace_symbol() end, opts)
    vim.keymap.set("n", "<leader>vca",  function() vim.lsp.buf.code_action() end, opts)
    vim.keymap.set("n", "<leader>vrr",  function() vim.lsp.buf.references() end, opts)
    vim.keymap.set("n", "<leader>vrn",  function() vim.lsp.buf.rename() end, opts)
    vim.keymap.set("i", "<C-h>",        function() vim.lsp.buf.signature_help() end, opts)
    vim.keymap.set("n", "<leader>vd",   function() vim.diagnostic.open_float() end, opts)
    vim.keymap.set("n", "[d",           function() vim.diagnostic.goto_next() end, opts)
    vim.keymap.set("n", "]d",           function() vim.diagnostic.goto_prev() end, opts)
end)

lsp.setup()


lsp.ensure_installed({
    'arduino',
    'clangd',
    'pyright',
    'pyre',
    'pylsp',
    'pylyzer',
    'jdtls',
})


-- Set up nvim-cmp.
local cmp = require'cmp'
cmp.setup({
    snippet = {
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
            require('luasnip').lsp_expand(args.body) -- For `luasnip` users.
        end,
    },
    mapping = {
    ['<C-y>'] = cmp.mapping.confirm({select = true}),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<C-u>'] = cmp.mapping.scroll_docs(-4),
    ['<C-d>'] = cmp.mapping.scroll_docs(4),
    ['<Up>'] = cmp.mapping.select_prev_item(cmp_select_opts),
    ['<Down>'] = cmp.mapping.select_next_item(cmp_select_opts),
    ['<C-p>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_prev_item(cmp_select_opts)
      else
        cmp.complete()
      end
    end),
    ['<C-n>'] = cmp.mapping(function()
      if cmp.visible() then
        cmp.select_next_item(cmp_select_opts)
      else
        cmp.complete()
      end
    end),
    },
    sources = cmp.config.sources({
            { name = 'nvim_lsp' },
            { name = 'luasnip' }, -- For luasnip users.
        }, 
        {
            { name = 'buffer' },
            { name = 'path' }
        }
    )
})



vim.diagnostic.config({
    virtual_text = true
})
-- Fix Undefined global 'vim'
lsp.configure('lua-language-server', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
})

local cmp_nvim_lsp = require "cmp_nvim_lsp"

require("lspconfig").clangd.setup {
  on_attach = on_attach,
  -- capabilities = cmp_nvim_lsp.default_capabilities(),
  cmd = {
    "clangd",
    "--offset-encoding=utf-16",
  },
}
