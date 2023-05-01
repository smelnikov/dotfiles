local dracula = require 'dracula'

dracula.setup {
  colors = {
    visual = '#55596D',
    bg = 'none',
  },
  transparent_bg = true,
  lualine_bg_color = 'none',
  overrides = {
    StatusLine = { bg = nil },
    EndOfBuffer = { link = 'LineNr' },
  },
}

vim.cmd.colorscheme 'dracula'
