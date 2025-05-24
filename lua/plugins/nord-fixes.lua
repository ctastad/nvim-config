-- AstroUI provides the basis for configuring the AstroNvim User Interface

---@type LazySpec
return {
  "AstroNvim/astroui",
  ---@type AstroUIOpts
  opts = {
    -- change colorscheme to nord (from AstroCommunity)
    colorscheme = "nord",
    -- Fix the black bar and other UI issues
    highlights = {
      init = { -- this table overrides highlights in all themes
        -- Fix any black backgrounds globally
        Normal = { bg = "#2E3440", fg = "#D8DEE9" },
        NormalNC = { bg = "#2E3440", fg = "#D8DEE9" },
      },
      nord = { -- nord theme specific overrides
        -- Fix the utility bar (tabline/winbar/statusline)
        TabLine = { bg = "#3B4252", fg = "#D8DEE9" },
        TabLineFill = { bg = "#2E3440" },
        TabLineSel = { bg = "#4C566A", fg = "#ECEFF4", bold = true },

        -- Fix winbar (breadcrumbs)
        WinBar = { bg = "#2E3440", fg = "#D8DEE9" },
        WinBarNC = { bg = "#2E3440", fg = "#4C566A" },

        -- Fix statusline
        StatusLine = { bg = "#3B4252", fg = "#D8DEE9" },
        StatusLineNC = { bg = "#2E3440", fg = "#4C566A" },

        -- Fix any remaining black backgrounds
        SignColumn = { bg = "#2E3440" },
        LineNr = { bg = "#2E3440", fg = "#4C566A" },
        CursorLineNr = { bg = "#2E3440", fg = "#D8DEE9" },

        -- Fix buffer tabs
        BufferCurrent = { bg = "#4C566A", fg = "#ECEFF4", bold = true },
        BufferCurrentIndex = { bg = "#4C566A", fg = "#ECEFF4" },
        BufferCurrentMod = { bg = "#4C566A", fg = "#EBCB8B" },
        BufferCurrentSign = { bg = "#4C566A", fg = "#88C0D0" },
        BufferCurrentTarget = { bg = "#4C566A", fg = "#BF616A" },

        BufferVisible = { bg = "#3B4252", fg = "#D8DEE9" },
        BufferVisibleIndex = { bg = "#3B4252", fg = "#D8DEE9" },
        BufferVisibleMod = { bg = "#3B4252", fg = "#EBCB8B" },
        BufferVisibleSign = { bg = "#3B4252", fg = "#88C0D0" },
        BufferVisibleTarget = { bg = "#3B4252", fg = "#BF616A" },

        BufferInactive = { bg = "#2E3440", fg = "#4C566A" },
        BufferInactiveIndex = { bg = "#2E3440", fg = "#4C566A" },
        BufferInactiveMod = { bg = "#2E3440", fg = "#D08770" },
        BufferInactiveSign = { bg = "#2E3440", fg = "#4C566A" },
        BufferInactiveTarget = { bg = "#2E3440", fg = "#BF616A" },

        -- Fix Heirline (AstroNvim's statusline components)
        HeirlineNormal = { bg = "#3B4252", fg = "#D8DEE9" },
        HeirlineInsert = { bg = "#A3BE8C", fg = "#2E3440" },
        HeirlineVisual = { bg = "#B48EAD", fg = "#2E3440" },
        HeirlineReplace = { bg = "#BF616A", fg = "#2E3440" },
        HeirlineCommand = { bg = "#EBCB8B", fg = "#2E3440" },
        HeirlineTerminal = { bg = "#8FBCBB", fg = "#2E3440" },

        -- Fix popup/float windows
        NormalFloat = { bg = "#3B4252", fg = "#D8DEE9" },
        FloatBorder = { bg = "#3B4252", fg = "#4C566A" },
        FloatTitle = { bg = "#3B4252", fg = "#88C0D0" },

        -- Fix Telescope
        TelescopeNormal = { bg = "#3B4252", fg = "#D8DEE9" },
        TelescopeBorder = { bg = "#3B4252", fg = "#4C566A" },
        TelescopePromptNormal = { bg = "#434C5E", fg = "#D8DEE9" },
        TelescopePromptBorder = { bg = "#434C5E", fg = "#4C566A" },
        TelescopeResultsNormal = { bg = "#3B4252", fg = "#D8DEE9" },
        TelescopeResultsBorder = { bg = "#3B4252", fg = "#4C566A" },
        TelescopePreviewNormal = { bg = "#2E3440", fg = "#D8DEE9" },
        TelescopePreviewBorder = { bg = "#2E3440", fg = "#4C566A" },

        -- Fix any other potential black bars
        VertSplit = { fg = "#4C566A" },
        WinSeparator = { fg = "#4C566A" },

        -- Fix menu/completion
        Pmenu = { bg = "#3B4252", fg = "#D8DEE9" },
        PmenuSel = { bg = "#4C566A", fg = "#ECEFF4" },
        PmenuSbar = { bg = "#434C5E" },
        PmenuThumb = { bg = "#4C566A" },

        -- Fix which-key
        WhichKey = { bg = "#3B4252", fg = "#D8DEE9" },
        WhichKeyFloat = { bg = "#3B4252" },

        -- Fix any remaining UI elements that might be black
        CursorLine = { bg = "#3B4252" },
        ColorColumn = { bg = "#3B4252" },
        Folded = { bg = "#3B4252", fg = "#4C566A" },
        FoldColumn = { bg = "#2E3440", fg = "#4C566A" },
      },
    },
    -- Icons can be configured throughout the interface
    icons = {
      -- configure the loading of the lsp in the status line
      LSPLoading1 = "⠋",
      LSPLoading2 = "⠙",
      LSPLoading3 = "⠹",
      LSPLoading4 = "⠸",
      LSPLoading5 = "⠼",
      LSPLoading6 = "⠴",
      LSPLoading7 = "⠦",
      LSPLoading8 = "⠧",
      LSPLoading9 = "⠇",
      LSPLoading10 = "⠏",
    },
  },
}
