return {
    {
        'nvim-telescope/telescope.nvim',
        dependencies = { 'nvim-lua/plenary.nvim' },
        config = function()
            require('telescope').setup({
                defaults = {
                    path_display = { truncate = 2 },
                    layout_config = {
                        height = 0.95,
                        width = 0.95,
                        horizontal = {
                            prompt_position = 'top',
                            preview_width = 0.7,
                            results_width = 0.3,
                        },
                    },
                    vimgrep_arguments = {
                        'rg',
                        '--color=never',
                        '--no-heading',
                        '--with-filename',
                        '--line-number',
                        '--column',
                        '--smart-case',
                    },
                },
            })
            require('telescope').load_extension('aerial')
        end,
    },
}
