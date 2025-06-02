return {
  {
    'nvim-treesitter/nvim-treesitter',
    main = 'nvim-treesitter.configs',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdateSync',
    opts = {
      auto_install = true,
      highlight = { enable = true },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      enable = true,
    },
    keys = {
      {
        desc = 'Toggle context',
        'yox',
        ':TSContext toggle<CR>',
        silent = true,
      },
    },
  },
}
