local options = {
    -- search
    hlsearch    = true,   -- highlight matches from last search
    incsearch   = true,   -- highlight matches as you type
    ignorecase  = true,   -- needed for smartcase to work
    smartcase   = true,   -- insensitive if query lowercase, sensitive if uppercase

    -- display
    number         = true,  -- line numbers
    relativenumber = true,  -- relative line numbers
    cursorline     = true,  -- highlight cursor line
    wrap           = true,  -- wrap long lines
    linebreak      = true,  -- break at word boundaries, not mid-word

    -- editing
    backspace = 'indent,eol,start',  -- sane backspace behaviour
    hidden    = true,                -- allow switching buffers without saving
    tabstop   = 4,                   -- tab = 4 spaces
}

for k, v in pairs(options) do
    vim.opt[k] = v
end

-- highlight cursor line differently in insert mode
-- note: may need adjustment once a colorscheme is configured
vim.api.nvim_create_autocmd('InsertEnter', {
    callback = function()
        vim.api.nvim_set_hl(0, 'CursorLine', { ctermfg = 'White', ctermbg = 'Blue' })
    end,
})
vim.api.nvim_create_autocmd('InsertLeave', {
    callback = function()
        vim.api.nvim_set_hl(0, 'CursorLine', {})
    end,
})
