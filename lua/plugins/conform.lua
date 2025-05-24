-- Use conform.nvim for reliable formatting
---@type LazySpec
return {
  "stevearc/conform.nvim",
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  opts = {
    formatters_by_ft = {
      -- Core languages
      python = { "ruff_format", "ruff_organize_imports" },
      lua = { "stylua" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      html = { "prettier" },
      css = { "prettier" },
      scss = { "prettier" },
      sh = { "shfmt" },
      bash = { "shfmt" },
      json = { "prettier" },
      yaml = { "prettier" },
      yml = { "prettier" },
      toml = { "taplo" },

      -- Workflow languages - no formatting
      -- snakemake = {},  -- No auto-formatting
      -- nextflow = {},   -- No auto-formatting
    },
    format_on_save = {
      timeout_ms = 3000,
      lsp_fallback = true,
    },
    formatters = {
      ruff_format = {
        args = { "format", "--stdin-filename", "$FILENAME", "-" },
      },
      ruff_organize_imports = {
        args = { "check", "--select", "I", "--fix", "--stdin-filename", "$FILENAME", "-" },
      },
      shfmt = {
        prepend_args = { "-i", "2", "-ci" },
      },
      prettier = {
        prepend_args = { "--tab-width=2", "--single-quote=false" },
      },
      stylua = {
        prepend_args = { "--indent-type=Spaces", "--indent-width=2" },
      },
      taplo = {
        args = { "format", "-" },
      },
    },
  },
  config = function(_, opts)
    require("conform").setup(opts)

    vim.api.nvim_create_user_command("FormatInfo", function()
      local conform = require "conform"
      local formatters = conform.list_formatters(0)
      if #formatters == 0 then
        print("No formatters available for filetype: " .. vim.bo.filetype)
      else
        print("Available formatters for " .. vim.bo.filetype .. ":")
        for _, formatter in ipairs(formatters) do
          local status = formatter.available and "✅ available" or "❌ not available"
          print("  - " .. formatter.name .. " (" .. status .. ")")
        end
      end
    end, { desc = "Show available formatters for current buffer" })

    vim.api.nvim_create_user_command("FormatToggle", function()
      if vim.g.disable_autoformat then
        vim.g.disable_autoformat = false
        print "✅ Auto-formatting enabled"
      else
        vim.g.disable_autoformat = true
        print "❌ Auto-formatting disabled"
      end
    end, { desc = "Toggle auto-formatting" })
  end,
}
