return {
    {
        'echasnovski/mini.icons', version = '*'
    },

    {
        "tpope/vim-sleuth"
    },

    {
        'windwp/nvim-autopairs',
        event = "InsertEnter",
        config = true
    },

    {
        "brenoprata10/nvim-highlight-colors",
        config = function()
            require('nvim-highlight-colors').setup({})
        end
    }
}
