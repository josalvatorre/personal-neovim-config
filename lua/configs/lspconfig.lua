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
-- which I guess got moved to https://github.com/neovim/nvim-lspconfig/blob/a3d9395455f2b2e3b50a0b0f37b8b4c23683f44a/doc/lspconfig.txt#L477-L532
-- I had more in https://github.com/josalvatorre/personal-nvchad-custom/blob/6d8f8a1c1243b651b10159632deea611a30c11cb/configs/lspconfig.lua#L35-L74
-- but removed them after NvChad took care of a lot more defaults.
-- I now add them back in as needed.

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)

-- Use LspAttach autocommand to only map the following keys
-- after the language server attaches to the current buffer
vim.api.nvim_create_autocmd('LspAttach', {
  group = vim.api.nvim_create_augroup('UserLspConfig', {}),
  callback = function(ev)
    -- Buffer local mappings.
    -- See `:help vim.lsp.*` for documentation on any of the below functions
    local opts = { buffer = ev.buf }
    vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, opts)
  end,
})
