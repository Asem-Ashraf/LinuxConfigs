-- Set rounded border for LSP floating windows globally
vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(
  vim.lsp.handlers.hover,
  { border = "rounded" }
)

vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(
  vim.lsp.handlers.signature_help,
  { border = "rounded" }
)

-- Optional: Diagnostic floating window border
vim.diagnostic.config({
  float = { border = "rounded" }
})

local lsp = require("lsp-zero").preset({
    -- Shape of borders in floating windows
    float_border = 'double', -- 'shadow' 'double' 'single' 'none' 'solid' 'rounded'

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
        preserve_mappings = true, -- true false
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

local on_attach = function(client, bufnr)
    -- lsp.default_keymaps({buffer = bufnr})
    local opts = {buffer = bufnr}

    vim.keymap.set("n", "gd",           function() vim.lsp.buf.definition() vim.cmd('normal! zz') end, opts)
    vim.keymap.set("n", "gD",           function() vim.lsp.buf.declaration() vim.cmd('normal! zz')end, opts)
    vim.keymap.set("n", "gi",           function() vim.lsp.buf.implementation()     end, opts)
    vim.keymap.set("n", "K",            function() vim.lsp.buf.hover({border = 'single'})              end, opts)
    vim.keymap.set("n", "<leader>vws",  function() vim.lsp.buf.workspace_symbol()   end, opts)
    vim.keymap.set("n", "<leader>vca",  function() vim.lsp.buf.code_action()        end, opts)
    vim.keymap.set("n", "<leader>vrr",  function() vim.lsp.buf.references()         end, opts)
    vim.keymap.set("n", "<leader>vrn",  function() vim.lsp.buf.rename()             end, opts)
    vim.keymap.set("i", "<C-h>",        function() vim.lsp.buf.signature_help()     end, opts)
    vim.keymap.set("n", "<leader>vd",   function() vim.diagnostic.open_float()      end, opts)
    vim.keymap.set("n", "[d",           function() vim.diagnostic.goto_next()       end, opts)
    vim.keymap.set("n", "]d",           function() vim.diagnostic.goto_prev()       end, opts)
end
lsp.on_attach(function(client, bufnr)
    -- lsp.default_keymaps({buffer = bufnr})
    local opts = {buffer = bufnr}

    vim.keymap.set("n", "gd",           function() vim.lsp.buf.definition() vim.cmd('normal! zz') end, opts)
    vim.keymap.set("n", "gD",           function() vim.lsp.buf.declaration() vim.cmd('normal! zz')end, opts)
    vim.keymap.set("n", "gi",           function() vim.lsp.buf.implementation()     end, opts)
    vim.keymap.set("n", "K",            function() vim.lsp.buf.hover({border = 'single'})              end, opts)
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
        { name = 'copilot', group_index = 2},
        { name = 'nvim_lsp', group_index = 1},
        { name = 'luasnip', group_index = 1 }, -- For luasnip users.
        { name = 'buffer', group_index = 1 },
        { name = 'path', group_index = 1 }
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
-- cmp.setup.cmdline(
--     ':',
--     {
--         mapping = cmp.mapping.preset.cmdline(),
--         sources = cmp.config.sources(
--             {
--                 {name = 'path'}
--             },
--             {
--                 {name = 'cmdline'}
--             }
--         ),
--         matching =  {disallow_symbol_nonprefix_matching = false }
--     }
-- )
local cmp_nvim_lsp = require "cmp_nvim_lsp"
local cmp_autopairs = require('nvim-autopairs.completion.cmp')
cmp.event:on(
    'confirm_done',
    cmp_autopairs.on_confirm_done()
)
local capabilities = cmp_nvim_lsp.default_capabilities()



-- Set up lspconfig and language servers.
-- Need to understand how to download each language server and manually install it.
-- Then add it to the lspconfig in here.
local lspconfig = require('lspconfig')

local util = lspconfig.util

local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
---@diagnostic disable-next-line: duplicate-set-field
function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
  opts = opts or {}
  opts.border = "rounded" -- Or any other border
  return orig_util_open_floating_preview(contents, syntax, opts, ...)
end


-- Fix Undefined global 'vim'
lspconfig.clangd.setup{
    -- on_attach = on_attach,
    -- capabilities = capabilities,
    -- cmd = {
    --     "clangd",
    --     "--offset-encoding=utf-16",
    -- },
}
-- lspconfig.pylsp.setup{
--     capabilities = capabilities,
-- }
--

-- jupyter LSP
require('jupytext').setup({})


require('lint').linters.ruff = {
    command = "ruff",
    args = {"--stdin-filename", "%filepath", "--stdin", "--ignore=E501,E203,E266,E501,W503,W504"},
    sourceName = "ruff",
    formatPattern = {
        [[^(.+?):(\d+):(\d+):\s+([A-Z]\d{3})\s+(.*)$]],
        {line = 1, column = 2, message = 5, security = 4},
    },
    securities = {
        E501 = "warning",
        E203 = "warning",
        E266 = "warning",
        E501 = "warning",
        W503 = "warning",
        W504 = "warning",
    },
}
require('lint').linters_by_ft = {
    python = {'ruff'},
    lua = {'luacheck'},
    cpp = {'cpplint'},
    c = {'cpplint'},
}
lspconfig.pyright.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        python = {
            analysis = {
                typeCheckingMode = "basic",
                autoImportCompletions = true,
                useLibraryCodeForTypes = true,
                diagnosticMode = "workspace",
            },
        }
    }
}

-- lua LSP
lspconfig.lua_ls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = util.root_pattern("~/.config/nvim"),
    settings = {
        Lua = {
            diagnostics = {
                globals = { 'vim' }
            }
        }
    }
}

-- bash LSP
lspconfig.bashls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- cmake LSP
lspconfig.cmake.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}

-- markdown LSPs
lspconfig.marksman.setup {
    capabilities = capabilities,
    on_attach = on_attach,
}
 
lspconfig.jdtls.setup {
    capabilities = capabilities,
    on_attach = on_attach,
    root_dir = util.root_pattern("pom.xml", ".git"),
    settings = {
        java = {
            format = {
                enabled = true,
            },
            contentProvider = {
                preferred = "fernflower",
            },
        },
    },
}

