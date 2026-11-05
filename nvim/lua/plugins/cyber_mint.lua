return {
  {
    "folke/tokyonight.nvim",
    lazy = false,
    priority = 1000,
    opts = {
      style = "storm",
      transparent = true, -- ВКЛЮЧАЕМ ПРОЗРАЧНОСТЬ ДЛЯ ВАШЕГО ФОНА
      styles = {
        sidebars = "transparent",
        floats = "transparent",
      },
      on_colors = function(colors)
        -- Переопределяем базовую палитру под чистый зеленый монохром
        colors.bg = "none"
        colors.bg_sidebar = "none"
        colors.bg_float = "none"

        -- Основной текст (светло-мятный, как вывод fastfetch)
        colors.fg = "#a0f0c0"
        colors.fg_sidebar = "#a0f0c0"

        -- Главный неоново-зеленый акцент
        colors.cyan = "#a0f0c0"
        colors.green = "#a0f0c0"
        colors.blue = "#a0f0c0"
        colors.purple = "#a0f0c0"
        colors.magenta = "#a0f0c0"

        -- Вспомогательные элементы (приглушенный зеленый, как шкалы в btop)
        colors.comment = "#3b634c"
        colors.dark3 = "#3b634c"
      end,
      on_highlights = function(hl, c)
        local bright_mint = "#a0f0c0"
        local dark_green = "#162b1f" -- Цвет для выделения строк
        local muted_green = "#3b634c" -- Для номеров строк и комментариев

        -- Полная принудительная очистка фона для всех панелей
        local transparent_groups = {
          "Normal",
          "NormalFloat",
          "NormalNC",
          "SignColumn",
          "NeoTreeNormal",
          "NeoTreeNormalNC",
          "NeoTreeWinSeparator",
          "LineNr",
          "CursorLineNr",
          "StatusLine",
          "StatusLineNC",
          "TelescopeNormal",
          "TelescopeBorder",
        }
        for _, group in ipairs(transparent_groups) do
          hl[group] = vim.tbl_extend("force", hl[group] or {}, { bg = "none" })
        end

        -- Настройка синтаксиса (строго в вашей палитре)
        hl.Keyword = { fg = bright_mint, bold = true }
        hl.Function = { fg = bright_mint, italic = true }
        hl.Type = { fg = bright_mint }
        hl.String = { fg = bright_mint }
        hl.Comment = { fg = muted_green, italic = true }
        hl.Constant = { fg = bright_mint }
        hl.Special = { fg = bright_mint }

        -- Интерфейс и навигация
        hl.CursorLine = { bg = dark_green } -- Строка под курсором
        hl.CursorLineNr = { fg = bright_mint, bold = true } -- Номер текущей строки
        hl.LineNr = { fg = muted_green } -- Неактивные номера строк
        hl.Visual = { bg = "#224230" } -- Выделенный текст

        -- Границы окон (тонкие зеленые линии, как в niri)
        hl.FloatBorder = { fg = bright_mint, bg = "none" }
        hl.VertSplit = { fg = muted_green, bg = "none" }
        hl.WinSeparator = { fg = muted_green, bg = "none" }

        -- Дерево файлов (Neo-tree)
        hl.NeoTreeDirectoryName = { fg = bright_mint, bold = true }
        hl.NeoTreeDirectoryIcon = { fg = bright_mint }
        hl.NeoTreeFileIcon = { fg = bright_mint }
        hl.NeoTreeRootName = { fg = bright_mint, bold = true }

        -- Окно автодополнения (Cmp)
        hl.CmpItemAbbrMatch = { fg = bright_mint, bold = true }
        hl.CmpItemKind = { fg = bright_mint }
      end,
    },
  },

  -- Установка темы по умолчанию
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "tokyonight",
    },
  },
}
