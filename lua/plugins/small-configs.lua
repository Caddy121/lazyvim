return {
  {
    "echasnovski/mini.bufremove",
    -- stylua: ignore
    keys = {
      { "<leader>pl", function() require("mini.bufremove").delete(0, false) end, desc = "Delete Buffer" },
      -- { "<leader>bD", function() require("mini.bufremove").delete(0, true) end, desc = "Delete Buffer (Force)" },
    },
  },
  {
    "folke/noice.nvim",
    require("noice").setup({
      presets = {
        lsp_doc_border = true,
      },
    }),
  },
  {
    "tpope/vim-dadbod",
    -- opt = true,
    dependencies = {
      "kristijanhusak/vim-dadbod-ui",
      "kristijanhusak/vim-dadbod-completion",
    },
    config = function()
      require("config.dadbod").setup()
    end,
    cmd = { "DBUIToggle", "DBUI", "DBUIAddConnection", "DBUIFindBuffer", "DBUIRenameBuffer", "DBUILastQueryInfo" },
  },
  {
    "petertriho/nvim-scrollbar",
    event = "BufReadPost",
    config = function()
      local scrollbar = require("scrollbar")
      local colors = require("tokyonight.colors").setup()
      scrollbar.setup({
        handle = { color = colors.bg_highlight },
        excluded_filetypes = { "prompt", "TelescopePrompt", "noice", "notify", "neo-tree" },
        marks = {
          Search = { color = colors.orange },
          Error = { color = colors.error },
          Warn = { color = colors.warning },
          Info = { color = colors.info },
          Hint = { color = colors.hint },
          Misc = { color = colors.purple },
        },
      })
    end,
  },
  {
    "karb94/neoscroll.nvim",
    config = function()
      local neoscroll = require("neoscroll")
      neoscroll.setup({
        mappings = { "<C-u>", "<C-d>", "<C-b>", "<C-f>", "<C-y>", "<C-e>", "zt", "zz", "zb" },
        hide_cursor = true, -- Hide cursor while scrolling
        stop_eof = true, -- Stop at <EOF> when scrolling downwards
        use_local_scrolloff = false, -- Use the local scope of scrolloff instead of the global scope
        respect_scrolloff = true, -- Stop scrolling when the cursor reaches the scrolloff margin of the file
        cursor_scrolls_alone = false, -- The cursor will keep on scrolling even if the window cannot scroll further
      })
    end,
  },
  {
    "nvim-treesitter/nvim-treesitter",
    --   function(_, opts)
    --   if type(opts.ensure_installed) == "table" then
    --     vim.list_extend(opts.ensure_installed, { "typescript", "tsx" })
    --   end
    -- end,
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "cmake",
        "css",
        "diff",
        "gitignore",
        "graphql",
        "help",
        "html",
        "http",
        "javascript",
        "jsdoc",
        "jsonc",
        "lua",
        "markdown",
        "markdown_inline",
        "norg",
        "org",
        "python",
        "query",
        "regex",
        "scss",
        "sql",
        "svelte",
        "toml",
        "tsx",
        "typescript",
        "vim",
        "yaml",
        "json",
      },
    },
  },
  {
    "mg979/vim-visual-multi",
  },
  {
    "utilyre/barbecue.nvim",
    version = "*",
    dependencies = {
      "neovim/nvim-lspconfig",
      "SmiteshP/nvim-navic",
      "nvim-tree/nvim-web-devicons", -- optional dependency
    },
    opts = {
      show_modified = true,
      show_dirname = false,
      -- show_basename = false,
    },
  },
  {
    "HiPhish/nvim-ts-rainbow2",
    config = function()
      require("nvim-treesitter.configs").setup({
        rainbow = {
          enable = true,
          strategy = require("ts-rainbow.strategy.global"),
        },
      })
    end,
  },
  {
    "folke/lsp-colors.nvim",
    event = "BufRead",
  },
  {
    "andymass/vim-matchup",
    event = "BufReadPost",
    config = function()
      vim.g.matchup_matchparen_offscreen = { method = "status_manual" }
    end,
  },
  {
    "L3MON4D3/LuaSnip",
    config = function()
      require("luasnip.loaders.from_lua").load({ paths = "~/.config/nvim/snippets" })
      require("luasnip").filetype_extend("javascript", { "javascriptreact" })
      require("luasnip").filetype_extend("javascript", { "html" })
    end,
  },
  {
    "christoomey/vim-tmux-navigator",
  },
  {
    "roobert/tailwindcss-colorizer-cmp.nvim",
    -- optionally, override the default options:
    config = function()
      require("tailwindcss-colorizer-cmp").setup({
        color_square_width = 2,
      })
    end,
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
      -- local autopairs = require("nvim-autopairs")
      -- autopairs.setup({
      --   check_ts = true, -- enable treesitter
      -- })
      -- automatically add '()' when calling functions/methods
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
    end,
  },
  {
    "monaqa/dial.nvim",
    -- stylua: ignore
    keys = {
      { "<m-a>", function() return require("dial.map").inc_normal() end, expr = true, desc = "Increment" },
      { "<m-x>", function() return require("dial.map").dec_normal() end, expr = true, desc = "Decrement" },
    },
    config = function()
      local augend = require("dial.augend")
      require("dial.config").augends:register_group({
        default = {
          augend.integer.alias.decimal,
          augend.integer.alias.hex,
          augend.date.alias["%Y/%m/%d"],
          augend.constant.alias.bool,
          augend.semver.alias.semver,
        },
      })
    end,
  },
}
