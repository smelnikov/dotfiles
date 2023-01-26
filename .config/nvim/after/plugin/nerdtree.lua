vim.g.NERDTreeShowHidden = 1

vim.keymap.set(
  'n',
  '<leader>t',
  vim.cmd.NERDTreeFocus,
  { desc = 'Focus [T]ree' }
)
vim.keymap.set('n', '<C-t>', vim.cmd.NERDTreeToggle, { desc = 'Toggle tree' })
vim.keymap.set(
  'n',
  '<C-f>',
  vim.cmd.NERDTreeFind { desc = 'Find current buffer in tree' }
)
