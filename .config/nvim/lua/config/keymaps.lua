local keymap = require('utils').keymap

keymap('Nop', 'n', '<space>', '<nop>')

keymap('Recording', 'n', 'Q', 'q')
keymap('Nop', 'n', 'q', '<nop>')

keymap('Join lines', 'n', 'J', 'mzJ`z')
keymap('Scroll downwards', 'n', '<C-d>', '<C-d>zz')
keymap('Scroll upwards', 'n', '<C-u>', '<C-u>zz')
keymap('Go to EOF', 'n', 'G', 'Gzz')

keymap('Yank to clip', { 'n', 'v' }, '<leader>y', '"+y')

keymap('Diagnostics: Next', 'n', ']d', vim.diagnostic.goto_next)
keymap('Diagnostics: Prev', 'n', '[d', vim.diagnostic.goto_prev)
keymap('Diagnostics: Open float', 'n', 'gl', vim.diagnostic.open_float)

keymap('Find references', 'n', '<leader>fn', vim.lsp.buf.references)
keymap('Rename symbol', 'n', '<leader>rn', vim.lsp.buf.rename)
keymap('Code action', { 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action)
