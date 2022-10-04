-- Automatically install packer
local install_path = vim.fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
---@diagnostic disable-next-line: missing-parameter
if vim.fn.empty(vim.fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = vim.fn.system {
    "git",
    "clone",
    "--depth",
    "1",
    "https://github.com/wbthomason/packer.nvim",
    install_path,
  }
  print "Installing packer close and reopen Neovim..."
  vim.cmd [[packadd packer.nvim]]
end

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Utility settings loader
local setup = function(mod, remote)
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

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float { border = "rounded" }
    end,
  },
}

return packer.startup(function(use)
  -- Have packer manage itself
  use "https://github.com/wbthomason/packer.nvim"
  -- lua support
  use "https://github.com/nvim-lua/plenary.nvim"

  -- bug fixes
  use "https://github.com/ypcrts/securemodelines" -- Pure security

  -- core functionality
  use "https://github.com/qpkorr/vim-bufkill" -- :BD, :BW
  use "https://github.com/ReekenX/vim-rename2" -- :Rename
  use {
    "https://github.com/folke/which-key.nvim",
    config = setup("plugins.which-key", "which-key")
  } -- :WhichKey

  -- visual/display
  use {
    "https://github.com/nvim-lualine/lualine.nvim",
    config = setup("plugins.lualine", "lualine"),
  }

  use {
    "https://github.com/rcarriga/nvim-notify",
    config = setup("plugins.notify", "notify"),
  }   -- Notifications Popup

  use {
    "https://github.com/stevearc/dressing.nvim",
    config = setup("plugins.dressing", "dressing")
  } -- Improved UI

  -- use {
  --   "Dax89/ide.nvim",
  --   requires = {
  --     {"nvim-lua/plenary.nvim"},
  --     {"rcarriga/nvim-notify"},   -- Notifications Popup
  --     {"stevearc/dressing.nvim"}, -- Improved UI
  --     {"mfussenegger/nvim-dap"} , -- DAP Support
  --     {"rcarriga/nvim-dap-ui"},   -- DAP-UI Support
  --   },
  --   config = setup("plugins.ide-nvim", "ide")
  -- }

  use { "https://github.com/mbbill/undotree" } -- :UndotreeToggle

  use {
    "https://github.com/wfxr/minimap.vim",
    config = setup("plugins/minimap")
  } -- :MinimapToggle

  use {
    "https://github.com/previm/previm",
    ft = "md",
    config = setup("plugins.previm")
  } -- :PreviewOpen

  use {
    "https://github.com/phaazon/mind.nvim",
    branch = "v2.2",
    requires = { "nvim-lua/plenary.nvim" },
    config = setup("plugins.mind-nvim", "mind")
  }

  use {
    "https://github.com/gelguy/wilder.nvim",
    config = setup("plugins.wilder", "wilder")
  }

  -- git stuff
  use "https://github.com/tpope/vim-fugitive" -- :Git [blah blah]
  use "https://github.com/shumphrey/fugitive-gitlab.vim" -- Sets up gitlab settings
  use "https://github.com/tpope/vim-rhubarb" -- :GitBrowse

  -- movement/directory
  -- use "https://github.com/lambdalisue/fern.vim" -- :Fern . -drawer -toggle
  use {
    "https://github.com/kyazdani42/nvim-tree.lua",
    config = setup("plugins.nvim-tree", "nvim-tree")
  }

  use "https://github.com/tpope/vim-projectionist" -- :A, etc

  use "https://github.com/ryanoasis/vim-devicons"
  use {
    "https://github.com/nvim-telescope/telescope.nvim",
    requires = {
      "https://github.com/fannheyward/telescope-coc.nvim",
    },
    config = setup("plugins.telescope", "telescope")
  }

  -- editing
  use {
    "https://github.com/AndrewRadev/splitjoin.vim",
    config = setup("plugins.splitjoin")
  } -- gS, gJ

  use {
    "https://github.com/AndrewRadev/switch.vim",
    config = setup("plugins.switch")
  } -- gs: "abc" -> "abc -> :abc

  use {
    "https://github.com/kylechui/nvim-surround",
    config = setup("plugins.nvim-surround", "nvim-surround")
  }

  use {
    "https://github.com/terrortylor/nvim-comment",
    config = setup("plugins.nvim-comment", "nvim_comment")
  } -- gcc

  use "https://github.com/tpope/vim-repeat"
  use "https://github.com/tpope/vim-unimpaired" -- [b, ]b, etc

  -- matching and movement
  use "https://github.com/andymass/vim-matchup"
  use "https://github.com/wellle/targets.vim"

  -- sexpr editing
  use {
    "https://github.com/guns/vim-sexp",
    setup = function()
      -- The autocmd doesn't work if I run this in config so I gotta hardcode the whole list
      vim.g.sexp_filetypes = "clojure,scheme,lisp,timl,fennel"
    end,
  }
  use "https://github.com/tpope/vim-sexp-mappings-for-regular-people"

  use {
    "https://github.com/Olical/conjure",
    config = setup("plugins.conjure"),
  }
  use "https://github.com/walterl/conjure-macroexpand"

  -- universal editor settings
  use {
    "https://github.com/editorconfig/editorconfig-vim",
    config = setup("plugins.editorconfig"),
  }
  use {
    "https://github.com/neoclide/coc.nvim",
    branch = "release",
    config = setup("plugins.coc-nvim")
  }

  use {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = setup("plugins/nvim-treesitter", "nvim-treesitter")
  }

  use {
    "https://github.com/nvim-treesitter/playground",
    requires = { "nvim-treesitter/nvim-treesitter" },
  }

  use {
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    requires = { "nvim-treesitter/nvim-treesitter" },
    confg = setup("plugins.treesitter-context", "treesitter-context"),
  }

  -- use {
  --   "https://github.com/glacambre/firenvim",
  --   run = function()
  --     vim.fn["firenvim#install"](0)
  --   end,
  --   config = setup("plugins/firenvim"),
  -- }

  -- language plugins

  -- asciidoc
  use { "https://github.com/asciidoc/vim-asciidoc", ft = "asciidoc" }

  -- asm
  use { "https://github.com/samsaga2/vim-z80", ft = "asm" }

  -- clojure
  -- not set to ft so the files load in the correct order
  use {
    "https://github.com/clojure-vim/clojure.vim",
    config = setup("plugins/clojure"),
  }

  use {
    "https://github.com/bfontaine/zprint.vim",
    ft = "clojure",
    setup = setup("plugins/zprint"),
  }

  -- common lisp
  use { "https://github.com/vlime/vlime", rtp = "vim/", ft = "lisp" }

  -- docker-compose
  use { "https://github.com/ekalinin/Dockerfile.vim", ft = "dockerfile" }

  -- fennel
  use { "https://github.com/jaawerth/fennel.vim", ft = "fennel" }

  -- git
  use { "https://github.com/tpope/vim-git" }

  -- html5
  use { "https://github.com/othree/html5.vim", ft = "html" }

  -- javascript
  use { "https://github.com/pangloss/vim-javascript", ft = { "javascript" } }

  -- json5
  use { "https://github.com/GutenYe/json5.vim", ft = "json5" }

  -- json
  use {
    "https://github.com/elzr/vim-json",
    ft = "json",
    config = setup("plugins/vim-json"),
  }

  -- jsonc
  use { "https://github.com/neoclide/jsonc.vim", ft = "jsonc" }

  -- justfiles
  use { "https://github.com/NoahTheDuke/vim-just", ft = "just" }

  -- lua
  use { "https://github.com/euclidianAce/BetterLua.vim", ft = "lua" }

  -- markdown
  use { "https://github.com/plasticboy/vim-markdown", ft = "markdown" }

  -- python
  use { "https://github.com/psf/black", ft = "python" }
  use { "https://github.com/raimon49/requirements.txt.vim", ft = "requirements" }

  -- racket
  use { "https://github.com/wlangstroth/vim-racket", ft = "racket" }

  -- rst
  use { "https://github.com/marshallward/vim-restructuredtext" }

  -- ruby/rails
  use { "https://github.com/vim-ruby/vim-ruby", ft = "ruby" }
  use { "https://github.com/tpope/vim-rails", ft = "ruby" }

  -- rust
  use { "https://github.com/rust-lang/rust.vim", ft = "rust" }

  -- sh/bash/etc
  use { "https://github.com/arzg/vim-sh" }

  -- stylus
  use { "https://github.com/wavded/vim-stylus", ft = "stylus" }

  -- toml
  use { "https://github.com/cespare/vim-toml", ft = "toml" }

  -- twig
  use { "https://github.com/lumiliet/vim-twig", ft = "twig" }

  -- typescript
  use { "https://github.com/HerringtonDarkholme/yats.vim", ft = "typescript" }

  -- vue
  use { "https://github.com/leafOfTree/vim-vue-plugin", ft = "vue" }

  -- xml
  use { "https://github.com/amadeus/vim-xml", ft = "xml" }

  -- zig
  use { "https://github.com/ziglang/zig.vim", ft = "zig" }

  -- colors
  use "https://github.com/Mofiqul/dracula.nvim"
  use "rebelot/kanagawa.nvim"

  -- Must be final call
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
