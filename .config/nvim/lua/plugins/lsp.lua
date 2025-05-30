return {
  {
    'mason-org/mason.nvim',
    cmd = 'Mason',
    opts = {
      ui = { border = 'rounded' },
    },
  },
  {
    'mason-org/mason-lspconfig.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      {
        'folke/lazydev.nvim',
        ft = 'lua',
        opts = {
          library = {
            { path = '${3rd}/luv/library', words = { 'vim%.uv' } },
          },
        },
      },
      'mason-org/mason.nvim',
      'neovim/nvim-lspconfig',
      'b0o/schemastore.nvim',
    },
    opts = {
      ensure_installed = {
        'cssls',
        'cssmodules_ls',
        'eslint',
        'gopls',
        'html',
        'jsonls',
        'lua_ls',
        'pyright',
        'ruff',
        'taplo',
        'ts_ls',
        'yamlls',
      },
    },
  },
  {
    'jayp0521/mason-null-ls.nvim',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'mason.nvim',
      {
        'nvimtools/none-ls.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        opts = function()
          local f = require('null-ls').builtins.formatting
          return {
            sources = {
              f.black,
              f.isort,
              f.prettier,
              f.stylua,
            },
          }
        end,
      },
    },
    opts = {
      ensure_installed = nil,
      automatic_installation = true,
    },
  },
}
