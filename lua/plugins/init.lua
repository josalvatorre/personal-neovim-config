return {
  {
    "stevearc/conform.nvim",
    event = 'BufWritePre',
    config = function()
      require "configs.conform"
    end,
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      require("nvchad.configs.lspconfig").defaults()
      require "configs.lspconfig"
    end,
  },
  {
    "williamboman/mason.nvim",
    opts = {
      ensure_installed = {
        "css-lsp" ,
        "efm",
        "groovy-language-server",
        "html-lsp",
        "jdtls",
        "lua-language-server",
        "prettier",
        "pyright",
        "stylua",
        "terraform-ls",
        "typescript-language-server",
      },
    },
  },
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = "all",
      auto_install = true,
    },
  },
  "nvim-lua/plenary.nvim",
  {
    "nvim-tree/nvim-web-devicons",
    lazy = true,
  },
  {
    "nvchad/ui",
    config = function()
      require "nvchad"
    end
  },
  {
     "nvchad/base46",
     lazy = true,
     build = function()
       require("base46").load_all_highlights()
     end,
  },
  -- optional, needed for theme switcher
  -- or just use Telescope themes
  "nvchad/volt",
  {
    "mfussenegger/nvim-jdtls",
    ft = "java",
  },
  {
    "stevearc/aerial.nvim",
    opts = {},
    -- Optional dependencies
    dependencies = {
      "nvim-treesitter/nvim-treesitter",
      "nvim-tree/nvim-web-devicons",
    },
    event = "BufEnter",
    config = function()
      require("aerial").setup({
        -- optionally use on_attach to set keymaps when aerial has attached to a buffer
        on_attach = function(bufnr)
          -- Jump forwards/backwards with '{' and '}'
          vim.keymap.set("n", "{", "<cmd>AerialPrev<CR>", { buffer = bufnr })
          vim.keymap.set("n", "}", "<cmd>AerialNext<CR>", { buffer = bufnr })
        end,
      })
      -- You probably also want to set a keymap to toggle aerial
      vim.keymap.set("n", "<leader>a", "<cmd>AerialToggle!<CR>")
    end
  },
  {
    "nvim-pack/nvim-spectre",
    lazy = false,
    config = function()
      vim.keymap.set('n', '<leader>S', '<cmd>lua require("spectre").toggle()<CR>', {
        desc = "Toggle Spectre"
      })
      vim.keymap.set('n', '<leader>sw', '<cmd>lua require("spectre").open_visual({select_word=true})<CR>', {
        desc = "Search current word"
      })
      vim.keymap.set('v', '<leader>sw', '<esc><cmd>lua require("spectre").open_visual()<CR>', {
        desc = "Search current word"
      })
      vim.keymap.set('n', '<leader>sp', '<cmd>lua require("spectre").open_file_search({select_word=true})<CR>', {
        desc = "Search on current file"
      })
    end
  },
  {
    "tpope/vim-fugitive",
    lazy = false,
  },
  {
    -- Apparently, there is also an .nvim version, but it's known to have more issues.
    'Exafunction/codeium.vim',
    event = "BufEnter",
    config = function()
      -- Defaults documented here:
      -- https://github.com/Exafunction/codeium.vim/blob/31dd2962c81759be007895db6ce089feec397c86/README.md?plain=1#L49-L101

      -- Override tab because I prefer to reserve it for navigating autocomplete suggestions.
      vim.g.codeium_no_map_tab = 1
      vim.keymap.set('i', '<C-g>', function() return vim.fn['codeium#Accept']() end, { expr = true, silent = true })
    end,
  },
}
