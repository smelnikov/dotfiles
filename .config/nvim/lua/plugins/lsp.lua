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
        'basedpyright',
        'cssls',
        'cssmodules_ls',
        'eslint',
        'gopls',
        'html',
        'jsonls',
        'lua_ls',
        'ruff',
        'taplo',
        'ts_ls',
        'yamlls',
      },
    },
  },
}
