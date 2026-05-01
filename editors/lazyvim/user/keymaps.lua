-- Keymaps are automatically loaded on the VeryLazy event
-- Default keymaps that are always set: https://github.com/LazyVim/LazyVim/blob/main/lua/lazyvim/config/keymaps.lua
-- Add any additional keymaps here

local map = vim.keymap.set
map("n", "<leader>ff", require("fzf-lua").files, { desc = "Find Files (fzf-lua)" })
map("n", "<leader>fg", require("fzf-lua").live_grep, { desc = "Live Grep (fzf-lua)" })
map("n", "<leader>fb", require("fzf-lua").buffers, { desc = "Find Buffers (fzf-lua)" })
map("n", "<leader>fh", require("fzf-lua").help_tags, { desc = "Help Tags (fzf-lua)" })
