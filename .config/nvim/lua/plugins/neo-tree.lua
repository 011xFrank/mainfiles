return {
  "nvim-neo-tree/neo-tree.nvim",
  lazy = false,
  priority = 1000,
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
  },
  config = function ()
    require("neo-tree").setup({
      hijack_netrw_behavior = "open_current",
      popup_border_style = "double",
      window = {
        position = "current",
        width = 1000,
        mapping_options = {
          noremap = true,
          nowait = true,
        },
        mappings = {
          ["A"] = "add_directory", -- also accepts the optional config.show_path option like "add". this also supports BASH style brace expansion.
          ["d"] = "delete",
          ["r"] = "rename",
          ["y"] = "copy_to_clipboard",
          ["x"] = "cut_to_clipboard",
          ["p"] = "paste_from_clipboard",
          ["c"] = "copy",
        }
      },
      git_status = {
        symbols = {
          -- Change type
          added     = "", -- or "✚", but this is redundant info if you use git_status_colors on the name
          modified  = "", -- or "", but this is redundant info if you use git_status_colors on the name
          deleted   = "✖",-- this can only be used in the git_status source
          renamed   = "󰁕",-- this can only be used in the git_status source
          -- Status type
          untracked = "",
          ignored   = "",
          unstaged  = "󰄱",
          staged    = "",
          conflict  = "",
        }
      },
      modified = {
        symbol = "[+]",
        highlight = "NeoTreeModified",
      },
      filesystem = {
        follow_current_file = {
          enabled = true
        },
        filtered_items = {
          visible = true,
          show_hidden_count = true,
          hide_dotfiles = false,
          show_gitignored = false
        }
      }
    })


    local set = vim.keymap.set
    local opts = { noremap = true, silent = true }

    set('n', '<leader>n', ":Neotree toggle <CR>", opts)
  end
}
