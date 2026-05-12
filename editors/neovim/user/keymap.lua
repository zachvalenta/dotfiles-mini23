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

local function focus_filetype(filetype)
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        if vim.bo[vim.api.nvim_win_get_buf(win)].filetype == filetype then
            vim.api.nvim_set_current_win(win)
            return true
        end
    end
    return false
end

local function focus_editor()
    for _, win in ipairs(vim.api.nvim_list_wins()) do
        local filetype = vim.bo[vim.api.nvim_win_get_buf(win)].filetype
        if filetype ~= 'neo-tree' and filetype ~= 'aerial' then
            vim.api.nvim_set_current_win(win)
            return
        end
    end
end

vim.keymap.set('n', '<leader>e', function()
    vim.cmd('Neotree focus filesystem left')
end)
vim.keymap.set('n', '<leader>E', '<cmd>Neotree toggle filesystem left<CR>')
vim.keymap.set('n', '<leader>a', function()
    if not focus_filetype('aerial') then
        vim.cmd('AerialOpen! left')
        focus_filetype('aerial')
    end
end)
vim.keymap.set('n', '<leader>A', '<cmd>AerialToggle! left<CR>')
vim.keymap.set('n', '<leader>w', focus_editor)
vim.keymap.set('n', '<leader>q', '<cmd>qa<CR>')

vim.schedule(function()
    vim.cmd('AerialOpen! left')
    vim.cmd('Neotree filesystem reveal left')
    vim.cmd('wincmd l')
    vim.cmd('wincmd l')
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
