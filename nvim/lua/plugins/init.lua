local function setup(mod, remote)
  if remote == nil then
    -- If plugin does not need "require" setup, then just set it up.
    require(mod)
  else
    local status = pcall(require, remote)
    if not status then
      print(remote .. " is not downloaded.")
      return
    else
      local local_config = require(mod)
      if type(local_config) == "table" then
        local_config.setup()
      end
    end
  end
end

require("plugins.packer")

setup("plugins.alpha", "alpha")
setup("plugins.catppuccin", "catppuccin")
setup("plugins.clojure")
setup("plugins.coc-nvim")
setup("plugins.conjure")
setup("plugins.dracula", "dracula")
setup("plugins.editorconfig")
setup("plugins.everblush", "everblush")
setup("plugins.firenvim")
setup("plugins.lualine", "lualine")
setup("plugins.mind-nvim", "mind")
setup("plugins.minimap")
setup("plugins.notify", "notify")
setup("plugins.nvim-comment", "nvim_comment")
setup("plugins.nvim-surround", "nvim-surround")
setup("plugins.nvim-tree", "nvim-tree")
setup("plugins.nvim-treesitter", "nvim-treesitter")
setup("plugins.onedark", "onedark")
setup("plugins.previm")
setup("plugins.session-manager", "session_manager")
setup("plugins.splitjoin")
setup("plugins.switch")
setup("plugins.telescope", "telescope")
setup("plugins.tokyonight", "tokyonight")
setup("plugins.treesitter-context", "treesitter-context")
setup("plugins.vim-json")
setup("plugins.which-key", "which-key")
setup("plugins.wilder", "wilder")
setup("plugins.zprint")
