-- if true then return {} end -- WARN: REMOVE THIS LINE TO ACTIVATE THIS FILE

-- Customize Treesitter

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  branch = "main",
  opts = {
    auto_install = true,
    ensure_installed = {
      "lua",
      "vim",
      "javascript",
      "typescript",
      "html",
      "css",
      "svelte",
      --   -- add more arguments for adding more treesitter parsers
    },
  },
}
