return {
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
        desc = '[G]it [L]og',
        '<leader>gl',
        ':Git log<CR>',
        silent = true,
      },
      {
        desc = '[G]it Bra[N]ches',
        '<leader>gn',
        ':Git branch<CR>',
        silent = true,
      },

      {
        desc = '[G]it file Comm[I]ts',
        '<leader>gi',
        ':Git log -- %<CR>',
        silent = true,
      },
    },
  },
  {
    'tpope/vim-commentary',
  },
  {
    'tpope/vim-surround',
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
