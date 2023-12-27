return {
  { 'tpope/vim-vinegar' },
  {
    'tpope/vim-fugitive',
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
  {
    'seanbreckenridge/yadm-git.vim',
    dependencies = {
      'tpope/vim-fugitive',
    },
    config = function()
      vim.g.yadm_git_enabled = 1
      vim.g.yadm_git_fugitive_enabled = 1
      vim.g.yadm_git_gitgutter_enabled = 0
    end,
  },
}
