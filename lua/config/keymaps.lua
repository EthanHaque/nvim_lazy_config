vim.keymap.set("n", "<leader>q", ":qa!<CR>", {})

-- Open explorer
vim.keymap.set("n", "<leader>e", ":Ex<CR>", {})

-- Clear highlights on search when pressing <Esc> in normal mode
vim.keymap.set('n', '<Esc>', '<cmd>nohlsearch<CR>')

vim.keymap.set('n', 'gl', vim.diagnostic.open_float, { noremap = true, silent = true, desc = "Open floating diagnostic" })
