return {

  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      { "j-hui/fidget.nvim", tag = "legacy", opts = {} },
      {
        "Equilibris/nx.nvim",
        dependencies = {
          "nvim-telescope/telescope.nvim",
          "joeveiga/ng.nvim",
        },
        opts = {},
        keys = {
          "<leader>nx",
        },
      },
      {
        "smjonas/inc-rename.nvim",
        config = function()
          require("inc_rename").setup()
        end,
      },
      {
        "roobert/tailwindcss-colorizer-cmp.nvim",
        -- optionally, override the default options:
        config = function()
          require("tailwindcss-colorizer-cmp").setup {
            color_square_width = 2,
          }
        end,
      },
      -- Additional lua configuration, makes nvim stuff amazing!
      "folke/neodev.nvim",
    },
    config = function()
      require("mason-lspconfig").setup {
        ensure_installed = {
          "angularls",
          "cssls",
          "dockerls",
          "docker_compose_language_service",
          "eslint",
          "emmet_ls",
          "html",
          "jsonls",
          "lua_ls",
          "remark_ls",
          "mdx_analyzer",
          -- "powershell_es",
          "pyright",
          "svelte",
          "tailwindcss",
          "yamlls",
          "vtsls"
        },
        automatic_installation = true,
      }
      require "nvchad.configs.lspconfig"
      require "configs.lspconfig"
    end,
  },
  {
    "pmizio/typescript-tools.nvim",
  },
  -- {
  --   "yioneko/nvim-vtsls",
  --   lazy = false,
  --   ft = { "typescript", "typescriptreact", "javascript", "javascriptreact" },
  -- },
  {
    "antosha417/nvim-lsp-file-operations",
    event = "BufRead",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-tree.lua",
    },
    config = function()
      require("lsp-file-operations").setup()
    end,
  },
}
