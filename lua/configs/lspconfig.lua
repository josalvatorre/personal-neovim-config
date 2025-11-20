vim.lsp.config("tsgo", {
  cmd = { "tsgo", "--lsp", "--stdio" },
  filetypes = {
    "javascript",
    "javascriptreact",
    "javascript.jsx",
    "typescript",
    "typescriptreact",
    "typescript.tsx",
  },
  root_markers = {
    "tsconfig.json",
    "tsconfig.base.json",
    "jsconfig.json",
    "package.json",
    ".git",
  },
})

vim.lsp.enable({
  "cssls",
  "gradle_ls",
  "html",
  "pyright",
  "terraformls",
  "tsgo",
})

-- The following was partially copied from
-- https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#suggested-configuration
-- which I guess got moved to https://github.com/neovim/nvim-lspconfig/blob/a3d9395455f2b2e3b50a0b0f37b8b4c23683f44a/doc/lspconfig.txt#L477-L532
-- I had more in https://github.com/josalvatorre/personal-nvchad-custom/blob/6d8f8a1c1243b651b10159632deea611a30c11cb/configs/lspconfig.lua#L35-L74
-- but removed them after NvChad took care of a lot more defaults.
-- I now add them back in as needed.

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