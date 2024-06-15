local keymap = require('utils').keymap

keymap('Nop', 'n', '<space>', '<nop>')

keymap('Recording', 'n', 'Q', 'q')
keymap('Nop', 'n', 'q', '<nop>')

keymap('Join lines', 'n', 'J', 'mzJ`z')
keymap('Scroll downwards', 'n', '<C-d>', '<C-d>zz')
keymap('Scroll upwards', 'n', '<C-u>', '<C-u>zz')
keymap('Go to EOF', 'n', 'G', 'Gzz')

keymap('Yank to clip', { 'n', 'v' }, '<leader>y', '"+y')

keymap('Find references', 'n', '<leader>fn', vim.lsp.buf.references)
keymap('Rename symbol', 'n', '<leader>rn', vim.lsp.buf.rename)
keymap('Code action', { 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action)
