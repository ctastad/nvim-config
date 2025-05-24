-- Customize Mason

---@type LazySpec
return {
  -- use mason-lspconfig for automatic LSP setup
  {
    "williamboman/mason-lspconfig.nvim",
    opts = {
      ensure_installed = {
        "lua_ls",
        "pyright",
        "r_language_server",
        "bashls",
        "ts_ls",
        "html",
        "cssls",
        "emmet_ls",
        "yamlls", -- Keep YAML LSP
        "jsonls", -- Keep JSON LSP
        "taplo", -- Keep TOML LSP
      },
      automatic_installation = true,
    },
  },
  -- use mason-tool-installer for formatters and linters
  {
    "WhoIsSethDaniel/mason-tool-installer.nvim",
    opts = {
      ensure_installed = {
        -- Formatters
        "stylua", -- Lua formatter
        "shfmt", -- Bash formatter
        "prettier", -- JavaScript/HTML/CSS/YAML formatter
        "ruff", -- Python linter/formatter
        "taplo", -- TOML formatter

        -- Linters
        "yamllint", -- Keep YAML linter only
        "shellcheck", -- Bash linter
        "eslint_d", -- JavaScript linter

        -- Debuggers
        "debugpy", -- Python debugger

        -- Other tools
        "tree-sitter-cli",
        "selene", -- Lua linter
      },
      auto_update = false,
      run_on_start = true,
    },
  },
}
