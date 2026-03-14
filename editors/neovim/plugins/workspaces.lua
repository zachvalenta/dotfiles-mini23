return {
    {
        'natecraddock/workspaces.nvim',
        config = function()
            require('workspaces').setup({
                -- store in config dir so it's version controlled with dotfiles
                path = vim.fn.stdpath('config') .. '/workspaces',
                hooks = {
                    -- telescope integration goes here once telescope is installed
                    -- open = { 'Telescope find_files' },
                },
            })
        end,
    },
}
