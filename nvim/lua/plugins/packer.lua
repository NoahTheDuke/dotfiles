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
  print "Installing packer, close and reopen Neovim..."
  require("packer").packadd = "packer.nvim"
end

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  error("packer not available")
end

local util = require('packer.util')

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return util.float { border = "rounded" }
    end,
  },
  compile_path = util.join_paths(vim.fn.stdpath('config'), 'plugin', '___packer_compiled.lua'),
}

return packer.startup(function(use)
  -- Have packer manage itself
  use "https://github.com/wbthomason/packer.nvim"
  -- lua support
  use "https://github.com/nvim-lua/plenary.nvim"

  -- bug fixes
  -- Pure security
  use "https://github.com/ypcrts/securemodelines"

  -- core functionality
  -- :BD, :BW
  use "https://github.com/qpkorr/vim-bufkill"

  -- :Rename
  use "https://github.com/ReekenX/vim-rename2"

  -- :WhichKey
  use "https://github.com/folke/which-key.nvim"

  -- visual/display
  use "https://github.com/nvim-lualine/lualine.nvim"

  -- Notifications Popup
  use "https://github.com/rcarriga/nvim-notify"

  -- :UndotreeToggle
  use "https://github.com/mbbill/undotree"

  -- :MinimapToggle
  use "https://github.com/wfxr/minimap.vim"

  -- :PreviewOpen
  use "https://github.com/previm/previm"

  -- Prettify wild menu
  use "https://github.com/gelguy/wilder.nvim"

  -- git stuff
  -- :Git [blah blah]
  use "https://github.com/tpope/vim-fugitive"

  -- Sets up gitlab settings
  use "https://github.com/shumphrey/fugitive-gitlab.vim"

  -- :GitBrowse
  use "https://github.com/tpope/vim-rhubarb"

  -- :NvimTreeToggle
  use "https://github.com/kyazdani42/nvim-tree.lua"

  -- :SessionManager
  use {
    "https://github.com/Shatur/neovim-session-manager",
    requires = { "nvim-lua/plenary.nvim" },
  }

  -- Splash screen
  use "https://github.com/goolord/alpha-nvim"

  -- :A, etc
  use "https://github.com/tpope/vim-projectionist"

  -- fancy icons
  use "https://github.com/ryanoasis/vim-devicons"

  use {
    "https://github.com/nvim-telescope/telescope.nvim",
    requires = {
      "https://github.com/fannheyward/telescope-coc.nvim",
    },
  }

  -- editing
  -- gS, gJ
  use "https://github.com/AndrewRadev/splitjoin.vim"

  -- gs: "abc" -> "abc -> :abc
  use "https://github.com/AndrewRadev/switch.vim"

  -- ysaw, ds[
  use "https://github.com/kylechui/nvim-surround"

  -- gcc
  use "https://github.com/terrortylor/nvim-comment"

  use "https://github.com/tpope/vim-repeat"

  -- [b, ]b, etc
  use "https://github.com/tpope/vim-unimpaired"

  -- matching and movement
  use "https://github.com/andymass/vim-matchup"
  use "https://github.com/wellle/targets.vim"

  -- sexpr editing
  use "https://github.com/guns/vim-sexp"

  use "https://github.com/tpope/vim-sexp-mappings-for-regular-people"

  use "https://github.com/Olical/conjure"
  use {
    "https://github.com/walterl/conjure-macroexpand",
    requires = { "Olical/conjure" },
  }
  use {
    "https://github.com/walterl/conjure-locstack",
    requires = { "Olical/conjure" },
  }

  -- universal editor settings
  use "https://github.com/editorconfig/editorconfig-vim"

  use "https://github.com/LintaoAmons/scratch.nvim.git"

  use {
    "https://github.com/neoclide/coc.nvim",
    branch = "release",
  }

  use {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
  }

  use {
    "https://github.com/nvim-treesitter/playground",
    requires = { "nvim-treesitter/nvim-treesitter" },
  }

  use {
    "https://github.com/nvim-treesitter/nvim-treesitter-context",
    requires = { "nvim-treesitter/nvim-treesitter" },
  }

  use {
    "https://github.com/glacambre/firenvim",
    run = function()
      vim.fn["firenvim#install"](0)
    end,
  }

  -- language plugins

  -- asciidoc
  use { "https://github.com/asciidoc/vim-asciidoc", ft = "asciidoc" }

  -- asm
  use { "https://github.com/samsaga2/vim-z80", ft = "asm" }

  -- clojure
  -- not set to ft so the files load in the correct order
  use {
    "https://github.com/clojure-vim/clojure.vim",
  }

  use {
    "https://github.com/bfontaine/zprint.vim",
    ft = "clojure",
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
  use { "https://github.com/catppuccin/nvim", as = "catppuccin" }
  use { "https://github.com/EdenEast/nightfox.nvim" }
  use { "https://github.com/Everblush/everblush.nvim", as = "everblush" }
  use { "https://github.com/folke/tokyonight.nvim" }
  use { "https://github.com/marko-cerovac/material.nvim" }
  use { "https://github.com/Mofiqul/dracula.nvim" }
  use { "https://github.com/navarasu/onedark.nvim" }
  use { "https://github.com/rebelot/kanagawa.nvim" }

  -- Must be final call
  if PACKER_BOOTSTRAP then
    packer.sync()
  end
end)
