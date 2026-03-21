-- WORKSPACE
local ws = {
    '/Users/zach/Documents/zv/notes/domains',
    '/Users/zach/Documents/zv/notes/sw',
    '/Users/zach/Documents/zv/personal/logs',
}

-- TELESCOPE
local t = require('telescope.builtin')

vim.keymap.set('n', '<leader>ff', function()
    t.find_files({ search_dirs = ws })
end)

vim.keymap.set('n', '<leader>fg', function()
    t.live_grep({ search_dirs = ws })
end)

-- fuzzy search MD headers across all workspace dirs (→ true symbol search eventually)
vim.keymap.set('n', '<leader>fs', function()
    t.grep_string({
        search_dirs = ws,
        glob_pattern = '*.md',
        search = '^#',
        use_regex = true,
        prompt_title = 'Headers',
    })
end)

-- fuzzy search MD headers within current buffer
vim.keymap.set('n', '<leader>fi', function()
    require('telescope').extensions.aerial.aerial()
end)

-- MISC
-- open URL under cursor https://vimtricks.com/p/open-url-under-cursor/
vim.keymap.set('n', 'gx', function()
    local uri = vim.fn.expand('<cWORD>')
    uri = uri:gsub('?', '\\?')
    uri = vim.fn.shellescape(uri, 1)
    if uri ~= '' then
        vim.fn.system("open '" .. uri .. "'")
        vim.cmd('redraw!')
    end
end)
