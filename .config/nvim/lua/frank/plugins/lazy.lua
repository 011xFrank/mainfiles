local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

local options = { ui = { border = "double" } }

local plugins = {
  {"nvim-lualine/lualine.nvim"},

  { 'joshuadanpeterson/typewriter' },

  {'brenoprata10/nvim-highlight-colors', config = function() require('nvim-highlight-colors').setup({}) end},

  {"ellisonleao/gruvbox.nvim"},

  {"tris203/precognition.nvim"},

  {'vimwiki/vimwiki'},

  {'ThePrimeagen/harpoon'},

  { "lewis6991/gitsigns.nvim", },

  { "nvim-tree/nvim-web-devicons" },

  { "numToStr/Comment.nvim", lazy = false, },

  { "rose-pine/neovim", name = "rose-pine", lazy = false },

  { "williamboman/mason.nvim", dependencies = { "williamboman/mason-lspconfig.nvim", } },

  { "nvim-treesitter/nvim-treesitter", build = function() require("nvim-treesitter.install").update({ with_sync = true })() end, },

  { "lukas-reineke/indent-blankline.nvim", main = "ibl", opts = {}, dependencies = 'tpope/vim-sleuth'},

  {
    "nvim-neo-tree/neo-tree.nvim",
    branch = "v3.x",
    dependencies = {
      "nvim-lua/plenary.nvim",
      "nvim-tree/nvim-web-devicons", -- not strictly required, but recommended

      "MunifTanjim/nui.nvim",
      -- "3rd/image.nvim", -- Optional image support in preview window: See `# Preview Mode` for more information
      {
        's1n7ax/nvim-window-picker',
        version = '2.*',
        config = function()
          require 'window-picker'.setup({
            filter_rules = {
              include_current_win = false,
              autoselect_one = true,
              -- filter using buffer options
              bo = {
                -- if the file type is one of following, the window will be ignored
                filetype = { 'neo-tree', "neo-tree-popup", "notify" },
                -- if the buffer type is one of following, the window will be ignored
                buftype = { 'terminal', "quickfix" },
              },
            },
          })
        end,
      },
    }
  },

  {
    "kylechui/nvim-surround",
    version = "*", -- Use for stability: omit to use `main` branch for the latest features
    event = "VeryLazy",
    config = function()
      require("nvim-surround").setup()
    end
  },

  {
    "utilyre/barbecue.nvim",
    name = "barbecue",
    version = "*",
    dependencies = {
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons",
    },
  },

  {
    'nvim-telescope/telescope.nvim', tag = '0.1.6',
    dependencies = {
      'nvim-telescope/telescope-fzf-native.nvim', build = 'make',
      'nvim-lua/plenary.nvim',
      'nvim-tree/nvim-web-devicons'
    },
  },

  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      { "antosha417/nvim-lsp-file-operations",config = true }
    }
  },

  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    event = "InsertEnter",
    dependencies = {
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "L3MON4D3/luasnip",
      "saadparwaiz1/cmp_luasnip",
      "rafamadriz/friendly-snippets"
    },
  },

  {
    "windwp/nvim-autopairs",
    opts = {
      fast_wrap = {},
      disable_filetype = { "TelescopePrompt", "vim" },
    },
    config = function(_, opts)
      require("nvim-autopairs").setup(opts)
      local cmp_autopairs = require "nvim-autopairs.completion.cmp"
      require("cmp").event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },

  {
    'goolord/alpha-nvim',
    dependencies = { 'nvim-tree/nvim-web-devicons' },
    config = function ()
      require'alpha'.setup(require'alpha.themes.startify'.config)
    end
  },
}

require("lazy").setup(plugins,options)
