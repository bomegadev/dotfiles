return {
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end
  },
  {
    "williamboman/mason-lspconfig.nvim",
    config = function()
      require("mason-lspconfig").setup({
        ensure_installed = { "lua_ls", "intelephense" },
      })
    end
  },
  {
    "neovim/nvim-lspconfig",
    config = function()
      vim.diagnostic.config({ virtual_text = true })

      local capabilities = require("cmp_nvim_lsp").default_capabilities()
      local lspconfig = require("lspconfig")

      lspconfig.intelephense.setup({
        capabilities = capabilities,
        --[[ init_options = {
          licenceKey = "LICENCE KEY",
        }]]
      })
      lspconfig.lua_ls.setup({ capabilities = capabilities })
      lspconfig.clangd.setup({})
      lspconfig.cmake.setup({})

      vim.keymap.set("n", "K", vim.lsp.buf.hover, {})
      vim.keymap.set("n", "gd", vim.lsp.buf.definition, {})
      vim.keymap.set("n", "<leader>ca", vim.lsp.buf.code_action, {})
    end
  },

}
