require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- Remap 'y' to always copy to the system clipboard
map('n', 'y', '"+y')
map('v', 'y', '"+y')
-- Disable 'p' since OSC 52 paste doesn't work in Zellij.
-- Paste with Cmd+V instead
map('n', 'p', '<Nop>')
map('v', 'p', '<Nop>')
map('n', 'P', '<Nop>')
map('v', 'P', '<Nop>')

-- Lsp configs
map('n', '<space>e', vim.diagnostic.open_float)
map('n', '[d', vim.diagnostic.goto_prev)
map('n', ']d', vim.diagnostic.goto_next)
map('n', '<space>q', vim.diagnostic.setloclist)
