local keymap = require('utils').keymap

keymap('Nop', 'n', '<space>', '<nop>')

keymap('Recording', 'n', 'Q', 'q')
keymap('Nop', 'n', 'q', '<nop>')

keymap('[J]oin Lines', 'n', 'J', 'mzJ`z')
keymap('Scroll [d]ownwards', 'n', '<C-d>', '<C-d>zz')
keymap('Scroll [u]pwards', 'n', '<C-u>', '<C-u>zz')
keymap('[G]o to EOF', 'n', 'G', 'Gzz')

keymap('[Y]ank to clip', { 'n', 'v' }, '<leader>y', '"+y')

keymap('[D]iagnostic: Next', 'n', ']d', vim.diagnostic.goto_next)
keymap('[D]iagnostic: Prev', 'n', '[d', vim.diagnostic.goto_prev)
keymap('Dia[g]nostics: Open F[l]oat', 'n', 'gl', vim.diagnostic.open_float)

keymap('LSP: [F]ind Refere[n]ces', 'n', '<leader>fn', vim.lsp.buf.references)
keymap('LSP: [R]e[n]ame Symbol', 'n', '<leader>rn', vim.lsp.buf.rename)
keymap('LSP: Code [A]ction', { 'n', 'v' }, '<leader>a', vim.lsp.buf.code_action)

keymap('Netrw: Current directory', 'n', '<leader>t', ':Ex .<CR>')
