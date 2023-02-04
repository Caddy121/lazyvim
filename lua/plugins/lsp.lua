return {
  { "jose-elias-alvarez/typescript.nvim" },
  {
    "neovim/nvim-lspconfig",
    opts = {
      diagnostics = {
        virtual_text = false,
      },
      servers = {
        tsserver = {},
        pyright = {},
        cssls = {},
        html = {},
        tailwindcss = {},
        sumneko_lua = {},
        yamlls = {},
      },
      setup = {
        tsserver = function(_, opts)
          require("lazyvim.util").on_attach(function(client, buffer)
            if client.name == "tsserver" then
              -- stylua: ignore
              vim.keymap.set( "n", "<leader>co", "TypescriptOrganizeImports", { buffer = buffer, desc = "Organize Imports" })
              vim.keymap.set("n", "<leader>cR", "TypescriptRenameFile", { desc = "Rename File", buffer = buffer })
            end
          end)
          require("typescript").setup({ server = opts })
          return true
        end,
      },
    },
  },
}

--   config = function()
--     local lspconfig = require("lspconfig")
--     local cmp_nvim_lsp = require("cmp_nvim_lsp")
--     local capabilities = cmp_nvim_lsp.default_capabilities()
--
--     lspconfig["html"].setup({
--       capabilities = capabilities,
--     })
--
--     lspconfig["cssls"].setup({
--       capabilities = capabilities,
--     })
--
--     lspconfig["tsserver"].setup({
--       capabilities = capabilities,
--     })
--
--     lspconfig["tailwindcss"].setup({
--       capabilities = capabilities,
--     })
--
--     lspconfig["emmet_ls"].setup({
--       capabilities = capabilities,
--       filetypes = { "html", "typescriptreact", "javascriptreact", "css", "sass", "scss", "less", "svelte" },
--     })
--
--     lspconfig["sumneko_lua"].setup({
--       capabilities = capabilities,
--       settings = { -- custom settings for lua
--         Lua = {
--           -- make the language server recognize "vim" global
--           diagnostics = {
--             globals = { "vim" },
--           },
--           workspace = {
--             -- make language server aware of runtime files
--             library = {
--               [vim.fn.expand("$VIMRUNTIME/lua")] = true,
--               [vim.fn.stdpath("config") .. "/lua"] = true,
--             },
--           },
--         },
--       },
--     })
--   end,
-- },
--     {
--       "williamboman/mason.nvim",
--       -- require("mason").setup(),
--     },
--     {
--       "williamboman/mason-lspconfig.nvim",
--       require("mason-lspconfig").setup({
--         -- list of servers for mason to install
--         ensure_installed = {
--           "tsserver",
--           "html",
--           "cssls",
--           "tailwindcss",
--           "sumneko_lua",
--           "astro",
--         },
--         -- auto-install configured servers (with lspconfig)
--         automatic_installation = true, -- not the same as ensure_installed
--       }),
--     },
--   },
-- }
