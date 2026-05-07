local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not (vim.uv or vim.loop).fs_stat(lazypath) then
    local lazyrepo = "https://github.com/folke/lazy.nvim.git"
    local out = vim.fn.system({
        "git",
        "clone",
        "--filter=blob:none",
        "--branch=stable",
        lazyrepo,
        lazypath,
    })
    if vim.v.shell_error ~= 0 then
        vim.api.nvim_echo({
            { "Failed to clone lazy.nvim:\n", "ErrorMsg" },
            { out, "WarningMsg" },
            { "\nPress any key to exit..." },
        }, true, {})
        vim.fn.getchar()
        os.exit(1)
    end
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    spec = {
        -- add LazyVim and import its plugins
        { "LazyVim/LazyVim", import = "lazyvim.plugins" },
        -- import/override with your plugins
        { import = "plugins" },
        {
            "mfussenegger/nvim-lint",
            optional = true,
            opts = function(_, opts)
                local ignored_rules = {
                    MD004 = true,
                    MD013 = true,
                    MD025 = true,
                    MD032 = true,
                    MD034 = true,
                    MD041 = true,
                }
                local parser = require("lint.linters.markdownlint-cli2").parser

                opts.linters = opts.linters or {}
                opts.linters["markdownlint-cli2"] = {
                    parser = function(output, bufnr, linter_cwd)
                        return vim.tbl_filter(function(diagnostic)
                            local rule = diagnostic.message
                                and diagnostic.message:match("^(MD%d%d%d)")
                            return not ignored_rules[rule]
                        end, parser(output, bufnr, linter_cwd))
                    end,
                }
            end,
        },
        {
            "stevearc/conform.nvim",
            optional = true,
            opts = function(_, opts)
                opts.formatters_by_ft = opts.formatters_by_ft or {}
                for _, ft in ipairs({ "markdown", "markdown.mdx" }) do
                    opts.formatters_by_ft[ft] = vim.tbl_filter(function(formatter)
                        return formatter ~= "markdownlint-cli2"
                    end, opts.formatters_by_ft[ft] or {})
                end
            end,
        },
    },
    defaults = {
        -- By default, only LazyVim plugins will be lazy-loaded. Your custom plugins will load during startup.
        -- If you know what you're doing, you can set this to `true` to have all your custom plugins lazy-loaded by default.
        lazy = false,
        -- It's recommended to leave version=false for now, since a lot the plugin that support versioning,
        -- have outdated releases, which may break your Neovim install.
        version = false, -- always use the latest git commit
        -- version = "*", -- try installing the latest stable version for plugins that support semver
    },
    install = { colorscheme = { "tokyonight", "habamax" } },
    checker = {
        enabled = true, -- check for plugin updates periodically
        notify = false, -- notify on update
    }, -- automatically check for plugin updates
    performance = {
        rtp = {
            -- disable some rtp plugins
            disabled_plugins = {
                "gzip",
                -- "matchit",
                -- "matchparen",
                -- "netrwPlugin",
                "tarPlugin",
                "tohtml",
                "tutor",
                "zipPlugin",
            },
        },
    },
})
