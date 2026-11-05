return {
  {
    "catppuccin/nvim",
    name = "catppuccin",
    priority = 1000,
    opts = {
      flavour = "macchiato", -- Macchiato или Frappé дают отличный мятный оттенок (Teal/Green)
      transparent_background = false,
      term_colors = true,
      styles = {
        comments = { "italic" },
        conditionals = { "italic" },
        loops = {},
        functions = { "bold" },
        keywords = {},
        strings = {},
        variables = {},
        numbers = {},
        booleans = {},
        properties = {},
        types = {},
        operators = {},
      },
      -- Принудительно красим ключевые элементы интерфейса в мятный (Mint/Teal)
      custom_highlights = function(colors)
        return {
          CursorLineNr = { fg = colors.teal, style = { "bold" } }, -- Активный номер строки
          LineNr = { fg = colors.overlay1 }, -- Остальные номера строк
          Comment = { fg = colors.overlay2, style = { "italic" } }, -- Комментарии

          -- Настройка панелей под цвет темы
          NeoTreeNormal = { bg = colors.mantle },
          NeoTreeNormalNC = { bg = colors.mantle },
        }
      end,
    },
  },

  -- Активация
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
}
