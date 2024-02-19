return {
  'ThePrimeagen/harpoon',
  dependencies = {
    'nvim-lua/plenary.nvim',
  },
  opts = { menu = { width = 80 } },
  keys = function()
    local mark = require 'harpoon.mark'
    local ui = require 'harpoon.ui'
    return {
      {
        desc = 'Pin file',
        '<leader>i',
        mark.add_file,
        silent = true,
      },
      {
        desc = 'Quick menu',
        '<C-q>',
        ui.toggle_quick_menu,
        silent = true,
      },
      {
        desc = 'Prev pin',
        '[v',
        ui.nav_prev,
        silent = true,
      },
      {
        desc = 'Next pin',
        ']v',
        ui.nav_next,
        silent = true,
      },
    }
  end,
}
