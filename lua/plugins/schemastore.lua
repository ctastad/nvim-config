-- Add JSON schema support for better validation
---@type LazySpec
return {
  "b0o/schemastore.nvim",
  lazy = true,
  ft = { "json", "jsonc" },
  config = function()
    -- This will be used by jsonls when it loads
    require("lspconfig").jsonls.setup {
      settings = {
        json = {
          schemas = require("schemastore").json.schemas(),
          validate = { enable = true },
        },
      },
    }
  end,
}
