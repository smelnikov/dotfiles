return {
  { 'tpope/vim-vinegar' },
  { 'tpope/vim-unimpaired' },
  {
    'tpope/vim-fugitive',
    event = 'VeryLazy',
    keys = {
      {
        desc = 'Git status',
        '<leader>gs',
        ':Git<CR>',
        silent = true,
      },
      {
        desc = 'Git log',
        '<leader>go',
        ':Git log -23 --oneline<CR>',
        silent = true,
      },
      {
        desc = 'Git blame',
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
