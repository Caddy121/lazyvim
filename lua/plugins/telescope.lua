return {
  "nvim-telescope/telescope.nvim",
  opts = {
    pickers = {
      find_files = {
        theme = "dropdown",
      },
      oldfiles = {
        theme = "dropdown",
      },
      buffers = {
        theme = "dropdown",
        mappings = {
          i = {
            ["<c-d>"] = "delete_buffer",
          },
        },
      },
      git_files = {
        theme = "dropdown",
      },
      grep_string = {
        theme = "dropdown",
      },
      live_grep = {
        theme = "dropdown",
      },
      colorscheme = {
        theme = "dropdown",
      },
      lsp_references = {
        theme = "dropdown",
      },
      diagnostics = {
        theme = "dropdown",
      },
      lsp_implementations = {
        theme = "dropdown",
      },
      lsp_definitions = {
        theme = "dropdown",
      },
      treesitter = {
        theme = "dropdown",
      },
      git_commits = {
        theme = "dropdown",
      },
      git_bcommits = {
        theme = "dropdown",
      },
      git_branches = {
        theme = "dropdown",
      },
      git_status = {
        theme = "dropdown",
      },
      git_stash = {
        theme = "dropdown",
      },
    },
  },
}
