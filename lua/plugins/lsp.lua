return {
  "neovim/nvim-lspconfig",
  dependencies = {
    "L3MON4D3/LuaSnip",
    "saadparwaiz1/cmp_luasnip",
    "rafamadriz/friendly-snippets",
    "stevearc/conform.nvim",
    "williamboman/mason.nvim",
    "williamboman/mason-lspconfig.nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/nvim-cmp",
    "hrsh7th/cmp-nvim-lsp-signature-help",
    { "antosha417/nvim-lsp-file-operations", config = true },
    "onsails/lspkind.nvim",
    "j-hui/fidget.nvim",
  },

  config = function()
    require("conform").setup({
      formatters_by_ft = {},
    })
    local cmp = require("cmp")
    local cmp_lsp = require("cmp_nvim_lsp")
    local capabilities =
      vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities(), cmp_lsp.default_capabilities())

    require("luasnip.loaders.from_vscode").lazy_load()
    require("fidget").setup({})
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "intelephense",
        "lua_ls",
        "tailwindcss",
        "cssls",
        "ts_ls",
        "sqlls",
        "html",
        "pylsp",
        "angularls",
      },
      handlers = {
        function(server_name) -- default handler (optional)
          require("lspconfig")[server_name].setup({
            capabilities = capabilities,
          })
        end,
        ["angularls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.angularls.setup({
            capabilities = capabilities,
          })
        end,
        ["ts_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.ts_ls.setup({
            capabilities = capabilities,
            cmd = { "typescript-language-server", "--stdio" },
            filetypes = {
              "javascript",
              "javascriptreact",
              "javascript.jsx",
              "typescript",
              "typescriptreact",
              "typescript.tsx",
            },
          })
        end,
        ["cssls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.cssls.setup({
            capabilities = capabilities,
          })
        end,
        ["tailwindcss"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.tailwindcss.setup({
            capabilities = capabilities,
          })
        end,
        ["html"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.html.setup({
            capabilities = capabilities,
          })
        end,
        ["lua_ls"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.lua_ls.setup({
            capabilities = capabilities,
            settings = {
              Lua = {
                runtime = { version = "Lua 5.1" },
                diagnostics = {
                  globals = { "bit", "vim", "it", "describe", "before_each", "after_each" },
                },
              },
            },
          })
        end,
        ["pylsp"] = function()
          local lspconfig = require("lspconfig")
          lspconfig.pylsp.setup({
            capabilities = capabilities,
            cmd = { "pylsp" },
            filetypes = {
              "python",
            },
            root_markers = { "pyproject.toml", "setup.py", "setup.cfg", "requirements.txt", "Pipfile", ".git" },
          })
        end,
      },
    })

    local luasnip = require("luasnip")
    cmp.setup({
      completion = {
        completeopt = "menu,menuone,noselect",
        keyword_length = 2,
      },
      snippet = {
        expand = function(args)
          luasnip.lsp_expand(args.body)
        end,
      },
      mapping = cmp.mapping.preset.insert({
        ["<C-k>"] = cmp.mapping.select_prev_item(), -- previous suggestion
        ["<C-j>"] = cmp.mapping.select_next_item(), -- next suggestion
        ["<C-b>"] = cmp.mapping.scroll_docs(-4),
        ["<C-f>"] = cmp.mapping.scroll_docs(4),
        ["<C-Space>"] = cmp.mapping.complete(), -- show completion suggestions
        ["<C-e>"] = cmp.mapping.abort(), -- close completion window
        ["<CR>"] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = "nvim_lsp" },
        { name = "luasnip" }, -- snippets
        { name = "buffer" }, -- text within current buffer
        { name = "path" }, -- file system paths
      }),
      formatting = {
        format = require("lspkind").cmp_format({
          mode = "symbol_text",
          menu = {
            { name = "nvim_lsp", keyword_length = 1 },
            { name = "luasnip", keyword_length = 2 },
            { name = "buffer", keyword_length = 2 },
            { name = "path" },
          },
        }),
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      view = {
        entries = {
          name = "custom",
          selection_order = "near_cursor",
        },
      },
    })

    vim.diagnostic.config({
      -- update_in_insert = true,
      float = {
        focusable = false,
        style = "minimal",
        border = "rounded",
        source = "if_many",
        header = "",
        prefix = "",
      },
    })
  end,
}
