require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Remap 'y' to always copy to the system clipboard
map('n', 'y', '"+y')
map('v', 'y', '"+y')
-- Remap 'p' to always paste from the system clipboard
map('n', 'p', '"+p')
map('v', 'p', '"+p')
map('n', 'P', '"+P')
map('v', 'P', '"+P')

-- Lsp configs
map('n', '<space>e', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<space>q', vim.diagnostic.setloclist)
