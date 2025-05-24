-- AstroLSP configuration with workflow language support

---@type LazySpec
return {
  "AstroNvim/astrolsp",
  ---@type AstroLSPOpts
  opts = {
    features = {
      codelens = true,
      inlay_hints = false,
      semantic_tokens = true,
    },
    formatting = {
      format_on_save = {
        enabled = true,
        allow_filetypes = {
          "python",
          "r",
          "bash",
          "sh",
          "javascript",
          "typescript",
          "html",
          "css",
          "lua",
          -- Workflow languages
          "yaml",
          "json",
          "toml",
          "snakemake",
          "nextflow",
        },
        ignore_filetypes = {},
      },
      disabled = {
        "lua_ls", -- Use stylua via conform
        "ts_ls", -- Use prettier via conform
        "yamlls", -- Use prettier/yamlfix via conform
        "jsonls", -- Use prettier via conform
      },
      timeout_ms = 3000,
    },
    config = {
      -- Existing configs...
      pyright = {
        settings = {
          python = {
            analysis = {
              typeCheckingMode = "basic",
              autoSearchPaths = true,
              useLibraryCodeForTypes = true,
            },
          },
        },
      },
      r_language_server = {
        settings = {
          r = {
            lsp = {
              rich_documentation = false,
            },
          },
        },
      },
      bashls = {
        filetypes = { "sh", "bash", "zsh" },
      },
      ts_ls = {
        filetypes = { "javascript", "javascriptreact", "typescript", "typescriptreact" },
        settings = {
          typescript = {
            format = { enable = false },
          },
          javascript = {
            format = { enable = false },
          },
        },
      },
      html = {
        filetypes = { "html" },
      },
      cssls = {
        filetypes = { "css", "scss", "less" },
      },
      emmet_ls = {
        filetypes = { "html", "css", "javascript", "javascriptreact", "typescript", "typescriptreact" },
      },

      -- Workflow language configs
      yamlls = {
        settings = {
          yaml = {
            schemas = {
              -- Basic schemas - you can add more as needed
              ["https://json.schemastore.org/github-workflow.json"] = "/.github/workflows/*",
            },
            validate = true,
            completion = true,
            hover = true,
          },
        },
        filetypes = { "yaml", "yml" },
      },

      jsonls = {
        settings = {
          json = {
            validate = { enable = true },
            -- Schemas will be added by schemastore plugin
          },
        },
      },

      taplo = {
        filetypes = { "toml" },
        settings = {
          evenBetterToml = {
            schema = {
              enabled = true,
            },
          },
        },
      },
    },

    handlers = {},

    autocmds = {
      lsp_codelens_refresh = {
        cond = "textDocument/codeLens",
        {
          event = { "InsertLeave", "BufEnter" },
          desc = "Refresh codelens (buffer)",
          callback = function(args)
            if require("astrolsp").config.features.codelens then vim.lsp.codelens.refresh { bufnr = args.buf } end
          end,
        },
      },
    },

    mappings = {
      n = {
        gD = {
          function() vim.lsp.buf.declaration() end,
          desc = "Declaration of current symbol",
          cond = "textDocument/declaration",
        },
        ["<Leader>uY"] = {
          function() require("astrolsp.toggles").buffer_semantic_tokens() end,
          desc = "Toggle LSP semantic highlight (buffer)",
          cond = function(client)
            return client:supports_method "textDocument/semanticTokens/full" and vim.lsp.semantic_tokens ~= nil
          end,
        },
        ["<Leader>lf"] = {
          function() vim.lsp.buf.format() end,
          desc = "Format buffer",
        },
      },
    },

    on_attach = function(client, bufnr)
      -- Disable formatting for certain servers to avoid conflicts
      if client.name == "ts_ls" or client.name == "yamlls" or client.name == "jsonls" then
        client.server_capabilities.documentFormattingProvider = false
        client.server_capabilities.documentRangeFormattingProvider = false
      end
    end,
  },
}
