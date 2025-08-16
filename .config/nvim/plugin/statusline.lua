-- Enhanced statusline plugin for Neovim
-- Place this file in: ~/.config/nvim/plugin/statusline.lua
-- Format: <icon> <path> @ <branch> [git-indicators] <diagnostics>

-- Prevent loading twice
if vim.g.loaded_custom_statusline then
    return
end
vim.g.loaded_custom_statusline = 1

-- File type icons (requires a Nerd Font)
local file_icons = {
    lua = "󰢱",
    python = "󰌠",
    javascript = "󰌞",
    typescript = "󰛦",
    java = "󰬷",
    c = "󰙱",
    cpp = "󰙲",
    rust = "󱘗",
    go = "󰟓",
    html = "󰌝",
    css = "󰌜",
    json = "󰘦",
    xml = "󰗀",
    yaml = "󰈙",
    toml = "󰈙",
    markdown = "󰍔",
    vim = "󰕷",
    sh = "󱆃",
    zsh = "󱆃",
    fish = "󰈺",
    dockerfile = "󰡨",
    sql = "󰆼",
    php = "󰌟",
    ruby = "󰴭",
    default = "󰈙"
}

-- Function to get file icon based on extension
local function get_file_icon()
    local filename = vim.fn.expand('%:t')
    if filename == '' then
        return file_icons.default
    end

    local extension = filename:match("^.+%.(.+)$")
    if not extension then
        return file_icons.default
    end

    return file_icons[extension:lower()] or file_icons.default
end

-- Function to get the current git branch
local function get_git_branch()
    local handle = io.popen("git branch --show-current 2>/dev/null")
    if not handle then
        return ""
    end

    local result = handle:read("*a")
    handle:close()

    if result and result ~= "" then
        return result:gsub("%s+", "") -- Remove whitespace
    end
    return ""
end

-- Function to get detailed git status
local function get_git_status()
    local handle = io.popen("git status --porcelain 2>/dev/null")
    if not handle then
        return { added = 0, modified = 0, removed = 0 }
    end

    local result = handle:read("*a")
    handle:close()

    local added, modified, removed = 0, 0, 0

    if result and result ~= "" then
        for line in result:gmatch("[^\r\n]+") do
            local status = line:sub(1, 2)
            -- Check index status (first character)
            if status:match("^A") then
                added = added + 1
            elseif status:match("^M") then
                modified = modified + 1
            elseif status:match("^D") then
                removed = removed + 1
            end
            -- Check working tree status (second character)
            if status:match("^.M") then
                modified = modified + 1
            elseif status:match("^.D") then
                removed = removed + 1
            elseif status:match("^.A") then
                added = added + 1
            end
        end
    end

    return { added = added, modified = modified, removed = removed }
end

-- Function to get git ahead/behind info
local function get_git_remote_status()
    local handle = io.popen("git rev-list --left-right --count HEAD...@{upstream} 2>/dev/null")
    if not handle then
        return { ahead = 0, behind = 0 }
    end

    local result = handle:read("*a")
    handle:close()

    if result and result ~= "" then
        local ahead, behind = result:match("(%d+)%s+(%d+)")
        if ahead and behind then
            return { ahead = tonumber(ahead), behind = tonumber(behind) }
        end
    end

    return { ahead = 0, behind = 0 }
end

-- Function to get diagnostic counts
local function get_diagnostics()
    local diagnostics = {
        error = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.ERROR }),
        warn = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.WARN }),
        info = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.INFO }),
        hint = #vim.diagnostic.get(0, { severity = vim.diagnostic.severity.HINT })
    }
    return diagnostics
end

-- Function to get the relative file path
local function get_file_path()
    local filepath = vim.fn.expand('%:~:.')
    if filepath == '' then
        return '[No Name]'
    end
    return filepath
end

