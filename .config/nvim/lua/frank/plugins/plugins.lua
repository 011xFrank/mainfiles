local plugins = {
  {
    "sainnhe/gruvbox-material",
    priority = 1000,
    config = function ()
      vim.g.gruvbox_material_foreground = 'material'
      vim.g.gruvbox_material_enable_bold = "0"
      vim.g.gruvbox_material_enable_italic = false
      vim.g.gruvbox_material_transparent_background = "1"
      vim.g.gruvbox_material_float_style = 'dim'

      vim.cmd("colorscheme gruvbox-material")
      vim.cmd("highlight Pmenu guibg=NONE")
    end
  },

  {"nvim-lualine/lualine.nvim"},

  {
    "brenoprata10/nvim-highlight-colors",
    config = function()
      require('nvim-highlight-colors').setup({})
    end
  },

  {
    "tris203/precognition.nvim",
    config = function ()
      -- require("precognition").toggle()
    end
  },

  {
    "ThePrimeagen/harpoon",
    config = function ()
      vim.g.mapleader = " "
      local set = vim.keymap.set
      local opts = { noremap = true, silent = true }

      require("harpoon").setup()

      set('n',"<leader>hm",":lua require('harpoon.mark').add_file() <CR>", opts)
      set('n',"<leader>hM",":Telescope harpoon marks <CR>", opts)
      set('n',"<leader>hp",":lua require('harpoon.ui').nav_prev() <CR>", opts)
      set('n',"<leader>hn",":lua require('harpoon.ui').nav_next() <CR>", opts)
    end
  },

  {
    "lewis6991/gitsigns.nvim",
    config = function()
      require("gitsigns").setup({
        signs = {
          add = { text = "│" },
          change = { text = "│" },
          delete = { text = "" },
          topdelete = { text = "‾" },
          changedelete = { text = "~" },
          untracked = { text = "│" },
        },
      })
    end
  },

  {"nvim-tree/nvim-web-devicons"},

  {
    "numToStr/Comment.nvim",
    lazy = false,
    config = function ()
      local comment = require("Comment")

      comment.setup({
        toggler = {
          line = "<leader>/",
        },
        opleader = {
          line = "<leader>/",
          block = "<leader>/"
        }
      })
    end
  },

  {"williamboman/mason.nvim", dependencies = "williamboman/mason-lspconfig.nvim"},

  {
    "nvim-treesitter/nvim-treesitter",
    build = function()
      require("nvim-treesitter.install").update({ with_sync = true })()
    end,
    config = function ()
      require'nvim-treesitter.configs'.setup {
        ensure_installed = { "toml","json","asm","make","bash","c","cpp","python", "lua", "vim", "vimdoc", "query" },
        sync_install = false,
        auto_install = true,
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = false,
        },
        indent = { -- Configure indentation for Lua files
          enable = true,
          default_indent = 8,  -- Adjust this to 8 for 8 spaces
          lowercase = false,
        },
      }
    end
  },

  {
    "lukas-reineke/indent-blankline.nvim",
    main = "ibl",
    opts = {},
    dependencies = 'tpope/vim-sleuth',
    config = function ()
      require("ibl").setup({
        indent = {
          -- char = '🭲',
          char = '┆',
        },
        scope = {
          enabled = false
        },
        exclude = {
          filetypes = {'sh','asm','make','gitconfig','rust','text'},
        },
      })
    end
  },

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
    config = function ()
      require("barbecue").setup({
        exclude_filetypes = { "NvimTree" },
        theme = {
          normal = { fg = "#c4a089" }, -- Warm beige
          ellipsis = { fg = "#8a6542" }, -- Dark brown
          separator = { fg = "#8a6542" },
          modified = { fg = "#8a6542" },
          dirname = { fg = "#8a6542" },
          basename = { bold = true },
          context = {},
          context_file = { fg = "#b58900" }, -- Golden brown
          context_module = { fg = "#b58900" },
          context_namespace = { fg = "#b58900" },
          context_package = { fg = "#b58900" },
          context_class = { fg = "#b58900" },
          context_method = { fg = "#b58900" },
          context_property = { fg = "#b58900" },
          context_field = { fg = "#b58900" },
          context_constructor = { fg = "#b58900" },
          context_enum = { fg = "#b58900" },
          context_interface = { fg = "#b58900" },
          context_function = { fg = "#b58900" },
          context_variable = { fg = "#b58900" },
          context_constant = { fg = "#b58900" },
          context_string = { fg = "#b58900" },
          context_number = { fg = "#b58900" },
          context_boolean = { fg = "#b58900" },
          context_array = { fg = "#b58900" },
          context_object = { fg = "#b58900" },
          context_key = { fg = "#b58900" },
          context_null = { fg = "#b58900" },
          context_enum_member = { fg = "#b58900" },
          context_struct = { fg = "#b58900" },
          context_event = { fg = "#b58900" },
          context_operator = { fg = "#b58900" },
          context_type_parameter = { fg = "#b58900" },
        },
      })
    end
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
    event = "InsertEnter",
    dependencies = {
      -- Snippet Engine & its associated nvim-cmp source
      "L3MON4D3/LuaSnip",
      "saadparwaiz1/cmp_luasnip",

      -- Adds LSP completion capabilities
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-path",

      -- Adds a number of user-friendly snippets
      "rafamadriz/friendly-snippets",

      -- Adds vscode-like pictograms
      "onsails/lspkind.nvim",
    }
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

return plugins
