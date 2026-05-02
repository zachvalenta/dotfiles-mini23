-- Autocmds are automatically loaded on the VeryLazy event
-- Default autocmds that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/autocmds.lua
--
-- Add any additional autocmds here
-- with `vim.api.nvim_create_autocmd`
--
-- Or remove existing autocmds by their group name (which is prefixed with `lazyvim_` for the defaults)
-- e.g. vim.api.nvim_del_augroup_by_name("lazyvim_wrap_spell")

local function disable_markdown_spell(buf)
    if buf == vim.api.nvim_get_current_buf() then
        vim.opt_local.spell = false
    end
    for _, win in ipairs(vim.fn.win_findbuf(buf)) do
        vim.api.nvim_set_option_value("spell", false, { win = win })
    end
end

vim.api.nvim_create_autocmd("FileType", {
    pattern = "markdown",
    callback = function(event)
        disable_markdown_spell(event.buf)
    end,
})

for _, buf in ipairs(vim.api.nvim_list_bufs()) do
    if vim.bo[buf].filetype == "markdown" then
        disable_markdown_spell(buf)
    end
end
