require("neo-tree").setup({
    hijack_netrw_behavior = "open_current",
    popup_border_style = "double",
    window = {
        position = "left",
        width = 40,
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
