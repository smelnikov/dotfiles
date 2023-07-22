local keymap = require('utils').keymap

keymap('Nop', 'n', '<space>', '<nop>')

keymap('[J]oin Lines', 'n', 'J', 'mzJ`z')
keymap('Scroll [d]ownwards', 'n', '<C-d>', '<C-d>zz')
keymap('Scroll [u]pwards', 'n', '<C-u>', '<C-u>zz')
keymap('[G]o to EOF', 'n', 'G', 'Gzz')

keymap('[Y]ank to clip', { 'n', 'v' }, '<leader>y', '"+y')
