require('lualine').setup {
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
}
