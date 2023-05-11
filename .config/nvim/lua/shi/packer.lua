vim.cmd [[packadd packer.nvim]]

return require('packer').startup {
  function(use)
    use 'wbthomason/packer.nvim'
    use {
      'nvim-telescope/telescope.nvim',
      tag = '0.1.1',
      requires = { { 'nvim-lua/plenary.nvim' } },
    }
    use 'Mofiqul/dracula.nvim'
    use {
      'nvim-treesitter/nvim-treesitter',
      run = function()
        local ts_update =
          require('nvim-treesitter.install').update { with_sync = true }
        ts_update()
      end,
    }
    use 'nvim-treesitter/nvim-treesitter-context'
    use 'mbbill/undotree'
    use 'tpope/vim-fugitive'
    use 'tpope/vim-commentary'
    use 'tpope/vim-surround'
    use {
      'VonHeikemen/lsp-zero.nvim',
      branch = 'v1.x',
      requires = {
        -- LSP Support
        { 'neovim/nvim-lspconfig' },
        { 'williamboman/mason.nvim' },
        { 'williamboman/mason-lspconfig.nvim' },
        { 'jose-elias-alvarez/null-ls.nvim' },
        { 'jay-babu/mason-null-ls.nvim' },
        -- Autocompletion
        { 'hrsh7th/nvim-cmp' },
        { 'hrsh7th/cmp-nvim-lsp' },
        { 'hrsh7th/cmp-buffer' },
        { 'hrsh7th/cmp-path' },
        { 'saadparwaiz1/cmp_luasnip' },
        { 'hrsh7th/cmp-nvim-lua' },
        -- Snippets
        { 'L3MON4D3/LuaSnip' },
        { 'rafamadriz/friendly-snippets' },
      },
    }
    use 'rosmanov/vim-ride'
    use 'preservim/nerdtree'
    use {
      'nvim-lualine/lualine.nvim',
      requires = { 'kyazdani42/nvim-web-devicons', opt = true },
    }
    use 'stevearc/dressing.nvim'
  end,
  config = {
    display = {
      prompt_border = 'single',
      open_fn = function()
        return require('packer.util').float { border = 'single' }
      end,
    },
  },
}
