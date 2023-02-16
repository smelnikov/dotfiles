local dracula = require 'dracula'

dracula.setup {
  colors = {
    visual = '#55596D',
  },
  transparent_bg = true,
  lualine_bg_color = dracula.colors().bg,
  overrides = {
    StatusLine = { bg = nil },
  },
}

vim.cmd.colorscheme 'dracula'
