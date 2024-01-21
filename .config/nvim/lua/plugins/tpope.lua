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
        ':Git log -23 --oneline<CR>',
        silent = true,
      },
      {
        desc = '[G]it: Bla[m]e',
        '<leader>gm',
        ':Git blame<CR>',
        silent = true,
      },
    },
    config = function()
      vim.g.fugitive_dynamic_colors = 0
    end,
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
