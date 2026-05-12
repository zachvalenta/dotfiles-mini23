return {
    {
        'stevearc/aerial.nvim',
        dependencies = { 'nvim-treesitter/nvim-treesitter' },
        opts = {
            backends = { 'treesitter' },
            open_automatic = false,
            show_guides = true,
            layout = {
                default_direction = 'left',
                placement = 'window',
                width = 30,
            },
            -- all markdown headings are 'Interface' kind; map level -> rainbow highlight
            get_highlight = function(symbol, _, _)
                if symbol.kind == 'Interface' or symbol.kind == 'Text' then
                    return 'AerialRainbow' .. math.min(symbol.level + 1, 6)
                end
            end,
            -- remove [I] icon from markdown headings
            icons = {
                Interface = '',
                Text = '',
            },
            -- keymaps for the aerial panel itself
            keymaps = {
                ['<Tab>'] = 'actions.jump',  -- goto header, return focus to main buffer
                ['/'] = function()
                    require('telescope').extensions.aerial.aerial()
                end,
            },
            on_attach = function(bufnr)
                -- scroll prev/next header from main buffer
                vim.keymap.set('n', '{', '<cmd>AerialPrev<CR>', { buffer = bufnr })
                vim.keymap.set('n', '}', '<cmd>AerialNext<CR>', { buffer = bufnr })
                -- focus aerial panel
                vim.keymap.set('n', '<Tab>', '<cmd>AerialToggle!<CR>', { buffer = bufnr })
            end,
        },
    },
}
