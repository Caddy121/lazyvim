return {
  "jose-elias-alvarez/null-ls.nvim",
  event = "BufReadPre",
  dependencies = { "mason" },
  opts = function()
    local nls = require("null-ls")
    return {
      sources = {
        nls.builtins.formatting.stylua,
        nls.builtins.diagnostics.flake8,
        nls.builtins.formatting.prettier.with({
          extra_args = {
            "--print-width=100",
            "--single-quote=true",
            "--jsx-single-quote=true",
            "--bracket-same-line=true",
          },
          {
            filetypes = {
              "html",
              "json",
              "css",
              "javascript",
              "javascriptreact",
              "scss",
              "typescript",
              "typescriptreact",
              "astro",
            },
          },
        }),
      },
    }
  end,
}
