return {
  { "LazyVim/LazyVim", opts = {
    colorscheme = "horizon",
  } },
  { "ellisonleao/gruvbox.nvim", enabled = true },
  { "Shatur/neovim-ayu", enabled = true },
  { "EdenEast/nightfox.nvim", enabled = true },
  { "catppuccin/nvim", name = "catppuccin", enabled = true },
  { "sainnhe/sonokai", enabled = true },
  { "lunarvim/horizon.nvim", enabled = true },
  {
    "rose-pine/neovim",
    name = "rose-pine",
    enabled = true,
    config = function()
      require("rose-pine").setup({
        dark_variant = "moon",
      })
    end,
  },
  { "rafamadriz/neon", enabled = true },
  { "marko-cerovac/material.nvim", enabled = true },
  { "bluz71/vim-nightfly-colors", enabled = true },
  { "sainnhe/edge", enabled = true },
  { "Mofiqul/dracula.nvim", enabled = true },
  { "projekt0n/github-nvim-theme", enabled = true },
  -- { "olimorris/onedarkpro", enabled = true },
  -- { "rebelot/kanagawa", enabled = true },
  { "cpea2506/one_monokai.nvim", enabled = true },
  { "bluz71/vim-nightfly-colors", name = "nightfly", lazy = true, priority = 1000 },
  {
    "uloco/bluloco.nvim",
    lazy = false,
    priority = 1000,
    dependencies = { "rktjmp/lush.nvim" },
    config = function()
      require("bluloco").setup({
        style = "dark", -- "auto" | "dark" | "light"
        transparent = false,
        italics = true,
        terminal = vim.fn.has("gui_running") == 1, -- bluoco colors are enabled in gui terminals per default.
        guicursor = true,
      })
    end,
  },
}
