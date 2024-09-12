return  {
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
}
