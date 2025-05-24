-- Simple linting setup - YAML only for workflow files
---@type LazySpec
return {
  "mfussenegger/nvim-lint",
  event = { "BufReadPre", "BufNewFile" },
  config = function()
    local lint = require "lint"

    lint.linters_by_ft = {
      python = { "ruff" },
      javascript = { "eslint_d" },
      javascriptreact = { "eslint_d" },
      typescript = { "eslint_d" },
      typescriptreact = { "eslint_d" },
      sh = { "shellcheck" },
      bash = { "shellcheck" },
      yaml = { "yamllint" }, -- Keep YAML linting
      yml = { "yamllint" },
      -- No snakemake or nextflow linting
    }

    -- Configure yamllint
    lint.linters.yamllint.args = {
      "--format",
      "parsable",
      "--config-data",
      "{extends: default, rules: {line-length: {max: 120}, indentation: {spaces: 2}}}",
      "-",
    }

    -- Auto-lint
    local lint_augroup = vim.api.nvim_create_augroup("lint", { clear = true })
    vim.api.nvim_create_autocmd({ "BufEnter", "BufWritePost", "InsertLeave" }, {
      group = lint_augroup,
      callback = function()
        if not vim.g.disable_linting then lint.try_lint() end
      end,
    })

    vim.api.nvim_create_user_command("LintToggle", function()
      if vim.g.disable_linting then
        vim.g.disable_linting = false
        print "✅ Linting enabled"
        lint.try_lint()
      else
        vim.g.disable_linting = true
        print "❌ Linting disabled"
        vim.diagnostic.reset()
      end
    end, { desc = "Toggle linting" })
  end,
}
