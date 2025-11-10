return {
  {
    "stevearc/conform.nvim",
    event = "BufWritePre", -- uncomment for format on save
    opts = require "configs.conform",
  },

  -- These are some examples, uncomment them if you want to see them work!
  {
    "neovim/nvim-lspconfig",
    config = function()
      require "configs.lspconfig"
    end,
  },

  {
    "nvim-tree/nvim-tree.lua",
    version = "*",
    lazy = false,
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("nvim-tree").setup {
        view = {
          float = {
            enable = true,
            open_win_config = {
              width = 40,
              height = 60,
            },
          },
          -- width = 30,
          -- width = {
          --   min = 30,
          --   max = 30,
          -- },
        },
        renderer = {
          group_empty = true,
        },
        filters = {
          dotfiles = true,
        },
      }
    end,
  },

  { "tpope/vim-repeat", lazy = false },
  { "tpope/vim-surround", lazy = false },
  { "ryvnf/readline.vim", lazy = false },
  { "machakann/vim-highlightedyank", lazy = false },
  -- { "chentoast/marks.nvim", lazy = false },

  {
    "folke/todo-comments.nvim",
    lazy = false,
    dependencies = { "nvim-lua/plenary.nvim" },
    opts = {
      -- your configuration comes here
      -- or leave it empty to use the default settings
      -- refer to the configuration section below
    },
  },

  -- test new blink
  { import = "nvchad.blink.lazyspec" },

  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      ensure_installed = {
        "vim",
        "lua",
        "vimdoc",
        "html",
        "css",
        "elixir",
        "heex",
        "eex",
        "markdown",
        "kotlin",
      },
    },
  },
}
