local builtin = require('telescope.builtin')

vim.keymap.set(
    'n', '<leader>fp', builtin.find_files,
    { desc = "[F]ind in [P]roject" }
)
vim.keymap.set(
    'n', '<C-p>', builtin.git_files,
    { desc = 'Telescope Git-files' }
)
vim.keymap.set(
    'n', '<leader>b', builtin.buffers,
    { desc = 'Telescope [B]uffers' }
)
vim.keymap.set(
    'n', '<leader>:', builtin.commands,
    { desc = 'Telescope commands' }
)
vim.keymap.set(
    'n', '<leader>?', builtin.help_tags,
    { desc = 'Telescope help' }
)

