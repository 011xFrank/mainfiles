return {
    cmd = { 'pylsp' },
    root_markers = { 'pyproject.toml', 'setup.py', 'setup.cfg', 'requirements.txt', 'Pipfile', '.git' },
    filetypes = { 'python' },
    settings = {
        pylsp = {
            plugins = {
                pycodestyle = { enabled = false},
                pyflakes    = { enabled = true},
                pylint      = { enabled = false},
                mccabe      = { enabled = false},
                rope_completion = { enabled = true},
            }
        }
    }
}
