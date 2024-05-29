require "nvchad.mappings"

-- add yours here

local map = vim.keymap.set

map("n", ";", ":", { desc = "CMD enter command mode" })
map("i", "jk", "<ESC>")

-- map({ "n", "i", "v" }, "<C-s>", "<cmd> w <cr>")

-- Remap 'y' to always copy to the system clipboard
map('n', 'y', '"+y')
map('v', 'y', '"+y')