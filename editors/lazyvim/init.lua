-- bootstrap lazy.nvim, LazyVim and your plugins
require("config.lazy")

-- ZJV
vim.opt.compatible = false -- disable Vi compatibility
vim.cmd("filetype plugin on") -- enable built-in plugins (like netrw)
vim.opt.incsearch = true -- highlight matches as you type
vim.opt.hlsearch = true -- highlight matches from the last search
vim.opt.ignorecase = true -- case-insensitive search
vim.opt.smartcase = true -- case-sensitive if query contains uppercase
vim.opt.relativenumber = true -- relative line numbers
vim.opt.syntax = "enable" -- enable syntax highlighting
vim.opt.backspace = { "indent", "eol", "start" } -- macOS delete key workaround
vim.opt.hidden = true -- allow hidden buffers
vim.opt.number = true -- show absolute line numbers
vim.opt.tabstop = 4 -- tab key inserts 4 spaces
vim.opt.cursorline = true -- highlight current line
-- highlighting on enter/exit insert mode
vim.api.nvim_create_autocmd("InsertEnter", {
  pattern = "*",
  callback = function()
    vim.cmd("highlight CursorLine ctermfg=white ctermbg=blue")
  end,
})
vim.api.nvim_create_autocmd("InsertLeave", {
  pattern = "*",
  callback = function()
    vim.cmd("highlight CursorLine ctermfg=None ctermbg=None")
  end,
})
-- open URL under cursor
local function open_url_under_cursor()
  local uri = vim.fn.expand("<cWORD>")
  uri = uri:gsub("?", "\\?") -- escape "?" character
  uri = vim.fn.shellescape(uri, 1)
  if uri ~= "" then
    vim.fn.system("open '" .. uri .. "'")
    vim.cmd("redraw!")
  end
end
vim.api.nvim_set_keymap("n", "gx", "<cmd>lua open_url_under_cursor()<CR>", { noremap = true, silent = true })
