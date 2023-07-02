vim.g.NERDTreeShowHidden = 1
vim.g.NERDTreeShowLineNumbers = 1
vim.g.NERDTreeQuitOnOpen = 1

vim.api.nvim_create_autocmd({ 'FileType' }, {
  pattern = 'nerdtree',
  callback = function()
    vim.opt_local.relativenumber = true
  end,
})

vim.keymap.set(
  'n',
  '<leader>t',
  vim.cmd.NERDTreeFocus,
  { desc = 'Focus [T]ree' }
)
vim.keymap.set(
  'n',
  '<C-f>',
  vim.cmd.NERDTreeFind,
  { desc = 'Find current buffer in tree' }
)
