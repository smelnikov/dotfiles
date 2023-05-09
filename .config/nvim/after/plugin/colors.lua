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
    DiffAdd = { bg = '#277a3c' },
    DiffChange = { bg = '#7a5833', fg = nil },
    DiffText = { fg = nil },
  },
}

vim.cmd.colorscheme 'dracula'
