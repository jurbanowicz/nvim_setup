-- This file can be loaded by calling `lua require('plugins')` from your init.vim

-- Only required if you have packer configured as `opt`
vim.cmd [[packadd packer.nvim]]

return require('packer').startup(function(use)
	-- Packer can manage itself
	use 'wbthomason/packer.nvim'

	use {
		'nvim-telescope/telescope.nvim', tag = '0.1.5',
		-- or                            , branch = '0.1.x',
		requires = { {'nvim-lua/plenary.nvim'} }
	}

	use({ 'rose-pine/neovim', as = 'rose-pine' })

	use('nvim-treesitter/nvim-treesitter', {run = ':TSUpdate'})

	use('tpope/vim-fugitive')

	use {
		'VonHeikemen/lsp-zero.nvim',
		branch = 'v3.x',
		requires = {
			--- Uncomment these if you want to manage LSP servers from neovim
			{'williamboman/mason.nvim'},
			{'williamboman/mason-lspconfig.nvim'},

			-- LSP Support
			{'neovim/nvim-lspconfig'},
			-- Autocompletion
			{'hrsh7th/nvim-cmp'},
			{'hrsh7th/cmp-path'},
			{'hrsh7th/cmp-nvim-lsp'},
			{'hrsh7th/cmp-cmdline'},

            {'L3MON4D3/LuaSnip'},
            {'rafamadriz/friendly-snippets'},
		}
	}
    
    use('theprimeagen/harpoon')
    
    use('mbbill/undotree')

    -- debugging
    use('mfussenegger/nvim-dap')
    use('mfussenegger/nvim-dap-python')
    use { "rcarriga/nvim-dap-ui", requires = {"mfussenegger/nvim-dap"} }
    use('theHamsta/nvim-dap-virtual-text')
    use {
            'mfussenegger/nvim-jdtls',
            disable = false,
        }
    use {
        'nvim-lualine/lualine.nvim',
        requires = { 'nvim-tree/nvim-web-devicons', opt = true }
    }

    use('dart-lang/dart-vim-plugin')
    use('nvim-telescope/telescope-ui-select.nvim')

end)

