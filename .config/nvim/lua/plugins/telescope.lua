return {
  'nvim-telescope/telescope.nvim',
  branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    'pschmitt/telescope-yadm.nvim',
    {
      'nvim-telescope/telescope-fzf-native.nvim',
      cond = vim.fn.executable 'make' == 1,
      build = 'make',
    },
  },
  cmd = 'Telescope',
  keys = {
    {
      desc = 'Find files',
      '<leader>fp',
      ':Telescope find_files<CR>',
      silent = true,
    },
    {
      desc = 'Live grep',
      '<leader>lg',
      ':Telescope live_grep<CR>',
      silent = true,
    },
    {
      desc = 'Git files',
      '<C-p>',
      ':Telescope git_or_yadm_files<CR>',
      silent = true,
    },
  },
  opts = {
    defaults = { layout_strategy = 'vertical' },
    pickers = {
      find_files = {
        find_command = {
          'fd',
          '--type',
          'f',
          '--hidden',
          '--no-ignore',
          '--exclude',
          'node_modules',
          '--exclude',
          '.venv',
          '--exclude',
          '.git',
        },
      },
      live_grep = {
        additional_args = { '--hidden', '--no-ignore' },
        glob_pattern = { '!**/node_modules/**', '!**/.venv/**', '!**/.git/**' },
      },
    },
  },
  config = function(_, opts)
    require('telescope').setup(opts)
    pcall(require('telescope').load_extension, 'fzf')
    pcall(require('telescope').load_extension, 'git_or_yadm_files')
  end,
}
