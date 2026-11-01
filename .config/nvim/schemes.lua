{
  "oxidescheme/nvim",
  name = "oxide",
  lazy = false,
  priority = 1000,
  config = function()
    require("oxide").setup({
      transparent = true, -- Enable transparent background
      terminal_colors = true, -- Configure terminal colors

      styles = {
        comments = { italic = true },
        keywords = {},
        functions = {},
        variables = {},
        strings = {},
        booleans = {},
        numbers = {},
      },

      -- Override colors
      on_colors = function(colors)
        colors.red = "#ff0000" -- Make red more intense
      end,

      -- Override highlight groups
      on_highlights = function(highlights, colors)
        highlights.Comment = { fg = colors.green, italic = true }
      end,
    })
  end,
}

{
  "rebelot/kanagawa.nvim",
  config = function()
    -- Default options:
    require('kanagawa').setup({
      compile = false,             -- enable compiling the colorscheme
      undercurl = true,            -- enable undercurls
      commentStyle = { italic = true },
      functionStyle = {},
      keywordStyle = { italic = true},
      statementStyle = { bold = true },
      typeStyle = {},
      transparent = true,         -- do not set background color
      dimInactive = true,         -- dim inactive window `:h hl-NormalNC`
      terminalColors = false,       -- define vim.g.terminal_color_{0,17}
      colors = {                   -- add/modify theme and palette colors
        palette = {},
        theme = { wave = {}, lotus = {}, dragon = {}, all = {} },
      },
      overrides = function(colors) -- add/modify highlights
        return {}
      end,
      theme = "dragon",              -- Load "wave" theme
      background = {               -- map the value of 'background' option to a theme
        dark = "dragon",           -- try "dragon" !
        light = "lotus"
      },
    })

    -- setup must be called before loading
    vim.cmd("colorscheme kanagawa")
  end,
}

{
  "catppuccin/nvim",
  name = "catppuccin",
  priority = 1000,
  config = function()
    require("catppuccin").setup({
      flavour = "auto", -- latte, frappe, macchiato, mocha
      background = { -- :h background
        light = "latte",
        dark = "mocha",
      },
      transparent_background = true, -- disables setting the background color.
      float = {
        transparent = true, -- enable transparent floating windows
        solid = false, -- use solid styling for floating windows, see |winborder|
      },
      term_colors = false, -- sets terminal colors (e.g. `g:terminal_color_0`)
      dim_inactive = {
        enabled = false, -- dims the background color of inactive window
        shade = "dark",
        percentage = 0.15, -- percentage of the shade to apply to the inactive window
      },
      no_italic = false, -- Force no italic
      no_bold = false, -- Force no bold
      no_underline = false, -- Force no underline
      styles = { -- Handles the styles of general hi groups (see `:h highlight-args`):
        comments = { "italic" }, -- Change the style of comments
        conditionals = { "italic" },
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
        -- miscs = {}, -- Uncomment to turn off hard-coded styles
      },
      lsp_styles = { -- Handles the style of specific lsp hl groups (see `:h lsp-highlight`).
        virtual_text = {
          errors = { "italic" },
          hints = { "italic" },
          warnings = { "italic" },
          information = { "italic" },
          ok = { "italic" },
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
          ok = { "underline" },
        },
        inlay_hints = {
          background = true,
        },
      },
      color_overrides = {},
      custom_highlights = {},
      auto_integrations = true,
      integrations = {
        cmp = true,
        gitsigns = true,
        nvimtree = true,
        notify = false,
        mini = {
          enabled = true,
          indentscope_color = "",
        },
        -- For more plugins integrations please scroll down (https://github.com/catppuccin/nvim#integrations)
      },
    })

    -- setup must be called before loading
    vim.cmd.colorscheme "catppuccin-nvim"
  end
}

{
  "drewxs/ash.nvim",
  lazy = false,
  priority = 1000,
  config = function()
    require("ash").setup ({

      compile_path = vim.fn.stdpath("cache") .. "/ash",

      transparent = true, -- transparent background
      term_colors = true, -- terminal colors (e.g. g:terminal_color_x)
      no_italic = false, -- disable italics
      no_bold = false, -- disable bold
      no_underline = false, -- disable underlines

      -- override highlight groups [function/table]
      -- e.g. highlights = function(colors)
      --     return {
      --         Comment = { fg = colors.red },
      --         CmpBorder = { fg = colors.none },
      --     }
      -- end
      highlights = {},

      -- override style groups
      -- e.g. comments = { "italic", "bold" }
      styles = {
        comments = {},
        conditionals = {},
        loops = {},
        functions = {},
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
    })
  end
}

{
  "oskarnurm/koda.nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("koda").setup({ transparent = true })
  end,
}

{
  "oskarnurm/koda.nvim",
  lazy = false,    -- make sure we load this during startup if it is your main colorscheme
  priority = 1000, -- make sure to load this before all the other start plugins
  config = function()
    require("koda").setup({ transparent = true })
  end,

}

{
  "ember-theme/nvim",
  name = "ember",
  priority = 1000,
  config = function()
    require("ember").setup({
      variant            = "ember", -- "ember", "ember-soft", "ember-light", "ember-auto"
      styles             = {
        comments  = { italic = true },
        keywords  = { bold = true },
        functions = {},
        types     = { bold = true },
      },
      transparent        = true,          -- transparent editor background
      transparent_floats = nil,           -- follows `transparent` by default; set explicitly to override
      dark_variant       = "ember",       -- used by `ember-auto` when background = "dark"
      light_variant      = "ember-light", -- used by `ember-auto` when background = "light"
      on_colors          = nil,           -- function(palette) - modify palette before theme builds
      on_highlights      = nil,           -- function(highlights, theme) - modify highlight groups
    })
  end,
}


