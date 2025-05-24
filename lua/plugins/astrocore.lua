-- AstroCore provides a central place to modify mappings, vim options, autocommands, and more!

---@type LazySpec
return {
  "AstroNvim/astrocore",
  ---@type AstroCoreOpts
  opts = {
    features = {
      large_buf = { size = 1024 * 256, lines = 10000 },
      autopairs = true,
      cmp = true,
      diagnostics = { virtual_text = true, virtual_lines = false },
      highlighturl = true,
      notifications = true,
    },
    diagnostics = {
      virtual_text = true,
      underline = true,
    },
    filetypes = {
      extension = {
        smk = "snakemake",
        nf = "nextflow",
        config = "yaml",
      },
      filename = {
        ["Snakefile"] = "snakemake",
        ["nextflow.config"] = "yaml", -- Treat as YAML for linting
        ["main.nf"] = "nextflow",
      },
      pattern = {
        [".*%.smk"] = "snakemake",
        [".*%.nf"] = "nextflow",
      },
    },
    options = {
      opt = {
        relativenumber = true,
        number = true,
        spell = false,
        signcolumn = "yes",
        wrap = true,
        colorcolumn = "80",
      },
      g = {},
    },
    mappings = {
      n = {
        ["]b"] = { function() require("astrocore.buffer").nav(vim.v.count1) end, desc = "Next buffer" },
        ["[b"] = { function() require("astrocore.buffer").nav(-vim.v.count1) end, desc = "Previous buffer" },
        ["<Leader>bd"] = {
          function()
            require("astroui.status.heirline").buffer_picker(
              function(bufnr) require("astrocore.buffer").close(bufnr) end
            )
          end,
          desc = "Close buffer from tabline",
        },
        ["<Leader>lF"] = {
          function() vim.lsp.buf.format { async = false, timeout_ms = 3000 } end,
          desc = "Format buffer (manual)",
        },
      },
    },
    autocmds = {
      format_debug = {
        {
          event = "BufWritePre",
          desc = "Debug format on save",
          callback = function()
            -- Use the new API instead of deprecated one
            local clients = vim.lsp.get_clients { bufnr = 0 }
            local formatters = {}
            for _, client in ipairs(clients) do
              if client:supports_method "textDocument/formatting" then table.insert(formatters, client.name) end
            end
            if #formatters > 0 then
              print("Available formatters: " .. table.concat(formatters, ", "))
            else
              print "No formatters available for this buffer"
            end
          end,
        },
      },
    },
  },
}
