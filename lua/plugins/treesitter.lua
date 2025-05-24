-- Customize Treesitter with workflow language support

---@type LazySpec
return {
  "nvim-treesitter/nvim-treesitter",
  opts = {
    ensure_installed = {
      -- Existing languages
      "lua",
      "vim",
      "python",
      "r",
      "bash",
      "javascript",
      "typescript",
      "html",
      "css",
      "json",
      "markdown",

      -- Workflow languages
      "yaml",
      "toml",
      "groovy", -- For Nextflow
      -- Note: No dedicated Snakemake parser, but Python works
    },
    highlight = {
      enable = true,
    },
    indent = {
      enable = true,
    },
  },
}
