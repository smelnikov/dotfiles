vim.g.NERDTreeShowHidden = 1

vim.keymap.set('n', '<leader>n', vim.cmd.NERDTreeFocus)
vim.keymap.set('n', '<C-t>', vim.cmd.NERDTreeToggle)
vim.keymap.set('n', '<C-f>', vim.cmd.NERDTreeFind)

