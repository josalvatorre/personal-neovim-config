-- EXAMPLE 
local on_attach = require("nvchad.configs.lspconfig").on_attach
local on_init = require("nvchad.configs.lspconfig").on_init
local capabilities = require("nvchad.configs.lspconfig").capabilities

local lspconfig = require "lspconfig"
local servers = {
  "cssls",
  "html",
  "pyright",
}

-- lsps with default config
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    on_attach = on_attach,
    on_init = on_init,
    capabilities = capabilities,
  }
end

-- typescript
lspconfig.tsserver.setup {
  on_attach = on_attach,
  on_init = on_init,
  capabilities = capabilities,
}

lspconfig.efm.setup {
  init_options = {documentFormatting = true},
  settings = {
    rootMarkers = {".git/"},
    languages = {
      lua = {
        {formatCommand = "lua-format -i", formatStdin = true}
      }
    }
  }
}

-- The following was partially copied from
-- https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#suggested-configuration
-- I had more in https://github.com/josalvatorre/personal-nvchad-custom/blob/6d8f8a1c1243b651b10159632deea611a30c11cb/configs/lspconfig.lua#L35-L74
-- but removed them after NvChad took care of a lot more defaults.
-- I now add them back in as needed.

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
