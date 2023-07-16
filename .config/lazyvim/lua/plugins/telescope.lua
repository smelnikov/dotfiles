return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      cond = vim.fn.executable 'make' == 1,
      build = 'make',
    },
  },
  keys = {
    {
      desc = '[F]ind in [P]roject',
      '<leader>fp',
      ':Telescope find_files<CR>',
      silent = true,
    },
    {
      desc = '[L]ive [G]rep',
      '<leader>lg',
      ':Telescope live_grep<CR>',
      silent = true,
    },
    {
      desc = 'Git files',
      '<C-p>',
      ':Telescope git_files<CR>',
      silent = true,
    },

    {
      desc = '[B]uffers',
      '<leader>b',
      ':Telescope buffers<CR>',
      silent = true,
    },
  },
  opts = {
    defaults = {
      layout_config = {
        width = 0.95,
        height = 0.95,
        horizontal = {
          preview_width = 0.6,
        },
      },
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    pcall(require('telescope').load_extension, 'fzf')
  end,
}
