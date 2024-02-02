return {
  {
    'nvim-treesitter/nvim-treesitter',
    main = 'nvim-treesitter.configs',
    event = { 'BufReadPre', 'BufNewFile' },
    build = ':TSUpdateSync',
    opts = {
      auto_install = true,
      highlight = {
        additional_vim_regex_highlighting = false,
        enable = true,
      },
      indent = { enable = true },
    },
  },
  {
    'nvim-treesitter/nvim-treesitter-context',
    dependencies = { 'nvim-treesitter/nvim-treesitter' },
    event = { 'BufReadPre', 'BufNewFile' },
    opts = {
      enable = true,
    },
  },
}
