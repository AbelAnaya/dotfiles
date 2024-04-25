-- [[ Basic Keymaps ]]

-- Keymaps for better default experience
-- See `:help vim.keymap.set()`
vim.keymap.set({ 'n', 'v' }, '<Space>', '<Nop>', { silent = true })

-- Remap for dealing with word wrap
vim.keymap.set('n', 'k', "v:count == 0 ? 'gk' : 'k'", { expr = true, silent = true })
vim.keymap.set('n', 'j', "v:count == 0 ? 'gj' : 'j'", { expr = true, silent = true })

-- Set <space> as the leader key
-- See `:help mapleader`
--  NOTE: Must happen before plugins are required (otherwise wrong leader will be used)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Greatest remaps ever
vim.keymap.set({ 'x', 'v' }, "<leader>p", [["_dP]], { desc = 'Paste without modifying registers' })
vim.keymap.set({ 'n', 'x', 'v' }, "<leader>d", [["_d]], { desc = 'Delete without modifying registers' })

-- sessionizer integration in nvim remap
vim.keymap.set("n", "<C-f>", "<cmd>silent !tmux neww tmux-sessionizer.sh<CR>")

-- Set <Shift-ArrowKey> to move between Nvim Buffers and Tmux panes
vim.g.tmux_navigator_no_mappings = 1
vim.cmd("noremap <silent> <s-Left> :<C-U>TmuxNavigateLeft<cr>")
vim.cmd("noremap <silent> <s-Right> :<C-U>TmuxNavigateRight<cr>")
vim.cmd("noremap <silent> <s-Down> :<C-U>TmuxNavigateDown<cr>")
vim.cmd("noremap <silent> <s-Up> :<C-U>TmuxNavigateUp<cr>")

-- Diagnostic keymaps
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev, { desc = 'Go to previous diagnostic message' })
vim.keymap.set('n', ']d', vim.diagnostic.goto_next, { desc = 'Go to next diagnostic message' })
vim.keymap.set('n', '<leader>e', vim.diagnostic.open_float, { desc = 'Open floating diagnostic message' })
vim.keymap.set('n', '<leader>q', vim.diagnostic.setloclist, { desc = 'Open diagnostics list' })

-- Center screen after jump keymaps
vim.keymap.set('n', '<C-o>', '<C-o>zz')
vim.keymap.set('n', '<C-i>', '<C-i>zz')
vim.keymap.set('n', '<C-d>', '<C-d>zz')
vim.keymap.set('n', '<C-u>', '<C-u>zz')
