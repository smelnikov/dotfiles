vim.api.nvim_create_autocmd({ 'BufNewFile', 'BufReadPost' }, {
  pattern = '*.ride',
  callback = function()
    vim.opt_local.filetype = 'haskell'
    vim.opt_local.softtabstop = 4
    vim.opt_local.shiftwidth = 4
  end,
})
