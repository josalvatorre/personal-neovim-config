require "nvchad.options"

-- add yours here!

-- local o = vim.o
-- o.cursorlineopt ='both' -- to enable cursorline!

local o = vim.o
-- We're forcing Neovim to use OSC 52 elsewhere.
-- However, we also do this just in case.
-- Neovim would normally check for the value of clipboard to decide whether to use OSC 52.
-- https://neovim.io/doc/user/provider.html#provider-clipboard
-- NvChad sets this to unnamedplus
-- https://github.com/NvChad/NvChad/blob/0496016e188e294ba09dde41914b83800a9fa9ca/lua/nvchad/options.lua#L12
o.clipboard = ""