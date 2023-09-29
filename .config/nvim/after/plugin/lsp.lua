local lsp = require("lsp-zero").preset({
    -- Shape of borders in floating windows
    float_border = 'rounded', -- 'shadow' 'double' 'single' 'none' 'solid' 'rounded'

    -- mason.nvim config
    call_servers = 'local', -- 'local' 'global'

    -- When set to true adds borders and sorts "severity" of diagnostics.
    configure_diagnostics = true, -- true false

    -- When set to true all servers installed with mason.nvim will be 
    -- initialized on startup.
    setup_servers_on_start = true, -- true false

    set_lsp_keymaps = {
        -- When set to true lsp-zero will not override any shortcut that is 
        -- already "taken".
        preserve_mappings = false, -- true false
        -- List of shorcuts you don't want lsp-zero to override.
        omit = {}, -- List of strings
    },
    --
    manage_nvim_cmp = {
        -- When set to true it will create keybindings that emulate Neovim's 
        -- default completion.
        set_basic_mappings = true, -- true false

        -- When set to true it will setup tab completion, scrolling through 
        -- documentation window, and navigation between snippets.
        set_extra_mappings = false, -- true false

        set_sources = 'recommended', -- 'lsp' 'recommended' 'false'

        -- When set to true it will setup luasnip to expand snippets.
        use_luasnip = true, -- true false

        -- When set to true it'll modify the "format" of the completion items.
        set_format = true, -- true false

        -- When set to true enables the documentation window.
        documentation_window = true, -- true false
    },
})
-- require('lspconfig').arduino_language_server.setup{}

lsp.on_attach(function(client, bufnr)
    -- lsp.default_keymaps({buffer = bufnr})
    local opts = {buffer = bufnr}

    vim.keymap.set("n", "gd",           function() vim.lsp.buf.definition() vim.cmd('normal! zz') end, opts)
    vim.keymap.set("n", "gD",           function() vim.lsp.buf.declaration() vim.cmd('normal! zz')end, opts)
    vim.keymap.set("n", "gi",           function() vim.lsp.buf.implementation()     end, opts)
    vim.keymap.set("n", "K",            function() vim.lsp.buf.hover()              end, opts)
    vim.keymap.set("n", "<leader>vws",  function() vim.lsp.buf.workspace_symbol()   end, opts)
    vim.keymap.set("n", "<leader>vca",  function() vim.lsp.buf.code_action()        end, opts)
    vim.keymap.set("n", "<leader>vrr",  function() vim.lsp.buf.references()         end, opts)
    vim.keymap.set("n", "<leader>vrn",  function() vim.lsp.buf.rename()             end, opts)
    vim.keymap.set("i", "<C-h>",        function() vim.lsp.buf.signature_help()     end, opts)
    vim.keymap.set("n", "<leader>vd",   function() vim.diagnostic.open_float()      end, opts)
    vim.keymap.set("n", "[d",           function() vim.diagnostic.goto_next()       end, opts)
    vim.keymap.set("n", "]d",           function() vim.diagnostic.goto_prev()       end, opts)
end)

lsp.set_preferences({
    suggest_lsp_servers = false,
    sign_icons = {
        error = '',
        warn = '',
        hint = 'H',
        info = ''
    }
})

lsp.ensure_installed({
    'clangd',
    'pyright',
    'pyre',
    'pylsp',
    -- 'pylyzer',
    'jdtls',
})

lsp.configure('lua_ls', {
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim','cmp_select_opts','on_attach'}
            }
        }
    }
})

lsp.setup()



-- Set up nvim-cmp.
local cmp = require( 'cmp' )
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
    sources = {
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'buffer' },
        { name = 'path' }
    },
    window = {
        completion = cmp.config.window.bordered("rounded"),
        documentation = cmp.config.window.bordered("rounded"),
    },
    formatting = {
        -- changing the order of fields so the icon is the first
        fields = {'menu', 'abbr', 'kind'},

        -- here is where the change happens
        format = function(entry, item)
            local menu_icon = {
                nvim_lsp = 'λ',
                luasnip = '⋗',
                buffer = 'Ω',
                path = '🖫',
                nvim_lua = 'Π',
            }

            item.menu = menu_icon[entry.source.name]
            return item
        end,
    },
})


-- lsp.setup_nvim_cmp({
--     mapping = cmp_mappings
-- })




vim.diagnostic.config({
    virtual_text = true
})


-- Fix Undefined global 'vim'
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local lspconfig = require('lspconfig')
lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = cmp_nvim_lsp.default_capabilities(),
    cmd = {
        "clangd",
        "--offset-encoding=utf-16",
    },
}
