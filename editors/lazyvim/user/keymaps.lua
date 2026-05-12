-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map("n", "<leader>ff", require("fzf-lua").files, { desc = "Find Files (fzf-lua)" })
map("n", "<leader>fg", require("fzf-lua").live_grep, { desc = "Live Grep (fzf-lua)" })
map("n", "<leader>fb", require("fzf-lua").buffers, { desc = "Find Buffers (fzf-lua)" })
map("n", "<leader>fh", require("fzf-lua").help_tags, { desc = "Help Tags (fzf-lua)" })
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
        if filetype ~= "neo-tree" and filetype ~= "aerial" then
            vim.api.nvim_set_current_win(win)
            return
        end
    end
end

map("n", "<leader>e", "<cmd>Neotree focus filesystem left<CR>", { desc = "Focus Explorer" })
map("n", "<leader>E", "<cmd>Neotree toggle filesystem left<CR>", { desc = "Toggle Explorer" })
map("n", "<leader>a", function()
    if not focus_filetype("aerial") then
        vim.cmd("AerialOpen! left")
        focus_filetype("aerial")
    end
end, { desc = "Focus Outline" })
map("n", "<leader>A", "<cmd>AerialToggle! left<CR>", { desc = "Toggle Outline" })
map("n", "<leader>w", focus_editor, { desc = "Focus Editor" })
map("n", "<leader>q", "<cmd>qa<CR>", { desc = "Quit All" })
map("n", "<leader>fi", function()
    require("aerial").snacks_picker()
end, { desc = "Find Symbols (aerial)" })
