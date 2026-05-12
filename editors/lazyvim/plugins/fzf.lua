local function open_navigation_sidebars()
    vim.schedule(function()
        vim.cmd("AerialOpen! left")
        vim.cmd("Neotree filesystem reveal left")
        vim.cmd("wincmd l")
        vim.cmd("wincmd l")
    end)
end

local function set_aerial_highlights()
    local colors = { "#f38ba8", "#fab387", "#f9e2af", "#a6e3a1", "#94e2d5", "#89b4fa" }
    for i, color in ipairs(colors) do
        vim.api.nvim_set_hl(0, "AerialRainbow" .. i, { fg = color })
    end
end

return {
    {
        "ibhagwan/fzf-lua",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            require("fzf-lua").setup()
        end,
    },
    {
        "nvim-neo-tree/neo-tree.nvim",
        init = open_navigation_sidebars,
        opts = {
            close_if_last_window = false,
            open_files_do_not_replace_types = { "terminal", "Trouble", "trouble", "qf", "aerial" },
            window = {
                position = "left",
                width = 28,
                mappings = {
                    ["<space>"] = "none",
                    ["h"] = "close_node",
                    ["l"] = "open",
                    ["<CR>"] = "open",
                    ["q"] = "close_window",
                    ["/"] = "fuzzy_finder",
                    ["#"] = "fuzzy_sorter",
                    ["<C-x>"] = "clear_filter",
                    ["D"] = "none",
                },
            },
            filesystem = {
                bind_to_cwd = false,
                follow_current_file = {
                    enabled = true,
                    leave_dirs_open = true,
                },
                find_by_full_path_words = true,
                use_libuv_file_watcher = true,
                window = {
                    fuzzy_finder_mappings = {
                        ["<down>"] = "move_cursor_down",
                        ["<C-n>"] = "move_cursor_down",
                        ["<up>"] = "move_cursor_up",
                        ["<C-p>"] = "move_cursor_up",
                        ["<esc>"] = "close",
                    },
                },
            },
        },
    },
    {
        "stevearc/aerial.nvim",
        dependencies = { "nvim-treesitter/nvim-treesitter" },
        init = function()
            set_aerial_highlights()
            vim.api.nvim_create_autocmd("ColorScheme", {
                callback = set_aerial_highlights,
            })
        end,
        opts = {
            attach_mode = "global",
            backends = { "lsp", "treesitter", "markdown", "man" },
            open_automatic = false,
            show_guides = true,
            layout = {
                default_direction = "left",
                placement = "window",
                width = 30,
            },
            keymaps = {
                ["/"] = function()
                    require("aerial").snacks_picker()
                end,
            },
            get_highlight = function(symbol, _, _)
                if symbol.kind == "Interface" or symbol.kind == "Text" then
                    return "AerialRainbow" .. math.min(symbol.level + 1, 6)
                end
            end,
            icons = {
                Interface = "",
                Text = "",
            },
        },
    },
}
