-- Load core nvim options
-- Mostly from: https://github.com/josean-dev/dev-environment-files
require("core.options")

-- Configure and load plugins via lazy
-- See: https://github.com/folke/lazy.nvim
require("lazy-plugins")

-- Configure colors/scheme
require("core.colors")

-- Configure keymaps
require("core.keymaps")
