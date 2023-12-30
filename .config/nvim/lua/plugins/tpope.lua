return {
  { 'tpope/vim-vinegar' },
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
      {
        desc = '[G]it Log: Verb[o]se',
        '<leader>go',
        ':Git log<CR>',
        silent = true,
      },
    },
  },
  {
    'tpope/vim-commentary',
  },
  {
    'tpope/vim-unimpaired',
  },
  {
    'tpope/vim-surround',
    dependencies = {
      'tpope/vim-repeat',
    },
  },
}
