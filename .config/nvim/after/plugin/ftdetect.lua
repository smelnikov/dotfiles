vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = '*.ride',
  callback = function()
    vim.opt_local.filetype = 'haskell'
  end,
})
