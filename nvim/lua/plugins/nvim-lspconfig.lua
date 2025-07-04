-- LSP Support
return {
    -- LSP Configuration
    -- https://github.com/neovim/nvim-lspconfig
    'neovim/nvim-lspconfig',
    event = 'VeryLazy',
    dependencies = {
        -- LSP Management
        -- https://github.com/williamboman/mason.nvim
        { 'williamboman/mason.nvim' },
        -- https://github.com/williamboman/mason-lspconfig.nvim
        { 'williamboman/mason-lspconfig.nvim' },

        -- Auto-Install LSPs, linters, formatters, debuggers.
        -- https://github.com/WhoisSethDaniel/mason-tool-installer.nvim
        { 'WhoisSethDaniel/mason-tool-installer.nvim' },

        -- Useful status updates for LSP
        -- https://github.com/j-hui/fidget.nvim
        { 'j-hui/fidget.nvim',                        opts = {} },

        -- Additional lua configuration, makes nvim stuff amazing!
        -- https://github.com/folke/neodev.nvim
        { 'folke/neodev.nvim',                        opts = {} },
    },
    config = function()
        require('mason').setup()
        require('mason-lspconfig').setup({
            -- Install these LSPs automatically
            ensure_installed = {
                'bashls', -- requires npm to be installed
                -- 'cssls', -- requires npm to be installed
                -- 'html', -- requires npm to be installed
                'lua_ls',
                'jsonls', -- requires npm to be installed
                'lemminx',
                'marksman',
                'quick_lint_js',
                'pyright',
                'yamlls', -- requires npm to be installed
                'clangd',
            }
        })

        require('mason-tool-installer').setup({
            -- install these linters, formatters, debuggers automatically
            ensure_installed = {
                'black',
                'debugpy',
                'flake8',
                'isort',
                'mypy',
                'pylint',
                'clang-format'
            },
        })

        local lspconfig = require('lspconfig')
        local lsp_capabilities = require('cmp_nvim_lsp').default_capabilities()
        local lsp_attach = function(client, bufnr)
            -- Create your keybindings here...
        end

        -- Call setup on each LSP server
        require('mason-lspconfig').setup_handlers({
            function(server_name)
                lspconfig[server_name].setup({
                    on_attach = lsp_attach,
                    capabilities = lsp_capabilities,
                })
            end
        })

        -- Lua LSP settings
        lspconfig.lua_ls.setup {
            settings = {
                Lua = {
                    diagnostics = {
                        -- Get the language server to recognize the `vim` global
                        globals = { 'vim' },
                    },
                },
            },
        }

        -- lspconfig.clangd.setup {
        --     cmd = { "clangd" },
        --     filetypes = { "c", "cpp", "objc", "objcpp" },
        --     root_dir = lspconfig.util.root_pattern("compile_commands.json", "compile_flags.txt", ".git"),
        --     single_file_support = true
        -- }

        -- Globally configure all LSP floating preview popups (like hover, signature help, etc)
        local open_floating_preview = vim.lsp.util.open_floating_preview
        function vim.lsp.util.open_floating_preview(contents, syntax, opts, ...)
            opts = opts or {}
            opts.border = opts.border or "rounded" -- Set border to rounded
            return open_floating_preview(contents, syntax, opts, ...)
        end
    end
}
