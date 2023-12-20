return {
  {
    "NvChad/nvim-colorizer.lua",
    -- event = "VeryLazy",  -- https://github.com/NvChad/nvim-colorizer.lua/issues/57
    -- event = { "BufReadPost", "BufNewFile" },
    opts = {
      user_default_options = {
        css = true,
        mode = "background",
        tailwind = true,
        sass = { enable = true, parsers = { "css" } },
      },
    },
  },
}
