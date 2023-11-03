return {
  {
    'Mofiqul/dracula.nvim',
    lazy = false,
    priority = 1000,
    opts = {
      colors = {
        visual = '#55596D',
        bg = 'none',
      },
      transparent_bg = true,
      lualine_bg_color = 'none',
      overrides = {
        StatusLine = { fg = '#f8f8f2', bg = '#44475a' },
        EndOfBuffer = { link = 'LineNr' },
        DiffAdd = { bg = '#277a3c' },
        DiffChange = { bg = '#7a5833', fg = nil },
        DiffText = { fg = nil },
      },
    },
    config = function(_, opts)
      require('dracula').setup(opts)
      vim.cmd [[colorscheme dracula]]
    end,
  },
  {
    'stevearc/dressing.nvim',
    event = 'VeryLazy',
    opts = {
      input = {
        insert_only = false,
        start_in_insert = false,
      },
    },
  },
}
