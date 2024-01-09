return {
  { 'tpope/vim-vinegar' },
  { 'tpope/vim-unimpaired' },
  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    keys = {
      {
        desc = '[G]it [S]tatus',
        '<leader>gs',
        ':Git<CR>',
        silent = true,
      },
      {
        desc = '[G]it [L]og: Oneline',
        '<leader>gl',
        ':Git log --oneline<CR>',
        silent = true,
      },
    },
  },
  {
    'tpope/vim-commentary',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'tpope/vim-surround',
    event = { 'BufReadPre', 'BufNewFile' },
    dependencies = {
      'tpope/vim-repeat',
    },
  },
}
