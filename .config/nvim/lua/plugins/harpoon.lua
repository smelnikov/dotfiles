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
        desc = 'Harpoon: Mar[k] file',
        '<leader>k',
        mark.add_file,
        silent = true,
      },
      {
        desc = 'Harpoon: [Q]uick menu',
        '<C-q>',
        ui.toggle_quick_menu,
        silent = true,
      },
    }
  end,
}
