local fn = vim.fn

-- disable filetype.vim, load filetype.lua instead
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

-- Automatically install packer
local install_path = fn.stdpath "data" .. "/site/pack/packer/start/packer.nvim"
if fn.empty(fn.glob(install_path)) > 0 then
  PACKER_BOOTSTRAP = fn.system {
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

-- Autocommand that reloads neovim whenever you save the plugins.lua file
local puc_id = vim.api.nvim_create_augroup("packer_user_config", {})
vim.api.nvim_create_autocmd({"BufWritePost"}, {
  group = puc_id,
  pattern = "plugins.lua",
  command = "source <afile> | PackerSync",
})

-- Use a protected call so we don"t error out on first use
local status_ok, packer = pcall(require, "packer")
if not status_ok then
  return
end

-- Have packer use a popup window
packer.init {
  display = {
    open_fn = function()
      return require("packer.util").float {border = "rounded"}
    end,
  },
}

return packer.startup(function(use)
  -- Have packer manage itself
  use "https://github.com/wbthomason/packer.nvim"
  -- lua support
  use "https://github.com/nvim-lua/plenary.nvim"

  -- core functionality
  use "https://github.com/qpkorr/vim-bufkill" -- :BD, :BW
  use "https://github.com/ReekenX/vim-rename2" -- :Rename
  use "https://github.com/ypcrts/securemodelines" -- Pure security

  -- visual/display
  -- use { 'feline-nvim/feline.nvim',
  --   config = function()
  --     require('conf/feline')
  --   end
  -- }
  -- use { 'kdheepak/tabline.nvim',
  --   config = function()
  --     require('conf/tabline')
  --   end,
  --   requires = { {'kyazdani42/nvim-web-devicons', opt = true} }
  -- }
  use {
    "https://github.com/vim-airline/vim-airline",
    config = function()
      vim.g["airline#extensions#ale#enabled"] = 1
      vim.g["airline#extensions#coc#enabled"] = 1
      vim.g["airline#extensions#tabline#enabled"] = 1
      vim.g["airline#extensions#tabline#formatter"] = 'default'
      vim.g["airline#extensions#whitespace#mixed_indent_algo"] = 1
      vim.g["airline_highlighting_cache"] = 1
    end
  }
  use "https://github.com/vim-airline/vim-airline-themes"

  use {"https://github.com/mbbill/undotree"} -- :UndotreeToggle

  use {
    "https://github.com/wfxr/minimap.vim",
    config = function()
      vim.g["minimap_highlight_range"] = 1
      vim.g["minimap_width"] = 10
      vim.g["minimap_git_colors"] = 1
    end
  } -- :MinimapToggle
  use {
    "https://github.com/previm/previm",
    ft = "md",
    config = function()
      vim.g["previm_open_cmd"] = "open -a Firefox"
    end
  } -- :PreviewOpen

  -- git stuff
  use "https://github.com/tpope/vim-fugitive" -- :Git [blah blah]
  use "https://github.com/shumphrey/fugitive-gitlab.vim" -- Sets up gitlab settings
  use "https://github.com/tpope/vim-rhubarb" -- :GitBrowse

  -- movement/directory
  use "https://github.com/lambdalisue/fern.vim" -- :Fern . -drawer -toggle

  use {
    "https://github.com/ctrlpvim/ctrlp.vim",
    config = function()
      vim.cmd [[
      let g:ctrlp_custom_ignore = {
        \ 'dir':  '/target/',
        \ }
        let g:ctrlp_max_files = 0
        let g:ctrlp_max_depth = 1000
        " from: https://bluz71.github.io/2017/10/26/turbocharge-the-ctrlp-vim-plugin.html
        let g:ctrlp_user_command = 'fd --type f --color=never "" %s'
        let g:ctrlp_use_caching = 0
        let g:ctrlp_show_hidden = 1
        ]]
      end
    } -- <C-p>

    use "https://github.com/jremmen/vim-ripgrep" -- :Rg
    use "https://github.com/tpope/vim-projectionist"
    use "https://github.com/nvim-telescope/telescope.nvim"
    use "https://github.com/nvim-telescope/telescope-media-files.nvim"

    -- editing
    use {
      "https://github.com/AndrewRadev/splitjoin.vim",
      config = function()
        vim.cmd [[
        let g:splitjoin_trailing_comma = 1
        ]]
      end
    } -- gS, gJ

    use {
      "https://github.com/AndrewRadev/switch.vim",
      config = function()
        vim.cmd [[
        augroup switches
        autocmd FileType lisp let b:switch_custom_definitions =
        \ [
        \   {
          \     '"\(\k\+\)"': '''\1',
          \     '''\(\k\+\)': ':\1',
          \     ':\(\k\+\)': '#:\1',
          \     '#:\(\k\+\)':  '"\1"\2',
          \   },
          \ ]
          augroup END
          ]]
        end
      } -- gs: "abc" -> "abc -> :abc
      use "https://github.com/tpope/vim-surround" -- ysa) ysa)
      -- use {
      --   "kylechui/nvim-surround",
      --   config = function()
      --     require("nvim-surround").setup()
      --   end,
      -- }
      use { -- gcc
      "https://github.com/terrortylor/nvim-comment",
      config = function()
        require("nvim_comment").setup({
          comment_empty = false,
        })
      end,
    }
    use "https://github.com/tpope/vim-repeat"
    use "https://github.com/tpope/vim-unimpaired" -- [b, ]b, etc

    -- matching and movement
    use "https://github.com/andymass/vim-matchup"
    use "https://github.com/wellle/targets.vim"

    -- sexpr editing
    use "https://github.com/guns/vim-sexp"
    use "https://github.com/tpope/vim-sexp-mappings-for-regular-people"
    use {
      "https://github.com/Olical/conjure",
      config = function()
        vim.g["conjure#mapping#def_word"] = false
        vim.g["conjure#mapping#doc_word"] = false
      end
    }
    use "https://github.com/walterl/conjure-macroexpand"

    -- universal editor settings
    use {
      "https://github.com/editorconfig/editorconfig-vim",
      config = function()
        vim.g["EditorConfig_exclude_patterns"] = {'fugitive://.*'}
      end
    }
    -- use "https://github.com/sheerun/vim-polyglot"
    use {
      "https://github.com/neoclide/coc.nvim",
      branch = "release",
      config = function()
        vim.cmd("source ../../coc-nvim.vim")
      end
    }
    use {"nvim-treesitter/nvim-treesitter", run = ":TSUpdate"}

    -- language plugins

    -- asciidoc
    use {"https://github.com/asciidoc/vim-asciidoc", ft = "asciidoc"}

    -- asm
    use {"https://github.com/samsaga2/vim-z80", ft = "asm"}

    -- clojure
    use {"https://github.com/clojure-vim/clojure.vim", ft = "clojure"}
    use {
      "https://github.com/bfontaine/zprint.vim",
      ft = "clojure",
      config = function()
        vim.api.nvim_del_augroup_by_name("zprint")
      end
    }

    -- common lisp
    use {"https://github.com/vlime/vlime", rtp = "vim/", ft = "lisp"}

    -- dhall
    use {"https://github.com/vmchale/dhall-vim", ft = "dhall"}

    -- docker-compose
    use {"https://github.com/ekalinin/Dockerfile.vim", ft="dockerfile"}

    -- fennel
    use {"https://github.com/bakpakin/fennel.vim", ft = "fennel"}

    -- git
    use {"https://github.com/tpope/vim-git"}

    -- html5
    use {"https://github.com/othree/html5.vim", ft = "html"}

    -- javascript
    use {"https://github.com/pangloss/vim-javascript", ft = {"flow", "javascript"}}

    -- json5
    use {"https://github.com/GutenYe/json5.vim", ft = "json5"}

    -- json
    use {"https://github.com/elzr/vim-json", ft = "json"}

    -- jsonc
    use {"https://github.com/neoclide/jsonc.vim", ft = "jsonc"}

    -- justfiles
    use {"https://github.com/NoahTheDuke/vim-just", ft = "just"}

    -- lua
    use {"https://github.com/tbastos/vim-lua", ft = "lua"}

    -- markdown
    use {"https://github.com/plasticboy/vim-markdown", ft = "markdown"}

    -- python
    use {"https://github.com/psf/black", ft = "python"}
    use {"https://github.com/raimon49/requirements.txt.vim", ft = "requirements"}

    -- racket
    use {"https://github.com/wlangstroth/vim-racket", ft = "racket"}

    -- rst
    use {"https://github.com/marshallward/vim-restructuredtext"}

    -- ruby/rails
    use {"https://github.com/vim-ruby/vim-ruby", ft = "ruby"}
    use {"https://github.com/tpope/vim-rails", ft = "ruby"}

    -- rust
    use {"https://github.com/rust-lang/rust.vim", ft = "rust"}

    -- sh/bash/etc
    use {"https://github.com/arzg/vim-sh"}

    -- stylus
    use {"https://github.com/wavded/vim-stylus", ft = "stylus"}

    -- toml
    use {"https://github.com/cespare/vim-toml", ft = "toml"}

    -- twig
    use {"https://github.com/lumiliet/vim-twig", ft = "twig"}

    -- typescript
    use {"https://github.com/HerringtonDarkholme/yats.vim", ft = "typescript"}

    -- vue
    use {"https://github.com/posva/vim-vue", ft = "vue"}

    -- xml
    use {"https://github.com/amadeus/vim-xml", ft = "xml"}

    -- zig
    use {"https://github.com/ziglang/zig.vim", ft = "zig"}

    -- colors
    use {"https://github.com/dracula/vim", as = "dracula"}

    -- Must be final call
    if PACKER_BOOTSTRAP then
      require("packer").sync()
    end
  end)

  -- require "nvim-treesitter.configs".setup {
  --   matchup = {
  --     enable = true,
  --   },
  -- }
