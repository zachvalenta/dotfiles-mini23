return {
    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('catppuccin').setup({
                flavour = 'mocha',
                integrations = {
                    aerial = true,
                    treesitter = true,
                },
                custom_highlights = function(colors)
                    return {
                        -- aerial outliner headings (referenced by aerial's get_highlight)
                        AerialRainbow1 = { fg = colors.red },
                        AerialRainbow2 = { fg = colors.peach },
                        AerialRainbow3 = { fg = colors.yellow },
                        AerialRainbow4 = { fg = colors.green },
                        AerialRainbow5 = { fg = colors.teal },
                        AerialRainbow6 = { fg = colors.blue },
                        -- blockquotes
                        ['@markup.quote'] = { fg = colors.mauve, italic = true },
                        -- bold / italic
                        ['@markup.italic'] = { fg = colors.red, italic = true },
                        ['@markup.bold']   = { fg = colors.red, bold = true },
                    }
                end,
            })
            vim.cmd.colorscheme('catppuccin')

            local c = require('catppuccin.palettes').get_palette('mocha')
            local rainbow = { c.red, c.peach, c.yellow, c.green, c.teal, c.blue }

            -- rainbow1-6: heading text groups link here, safe to set globally
            for i, color in ipairs(rainbow) do
                vim.api.nvim_set_hl(0, 'rainbow' .. i, { fg = color, bold = true })
            end

            -- delimiter groups are re-linked by the markdown syntax file on each buffer
            -- load, so we have to set them after via FileType autocmd
            vim.api.nvim_create_autocmd('FileType', {
                pattern = 'markdown',
                callback = function()
                    for i, color in ipairs(rainbow) do
                        vim.api.nvim_set_hl(0, 'markdownH' .. i .. 'Delimiter', { fg = color })
                    end
                    vim.api.nvim_set_hl(0, 'markdownBlockquoteLine', { fg = c.mauve, italic = true })
                    vim.fn.matchadd('markdownBlockquoteLine', '^>.*')
                    vim.api.nvim_set_hl(0, 'markdownBold',            { fg = c.red, bold = true })
                    vim.api.nvim_set_hl(0, 'markdownItalic',          { fg = c.red, italic = true })
                    vim.api.nvim_set_hl(0, 'markdownBoldItalic',      { fg = c.red, bold = true, italic = true })
                    vim.api.nvim_set_hl(0, 'markdownBoldDelimiter',   { fg = c.red })
                    vim.api.nvim_set_hl(0, 'markdownItalicDelimiter', { fg = c.red })
                end,
            })
        end,
    },
}
