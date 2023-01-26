local builtin = require 'telescope.builtin'

vim.keymap.set(
    "n", "<leader>gs", vim.cmd.Git,
    { desc = "Fugitive [G]it [S]tatus" }
)
vim.keymap.set(
    "n", "<leader>gb", builtin.git_branches,
    { desc = "Telescope [G]it [B]ranches" }
)
vim.keymap.set(
    "n", "<leader>gc", builtin.git_commits,
    { desc = "Telescope [G]it [C]ommits" }
)
