return {
  {
    'preservim/nerdtree',
    lazy = false,
    keys = {
      {
        desc = 'Focus [T]ree',
        '<leader>t',
        ':NERDTreeFocus<CR>',
        silent = true,
      },
      {
        desc = 'Find current buffer in tree',
        '<C-f>',
        ':NERDTreeFind<CR>',
        silent = true,
      },
    },
    config = function()
      vim.g.NERDTreeShowHidden = 1
      vim.g.NERDTreeShowLineNumbers = 1
      vim.g.NERDTreeQuitOnOpen = 1

      vim.api.nvim_create_autocmd({ 'FileType' }, {
        pattern = 'nerdtree',
        callback = function()
          vim.opt_local.relativenumber = true
        end,
      })
    end,
  },
  {
    'nvim-lualine/lualine.nvim',
    event = 'VeryLazy',
    opts = {
      options = {
        globalstatus = true,
        theme = 'dracula-nvim',
      },
      sections = {
        lualine_b = {},
        lualine_c = {},
        lualine_x = { 'branch' },
      },
      winbar = {
        lualine_a = { { 'filename', path = 1 } },
        lualine_x = { 'diff', 'diagnostics' },
      },
      inactive_winbar = {
        lualine_a = { { 'filename', path = 1 } },
        lualine_x = { 'diff', 'diagnostics' },
      },
    },
  },
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
        StatusLine = { bg = nil },
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
}
