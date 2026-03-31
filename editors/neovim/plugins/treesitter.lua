return {
    {
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        config = function()
            require('nvim-treesitter.config').setup({
                ensure_installed = {
                    'lua', 'python', 'bash', 'markdown', 'markdown_inline',
                    'sql', 'javascript', 'html', 'css',
                    'yaml', 'json', 'toml', 'dockerfile', 'go',
                },
            })
            -- enable treesitter as the active highlighter for markdown
            -- (required for fenced code block injection to work)
            vim.api.nvim_create_autocmd('FileType', {
                pattern = 'markdown',
                callback = function(args)
                    vim.treesitter.start(args.buf)
                end,
            })
        end,
    },
}
