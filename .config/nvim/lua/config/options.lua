vim.opt.guicursor = ''

vim.opt.nu = true
vim.opt.relativenumber = true

vim.opt.softtabstop = 2
vim.opt.shiftwidth = 2
vim.opt.expandtab = true

vim.opt.smartindent = true

vim.opt.wrap = false

vim.opt.swapfile = false
vim.opt.backup = false
vim.opt.undodir = os.getenv 'HOME' .. '/.vim/undodir'
vim.opt.undofile = true

vim.opt.hlsearch = false
vim.opt.incsearch = true

vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.gdefault = true

vim.opt.termguicolors = true

vim.opt.scrolloff = 8
vim.opt.sidescrolloff = 8
vim.opt.signcolumn = 'yes'
vim.opt.isfname:append '@-@'

vim.opt.updatetime = 60

vim.opt.winbar = ' '
vim.opt.laststatus = 3

vim.opt.shelltemp = false

vim.opt.mouse = ''

vim.diagnostic.config {
  float = { border = 'rounded' },
  severity_sort = true,
  virtual_text = false,
}
vim.lsp.handlers['textDocument/hover'] =
  vim.lsp.with(vim.lsp.handlers.hover, { border = 'rounded' })

vim.g.netrw_use_errorwindow = 0
vim.g.netrw_bufsettings = 'noma nomod nu relativenumber nowrap ro nobl'
