return {
  { 'nvim-lua/plenary.nvim' },
  {
    'Mofiqul/dracula.nvim',
    lazy = false,
    priority = 1000,
    config = function()
      -- load the colorscheme here
      vim.cmd [[colorscheme dracula]]
    end,
  },
  {
    'preservim/nerdtree',
    config = function()
      vim.keymap.set(
        'n',
        '<leader>t',
        vim.cmd.NERDTreeFocus,
        { desc = 'Focus [T]ree' }
      )
      vim.keymap.set(
        'n',
        '<C-f>',
        vim.cmd.NERDTreeFind,
        { desc = 'Find current buffer in tree' }
      )
    end,
  },
}
