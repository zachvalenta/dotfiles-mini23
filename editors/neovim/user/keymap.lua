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
