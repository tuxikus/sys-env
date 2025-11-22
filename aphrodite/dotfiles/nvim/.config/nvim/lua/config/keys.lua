-- lsp
vim.keymap.set("i", "<C-space>", vim.lsp.completion.get, { desc = "trigger autocompletion" })

-- telescope
local telescope = require('telescope.builtin')

-- use a custom function to find ALL files
vim.keymap.set('n', '<leader>f', function()
  telescope.find_files({
    find_command = { "rg", "--ignore", "--hidden", "--files" },
    prompt_prefix = "🔍 "
  })
end, { desc = "Telescope find ALL files" })

vim.keymap.set('n', '<leader>g', telescope.live_grep, { desc = 'Telescope live grep' })
vim.keymap.set('n', '<leader>b', telescope.buffers, { desc = 'Telescope buffers' })
