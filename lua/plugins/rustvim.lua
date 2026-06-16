return {
    'mrcjkb/rustaceanvim',
    -- To avoid being surprised by breaking changes,
    -- I recommend you set a version range
    version = '^9',
    -- This plugin implements proper lazy-loading (see :h lua-plugin-lazy).
    -- No need for lazy.nvim to lazy-load it.
    lazy = false,
    config = function()
        vim.g.rustaceanvim = {
            -- Plugin configuration
            tools = {
            },
            -- LSP configuration
            server = {
                on_attach = function(client, bufnr)
                    -- you can also put keymaps in here
                end,
                default_settings = {
                    -- rust-analyzer language server configuration
                    ['rust-analyzer'] = {
                        inlayHints = {
                            typeHints = {
                                enable = true
                            },
                            parameterHints = {
                                enable = true,
                            },
                            lifetimeElisionHints = {
                                enable = "always",
                            },
                        },
                        cargo = {
                            allFeatures = true,
                            buildScripts = {
                                enable = true,
                            },
                            procMacro = {
                                enable = true,
                            },
                        },
                        checkOnSave = {
                            enable = true,
                        },
                        check = {
                            allTargets = true,
                        },
                    },
                },
            },
            -- DAP configuration
            dap = {
            },
        }
    end
}
