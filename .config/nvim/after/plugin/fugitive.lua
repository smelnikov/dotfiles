vim.keymap.set(
  'n',
  '<leader>gs',
  vim.cmd.Git,
  { desc = 'Fugitive [G]it [S]tatus' }
)
vim.keymap.set(
  'n',
  '<leader>gl',
  '<cmd>Git log<cr>',
  { desc = 'Fugitive [G]it [L]og' }
)
vim.keymap.set(
  'n',
  '<leader>gb',
  '<cmd>Git branch<cr>',
  { desc = 'Fugitive [G]it [B]ranches' }
)
vim.keymap.set(
  'n',
  '<leader>gc',
  '<cmd>Git log -- %<cr>',
  { desc = 'Fugitive [G]it file [C]ommits' }
)
