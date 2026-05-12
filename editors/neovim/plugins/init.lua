return {
    {
        'nvim-neo-tree/neo-tree.nvim',
        branch = 'v3.x',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'MunifTanjim/nui.nvim',
            'nvim-tree/nvim-web-devicons',
        },
        opts = {
            close_if_last_window = false,
            enable_git_status = true,
            enable_diagnostics = true,
            open_files_do_not_replace_types = { 'terminal', 'qf', 'aerial' },
            window = {
                position = 'left',
                width = 28,
                mappings = {
                    ['<space>'] = 'none',
                    ['h'] = 'close_node',
                    ['l'] = 'open',
                    ['<CR>'] = 'open',
                    ['q'] = 'close_window',
                    ['/'] = 'fuzzy_finder',
                    ['#'] = 'fuzzy_sorter',
                    ['<C-x>'] = 'clear_filter',
                    ['D'] = 'none',
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
                        ['<down>'] = 'move_cursor_down',
                        ['<C-n>'] = 'move_cursor_down',
                        ['<up>'] = 'move_cursor_up',
                        ['<C-p>'] = 'move_cursor_up',
                        ['<esc>'] = 'close',
                    },
                },
            },
        },
    },
}
