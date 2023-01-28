require('dracula').setup {
  colors = {
    visual = '#55596D',
  },
}

function ColorThings(color)
  color = color or 'dracula'
  vim.cmd.colorscheme(color)

  vim.api.nvim_set_hl(0, 'Normal', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'NormalFloat', { bg = 'none' })
  vim.api.nvim_set_hl(0, 'SignColumn', { fg = 'none' })
end

ColorThings()
