return {
  {
    "kyazdani42/nvim-tree.lua", -- Tree File Explorer
    event = { "VimEnter", "BufEnter" },
    dependencies = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function(plugin)
      -- recommended settings from nvim-tree documentation
      vim.g.loaded_netrw = 1
      vim.g.loaded_netrwPlugin = 1

      -- change color for arrows in tree to light blue
      vim.cmd([[ highlight NvimTreeIndentMarker guifg=#3FC5FF ]])

      -- configure nvim-tree
      plugin.setup({
        -- change folder arrow icons
        renderer = {
          icons = {
            glyphs = {
              folder = {
                arrow_closed = "", -- arrow when folder is closed
                arrow_open = "", -- arrow when folder is open
              },
            },
          },
        },
        -- disable window_picker for
        -- explorer to work well with
        -- window splits
        actions = {
          open_file = {
            window_picker = {
              enable = false,
            },
          },
        },
        git = {
          ignore = true,
        },
      })

      -- open nvim-tree on setup
      local function open_nvim_tree(data)
        -- buffer is a [No Name]
        local no_name = data.file == "" and vim.bo[data.buf].buftype == ""

        -- buffer is a directory
        local directory = vim.fn.isdirectory(data.file) == 1

        if not no_name and not directory then
          return
        end

        -- change to the directory
        if directory then
          vim.cmd.cd(data.file)
        end

        -- open the tree
        plugin.tree.open()
      end

      vim.api.nvim_create_autocmd({ "VimEnter" }, { callback = open_nvim_tree })
    end,
  },
}
