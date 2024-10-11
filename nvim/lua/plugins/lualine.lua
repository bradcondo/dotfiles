return {
  {
    "nvim-lualine/lualine.nvim", -- Adds configurable status line
    dependencies = { "nvim-navic" },
    opts = {
      options = {
        icons_enabled = false,
        theme = "onedark",
        component_separators = "|",
        section_separators = "",
      },
    },
    config = function()
      -- get lualine nightfly theme
      local lualine_nightfly = require("lualine.themes.nightfly")

      -- new colors for theme
      local new_colors = {
        blue = "#65D1FF",
        green = "#3EFFDC",
        violet = "#FF61EF",
        yellow = "#FFDA7B",
        black = "#000000",
        orange = "#FF9900",
      }

      -- change nightlfy theme colors
      lualine_nightfly.normal.a.bg = new_colors.blue
      lualine_nightfly.insert.a.bg = new_colors.orange
      lualine_nightfly.visual.a.bg = new_colors.violet
      lualine_nightfly.command = {
        a = {
          gui = "bold",
          bg = new_colors.yellow,
          fg = new_colors.black, -- black
        },
      }

      local navic = require("nvim-navic")

      -- configure lualine with modified theme
      require("lualine").setup({
        options = {
          theme = lualine_nightfly,
        },
        sections = {
          lualine_c = {
            {
              navic.get_location,
              cond = function()
                return navic.is_available()
              end,
            },
          },
        },
      })
    end,
  },
}
