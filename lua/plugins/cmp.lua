return {
  {
    "hrsh7th/nvim-cmp",
    lazy = false,
    priority = 100,
    dependencies = {
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-buffer",
      "hrsh7th/cmp-path",
      "hrsh7th/cmp-nvim-lsp",
      "hrsh7th/cmp-nvim-lsp-signature-help",
      "onsails/lspkind.nvim",
      "ray-x/cmp-treesitter",
      "L3MON4D3/LuaSnip",
    },
    event = "InsertEnter",
    config = function()
      local cmp = require("cmp")
      local luasnip = require("luasnip")
      cmp.setup({
        completion = {
          autocomplete = {
            "InsertEnter",
          },
          completeopt = "menu,menuone,noselect",
          keyword_length = 3,
        },
        snippet = {
          expand = function(args)
            luasnip.lsp_expand(args.body)
          end,
        },
        formatting = {
          format = require("lspkind").cmp_format({
            mode = "symbol_text",
            menu = {
              { name = "path" },
              { name = "nvim_lsp", keyword_length = 1 },
              { name = "buffer", keyword_length = 3 },
              { name = "luasnip", keyword_length = 2 },
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
    end,
  },
}
