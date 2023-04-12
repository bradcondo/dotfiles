return {
  {
    "dstein64/vim-startuptime", -- Adds performance profiler to startup
    cmd = "StartupTime",
    init = function()
      vim.g.startuptime_tries = 10
    end,
  },
}
