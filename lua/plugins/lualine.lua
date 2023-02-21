return {
  {
    "nvim-lualine/lualine.nvim",
    event = "VeryLazy",
    -- opts = function(_, opts)
    --   -- dont show the winbar for some filetypes
    --   opts.options.disabled_filetypes.winbar = { "dashboard", "lazy", "alpha" }
    --   -- remove navic from the statusline
    --   local navic = table.remove(opts.sections.lualine_c)
    --   -- add it to the winbar instead
    --   opts.winbar = { lualine_b = { "filename" }, lualine_c = { navic } }
    -- end,

    opts = function(plugin)
      if plugin.override then
        require("lazyvim.util").deprecate("lualine.override", "lualine.opts")
      end

      local icons = require("lazyvim.config").icons

      local function fg(name)
        return function()
          ---@type {foreground?:number}?
          local hl = vim.api.nvim_get_hl_by_name(name, true)
          return hl and hl.foreground and { fg = string.format("#%06x", hl.foreground) }
        end
      end

      local function lsp_name(msg)
        msg = msg or "Inactive"
        local buf_clients = vim.lsp.buf_get_clients()
        if next(buf_clients) == nil then
          if type(msg) == "boolean" or #msg == 0 then
            return "Inactive"
          end
          return msg
        end
        local buf_client_names = {}

        for _, client in pairs(buf_clients) do
          if client.name ~= "null-ls" then
            table.insert(buf_client_names, client.name)
          end
        end

        return table.concat(buf_client_names, ", ")
      end

      return {
        options = {
          theme = "auto",
          globalstatus = true,
          component_separators = "┊", --        
          section_separators = { left = "", right = "" },
          disabled_filetypes = { statusline = { "dashboard", "lazy", "alpha" } },
        },
        sections = {
          -- lualine_a = { "mode" },
          -- lualine_b = { "branch" },
          lualine_a = {
            {
              "mode",
              icon = "󰩃 ",
              separator = { left = "", right = "" },
              padding = 0,
              fmt = function(res)
                return res:sub(1, 1)
              end,
            },
          },
          lualine_b = {
            { "branch", color = { gui = "italic" }, separator = { left = "", right = "" } },
          },
          lualine_c = {
            {
              "diff",
              symbols = {
                added = icons.git.added,
                modified = icons.git.modified,
                removed = icons.git.removed,
              },
            },
            { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
            {
              "filename",
              path = 1,
              shorting_target = 40,
              symbols = { modified = "  ", readonly = "", unnamed = "" },
            },
            -- stylua: ignore
            -- {
            --   function() return require("nvim-navic").get_location() end,
            --   cond = function() return package.loaded["nvim-navic"] and require("nvim-navic").is_available() end,
            -- },
          },
          lualine_x = {
            -- stylua: ignore
            -- {
            --   function() return require("noice").api.status.command.get() end,
            --   cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            --   color = fg("Statement")
            -- },
            -- stylua: ignore
            {
              function() return require("noice").api.status.mode.get() end,
              cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
              color = fg("Constant"),
            },
            { require("lazy.status").updates, cond = require("lazy.status").has_updates, color = fg("Special") },
            {
              "diagnostics",
              symbols = {
                error = icons.diagnostics.Error,
                warn = icons.diagnostics.Warn,
                info = icons.diagnostics.Info,
                hint = icons.diagnostics.Hint,
              },
            },
          },
          lualine_y = {
            {
              lsp_name,
              icon = "LSP:",
              color = { gui = "bold" },
            },
          },
          lualine_z = {
            { "location", separator = "", padding = { left = 1, right = 1 } },
            { "progress", separator = { left = "", right = "" }, padding = { left = 1, right = 1 } },
          },
        },
        extensions = { "nvim-tree" },
      }
    end,
  },
}
