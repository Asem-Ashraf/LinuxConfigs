vim.cmd [[packadd packer.nvim]]


return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	-- Telescope fuzzy finder plugin.
	use {
		"nvim-telescope/telescope.nvim", tag = '0.1.1',
		-- or                            , branch = '0.1.x',
		requires = { 'nvim-lua/plenary.nvim' }
	}
	use 'duane9/nvim-rg'

	-- Color Schemes
	use({ 'rose-pine/neovim', as = 'rose-pine' })
	use({ "cpea2506/one_monokai.nvim" })

	-- Treesitter
	use {
		'nvim-treesitter/nvim-treesitter',
		run = function()
			local ts_update = require('nvim-treesitter.install').update({ with_sync = true })
			ts_update()
		end,
	}
	use { -- Additional text objects via treesitter
		'nvim-treesitter/nvim-treesitter-textobjects',
		after = 'nvim-treesitter',
	}

	-- markdown preview
	use {
		'iamcco/markdown-preview.nvim',
		run = function() vim.fn["mkdp#util#install"]() end
	}

	-- obsidian.md
	use("epwalsh/obsidian.nvim")

	-- Undotree
	use('mbbill/undotree')

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v2.x',
		requires = {
			-- LSP Support
			{ 'neovim/nvim-lspconfig' },  -- Required
			{ 'williamboman/mason.nvim' }, -- Optional
			{ 'williamboman/mason-lspconfig.nvim' }, -- Optional

			-- autocompletion
			{ 'L3MON4D3/LuaSnip',                 run = 'make install_jsregexp' }, -- Required
			{ 'hrsh7th/nvim-cmp' },                    -- Required
			{ 'hrsh7th/cmp-nvim-lsp' },                -- Required
			{ 'hrsh7th/cmp-buffer' },                  -- Optional
			{ 'hrsh7th/cmp-path' },                    -- Optional
			{ 'hrsh7th/cmp-nvim-lua' },                -- Optional

			{ 'saadparwaiz1/cmp_luasnip' },            -- Optional

			{ 'folke/neodev.nvim' },
			{ 'j-hui/fidget.nvim' },
		}
	}
	-- nvim-tree
	-- use {
	-- 	'kyazdani42/nvim-tree.lua',
	-- 	requires = {
	-- 		'kyazdani42/nvim-web-devicons', -- optional, for file icons
	-- 	},
	-- 	tag = 'nightly'           -- optional, updated every week. (see issue #1193)
	-- }

	use 'windwp/nvim-autopairs'

	use { "kylechui/nvim-surround" }

	-- Git related plugins
	use 'tpope/vim-fugitive'
	use 'tpope/vim-rhubarb'
	use 'lewis6991/gitsigns.nvim'


	use 'github/copilot.vim'
	use "akinsho/toggleterm.nvim"


	use 'ThePrimeagen/vim-be-good'

	use 'navarasu/onedark.nvim'            -- Theme inspired by 4tom
	use 'nvim-lualine/lualine.nvim'        -- Fancier statusline
	use 'lukas-reineke/indent-blankline.nvim' -- Add indentation guides even on blank lines
	use 'numToStr/Comment.nvim'            -- "gc" to comment visual regions/lines
	use 'tpope/vim-sleuth'                 -- Detect tabstop and shiftwidth automatically
end)
