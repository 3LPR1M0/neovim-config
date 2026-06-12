return {
    "neovim/nvim-lspconfig",
    dependencies = {
        "stevearc/conform.nvim",
        "williamboman/mason.nvim",
        "williamboman/mason-lspconfig.nvim",
        "hrsh7th/cmp-nvim-lsp",
        "hrsh7th/cmp-buffer",
        "hrsh7th/cmp-path",
        "hrsh7th/nvim-cmp",
        "L3MON4D3/LuaSnip",
        "saadparwaiz1/cmp_luasnip",
        "j-hui/fidget.nvim",
    },

    config = function()
        -- Formatting on save per language
        require("conform").setup({
            format_on_save = {
                timeout_ms = 500,
                lsp_fallback = true,
            },
            formatters_by_ft = {
                lua    = { "stylua" },
                python = { "black" },
                cpp    = { "clang_format" },
                c      = { "clang_format" },
            },
        })

        local cmp = require("cmp")
        local cmp_lsp = require("cmp_nvim_lsp")
        local capabilities = vim.tbl_deep_extend(
            "force",
            {},
            vim.lsp.protocol.make_client_capabilities(),
            cmp_lsp.default_capabilities()
        )

        -- Keymaps that activate when an LSP attaches to a buffer
        vim.api.nvim_create_autocmd("LspAttach", {
            callback = function(event)
                local opts = { buffer = event.buf }
                vim.keymap.set("n", "gd",          vim.lsp.buf.definition,      opts)  -- go to definition
                vim.keymap.set("n", "K",            vim.lsp.buf.hover,           opts)  -- hover docs
                vim.keymap.set("n", "<leader>rn",   vim.lsp.buf.rename,          opts)  -- rename symbol
                vim.keymap.set("n", "<leader>ca",   vim.lsp.buf.code_action,     opts)  -- code actions
                vim.keymap.set("n", "gr",           vim.lsp.buf.references,      opts)  -- find references
                vim.keymap.set("n", "[d",           vim.diagnostic.goto_prev,    opts)  -- prev diagnostic
                vim.keymap.set("n", "]d",           vim.diagnostic.goto_next,    opts)  -- next diagnostic
                vim.keymap.set("n", "<leader>e",    vim.diagnostic.open_float,   opts)  -- show diagnostic float
            end,
        })

        require("fidget").setup({})
        require("mason").setup()
        require("mason-lspconfig").setup({
            ensure_installed = {

            },
            handlers = {
                -- Fallback for anything not explicitly handled below
                function(server_name)
                    require("lspconfig")[server_name].setup {
                        capabilities = capabilities
                    }
                end,

                ["lua_ls"] = function()
                    require("lspconfig").lua_ls.setup {
                        capabilities = capabilities,
                        settings = {
                            Lua = {
                                runtime = { version = "LuaJIT" },
                                diagnostics = { globals = { "vim" } },
                                workspace = {
                                    library = vim.api.nvim_get_runtime_file("", true),
                                    checkThirdParty = false,
                                },
                                format = {
                                    enable = true,
                                    defaultConfig = {
                                        indent_style = "space",
                                        indent_size  = "2",
                                    },
                                },
                            },
                        },
                    }
                end,

                ["pyright"] = function()
                    require("lspconfig").pyright.setup {
                        capabilities = capabilities,
                        settings = {
                            python = {
                                analysis = {
                                    typeCheckingMode    = "basic",  -- "off" | "basic" | "strict"
                                    autoImportCompletions = true,
                                },
                            },
                        },
                    }
                end,

                ["clangd"] = function()
                    require("lspconfig").clangd.setup {
                        capabilities = capabilities,
                        cmd = {
                            "clangd",
                            "--background-index",   -- indexes your project in the background
                            "--clang-tidy",         -- enables linting on top of LSP
                            "--completion-style=detailed",
                        },
                    }
                end,
            },
        })

        cmp.setup({
            snippet = {
                expand = function(args)
                    require("luasnip").lsp_expand(args.body)
                end,
            },
            mapping = cmp.mapping.preset.insert({
                ["<C-p>"]     = cmp.mapping.select_prev_item(),
                ["<C-n>"]     = cmp.mapping.select_next_item(),
                ["<C-y>"]     = cmp.mapping.confirm({ select = true }),
                ["<C-Space>"] = cmp.mapping.complete(),
                ["<C-e>"]     = cmp.mapping.abort(),
            }),
            sources = cmp.config.sources({
                { name = "nvim_lsp" },  -- LSP completions
                { name = "luasnip" },   -- snippet completions
                { name = "path" },      -- file path completions
            }, {
                { name = "buffer" },    -- completions from current buffer (lower priority)
            }),
        })

        vim.diagnostic.config({
            virtual_text  = true,   -- show errors inline next to code
            signs         = true,
            underline     = true,
            update_in_insert = false,
            float = {
                focusable = false,
                style     = "minimal",
                border    = "rounded",
                source    = "always",
                header    = "",
                prefix    = "",
            },
        })
    end,
}
