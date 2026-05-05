return {
  "neo-tree.nvim",
  opts = {
    filesystem = {
      filtered_items = {
        visible = false,
        hide_dotfiles = false,
        hide_gitignored = true,
        hide_by_name = {
          ".github",
          ".gitignore",
          ".git",
          "package-lock.json",
          ".prettierrc.json",
        },
        never_show = { ".git" },
      },
    },
  },
}