-- Function to get harpoon status
local function get_harpoon_status()
    -- Check if harpoon is available
    local ok, harpoon = pcall(require, "harpoon")
    if not ok then
        return ""
    end

    local list = harpoon:list()
    local current_file = vim.api.nvim_buf_get_name(0)
    local current_file_relative = vim.fn.expand('%:~:.')

    -- Debug: uncomment these lines to see what's happening
    -- print("Current file (full):", current_file)
    -- print("Current file (relative):", current_file_relative)
    -- print("Harpoon items:", vim.inspect(list.items))

    for i, item in ipairs(list.items) do
        -- Try multiple comparison methods
        if item.value == current_file or
            item.value == current_file_relative or
            item.value == vim.fn.expand('%:p') or
            item.value == vim.fn.expand('%') then
            return " 📌" .. i
        end
    end
    return ""
end

-- Main statusline function
local function custom_statusline()
    local parts = {}

    -- File icon and path
    local icon = get_file_icon()
    local path = get_file_path()
    table.insert(parts, icon .. " " .. path)


    -- Git information (only show if in a git repo)
    local branch = get_git_branch()
    if branch ~= "" then
        table.insert(parts, " @ " .. branch)

        -- Git status indicators
        local git_status = get_git_status()
        local git_parts = {}

        if git_status.added > 0 then
            table.insert(git_parts, "++" .. git_status.added)
        end

        if git_status.modified > 0 then
            table.insert(git_parts, "~" .. git_status.modified)
        end

        if git_status.removed > 0 then
            table.insert(git_parts, "-" .. git_status.removed)
        end

        -- Remote status (ahead/behind)
        local remote = get_git_remote_status()
        if remote.ahead > 0 then
            table.insert(git_parts, "↑" .. remote.ahead)
        end
        if remote.behind > 0 then
            table.insert(git_parts, "↓" .. remote.behind)
        end

        if #git_parts > 0 then
            table.insert(parts, " [" .. table.concat(git_parts, " ") .. "]")
        end
    end

    -- Diagnostics
    local diagnostics = get_diagnostics()
    local diag_parts = {}

    if diagnostics.error > 0 then
        table.insert(diag_parts, " " .. diagnostics.error .. " errors")
    end

    if diagnostics.warn > 0 then
        table.insert(diag_parts, " " .. diagnostics.warn .. " warnings")
    end

    if diagnostics.info > 0 then
        table.insert(diag_parts, " " .. diagnostics.info .. " info")
    end

    if diagnostics.hint > 0 then
        table.insert(diag_parts, " " .. diagnostics.hint .. " hints")
    end

    if #diag_parts > 0 then
        table.insert(parts, table.concat(diag_parts, ""))
    end

    -- Harpoon status (show if current file is harpooned)
    local harpoon_status = get_harpoon_status()
    if harpoon_status ~= "" then
        table.insert(parts, harpoon_status)
    end

    return table.concat(parts, "")
end

-- Make the function globally accessible
_G.custom_statusline = custom_statusline

-- Set the statusline
vim.o.statusline = "%{luaeval('custom_statusline()')}"

-- Auto-update statusline on various events
local augroup = vim.api.nvim_create_augroup("CustomStatusline", { clear = true })

vim.api.nvim_create_autocmd({
    "BufEnter", "BufWritePost", "TextChanged", "TextChangedI",
    "DiagnosticChanged", "VimResized", "BufRead", "BufNewFile", "WinEnter"
}, {
    group = augroup,
    callback = function()
        vim.cmd("redrawstatus")
    end,
})

-- Update statusline when git operations might have occurred
vim.api.nvim_create_autocmd("User", {
    pattern = "FugitiveChanged",
    group = augroup,
    callback = function()
        vim.cmd("redrawstatus")
    end,
})

-- Optional: Create a command to toggle the statusline
vim.api.nvim_create_user_command('ToggleCustomStatusline', function()
    if vim.o.statusline == "%{luaeval('custom_statusline()')}" then
        vim.o.statusline = "" -- Reset to default
        print("Custom statusline disabled")
    else
        vim.o.statusline = "%{luaeval('custom_statusline()')}"
        print("Custom statusline enabled")
    end
end, {})
