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
        HarpoonBorder = { link = 'FloatBorder' },
        TelescopePromptBorder = { link = 'FloatBorder' },
        TelescopeResultsBorder = { link = 'FloatBorder' },
        TelescopePreviewBorder = { link = 'FloatBorder' },
        StatusLine = { link = 'CursorLine' },
        EndOfBuffer = { link = 'LineNr' },

        DiffAdd = { bg = '#0f2e08' },
        DiffChange = { bg = '#400706' },
        DiffDelete = { fg = '#841f1a' },
        DiffText = { bg = '#84201a' },
        diffFile = { link = 'Comment' },
        WinBar = { link = 'NormalFloat' },
        WinBarNC = { link = 'NormalFloat' },
        Pmenu = { link = 'NormalFloat' },
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
