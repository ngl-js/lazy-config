return {
  "williamboman/mason.nvim",
  "williamboman/mason-lspconfig.nvim",
  "neovim/nvim-lspconfig",
  config = function()
    require("mason").setup()
    require("mason-lspconfig").setup({
      ensure_installed = {
        "lua_ls",
        "intelephense",
        "eslint",
        "sqlls",
        "html",
        "pyright",
      },
    })

    require("lspconfig").intelephense.setup({})
    require("lspconfig").eslint.setup({})
    require("lspconfig").html.setup({})
    require("lspconfig").sqlls.setup({})
  end,
}
