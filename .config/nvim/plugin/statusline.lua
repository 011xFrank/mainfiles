if vim.g.loaded_custom_statusline then
    return
end
vim.g.loaded_custom_statusline = 1

-- File type icons (requires Nerd Font)
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

-- Cache for expensive operations
local cache = {
    git_info = { branch = "", status = {}, remote = {}, last_update = 0 },
    file_info = { icon = "", path = "", last_file = "" },
    harpoon = { status = "", last_file = "" }
}

-- Cache TTL in milliseconds
local CACHE_TTL = 1000
local GIT_CACHE_TTL = 2000

-- Utility function to check cache validity
local function is_cache_valid(cache_entry, ttl)
    return cache_entry.last_update > 0 and
        (vim.loop.now() - cache_entry.last_update) < ttl
end

-- Fast file icon lookup with caching
local function get_file_icon()
    local current_file = vim.fn.expand('%:t')

    if cache.file_info.last_file == current_file then
        return cache.file_info.icon
    end

    local icon = file_icons.default
    if current_file ~= '' then
        local ext = current_file:match("%.([^.]+)$")
        if ext then
            icon = file_icons[ext:lower()] or file_icons.default
        end
    end

    cache.file_info.icon = icon
    cache.file_info.last_file = current_file
    return icon
end

-- Cached file path
local function get_file_path()
    local current_file = vim.fn.expand('%:t')

    if cache.file_info.last_file == current_file then
        return cache.file_info.path
    end

    local filepath = vim.fn.expand('%:~:.')
    local path = filepath == '' and '[No Name]' or filepath

    cache.file_info.path = path
    cache.file_info.last_file = current_file
    return path
end

-- Optimized git operations with caching
local function update_git_cache()
    local now = vim.loop.now()
    if is_cache_valid(cache.git_info, GIT_CACHE_TTL) then
        return
    end

    -- Single git command to get all info efficiently
    local handle = io.popen("git status --porcelain -b 2>/dev/null")
    if not handle then
        cache.git_info = { branch = "", status = {}, remote = {}, last_update = now }
        return
    end

    local result = handle:read("*a")
    handle:close()

    if not result or result == "" then
        cache.git_info = { branch = "", status = {}, remote = {}, last_update = now }
        return
    end

    -- Parse branch info from first line
    local branch = ""
    local first_line = result:match("([^\r\n]*)")
    if first_line and first_line:match("^##") then
        branch = first_line:match("^## ([^.%s]+)") or ""
    end

    -- Parse file status
    local added, modified, removed = 0, 0, 0
    for line in result:gmatch("[^\r\n]+") do
        if not line:match("^##") then
            local status = line:sub(1, 2)
            if status:match("[AM]") then added = added + 1 end
            if status:match("[M ]M") then modified = modified + 1 end
            if status:match("[DM]") then removed = removed + 1 end
        end
    end

    cache.git_info = {
        branch = branch,
        status = { added = added, modified = modified, removed = removed },
        remote = { ahead = 0, behind = 0 }, -- Skip expensive remote check for now
        last_update = now
    }
end

local function get_git_info()
    update_git_cache()
    return cache.git_info.branch, cache.git_info.status, cache.git_info.remote
end

-- Optimized diagnostics (use built-in counts)
local function get_diagnostic_string()
    local diagnostics = vim.diagnostic.count(0)
    local parts = {}

    local error_count = diagnostics[vim.diagnostic.severity.ERROR] or 0
    local warn_count = diagnostics[vim.diagnostic.severity.WARN] or 0

    if error_count > 0 then
        table.insert(parts, " " .. error_count .. "E")
    end
    if warn_count > 0 then
        table.insert(parts, " " .. warn_count .. "W")
    end

    return #parts > 0 and table.concat(parts, "") or ""
end

-- Optimized harpoon status with caching
local function get_harpoon_status()
    local current_file = vim.api.nvim_buf_get_name(0)

    if cache.harpoon.last_file == current_file then
        return cache.harpoon.status
    end

    local status = ""
    local ok, harpoon = pcall(require, "harpoon")
    if ok then
        local list = harpoon:list()
        local relative_path = vim.fn.expand('%:~:.')

        for i, item in ipairs(list.items) do
            if item.value == relative_path or item.value == current_file then
                status = "  [" .. i .. "]"
                break
            end
        end
    end

    cache.harpoon.status = status
    cache.harpoon.last_file = current_file
    return status
end

-- Main statusline function (optimized)
local function custom_statusline()
    local parts = {}

    -- File info
    local icon = get_file_icon()
    local path = get_file_path()
    table.insert(parts, icon .. " " .. path)

    -- Git info
    local branch, git_status = get_git_info()
    if branch ~= "" then
        table.insert(parts, " @ " .. branch)

        -- Compact git status
        local git_parts = {}
        if git_status.added > 0 then table.insert(git_parts, "+" .. git_status.added) end
        if git_status.modified > 0 then table.insert(git_parts, "~" .. git_status.modified) end
        if git_status.removed > 0 then table.insert(git_parts, "-" .. git_status.removed) end

        if #git_parts > 0 then
            table.insert(parts, " [" .. table.concat(git_parts, " ") .. "]")
        end
    end

    -- Diagnostics (only errors and warnings for brevity)
    local diag_str = get_diagnostic_string()
    if diag_str ~= "" then
        table.insert(parts, diag_str)
    end

    -- Harpoon status
    local harpoon_status = get_harpoon_status()
    if harpoon_status ~= "" then
        table.insert(parts, harpoon_status)
    end

    return table.concat(parts, "")
end

-- Global access
_G.custom_statusline = custom_statusline

-- Set statusline
vim.o.statusline = "%{luaeval('custom_statusline()')}"

-- Optimized autocmds - fewer events, grouped efficiently
local augroup = vim.api.nvim_create_augroup("CustomStatusline", { clear = true })

-- File-related events
vim.api.nvim_create_autocmd({ "BufEnter", "BufRead", "BufNewFile" }, {
    group = augroup,
    callback = function()
        -- Clear file cache on buffer change
        cache.file_info.last_file = ""
        cache.harpoon.last_file = ""
        vim.cmd.redrawstatus()
    end,
})

-- Content change events (less frequent updates)
vim.api.nvim_create_autocmd({ "BufWritePost", "DiagnosticChanged" }, {
    group = augroup,
    callback = function()
        -- Clear git cache on write
        cache.git_info.last_update = 0
        vim.cmd.redrawstatus()
    end,
})

-- Toggle command
vim.api.nvim_create_user_command('ToggleCustomStatusline', function()
    if vim.o.statusline == "%{luaeval('custom_statusline()')}" then
        vim.o.statusline = ""
        print("Custom statusline disabled")
    else
        vim.o.statusline = "%{luaeval('custom_statusline()')}"
        print("Custom statusline enabled")
    end
end, {})
