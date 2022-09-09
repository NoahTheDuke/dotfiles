-- disable filetype.vim, load filetype.lua instead
vim.g.did_load_filetypes = 0
vim.g.do_filetype_lua = 1

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

  -- core functionality
  use "https://github.com/qpkorr/vim-bufkill" -- :BD, :BW
  use "https://github.com/ReekenX/vim-rename2" -- :Rename
  use "https://github.com/ypcrts/securemodelines" -- Pure security

  -- visual/display
  use {
    "https://github.com/vim-airline/vim-airline",
    setup = function()
      local utils = require "user.utils"
      utils.g_set("airline#extensions#coc#enabled", 1)
      utils.g_set("airline#extensions#tabline#enabled", 1)
      utils.g_set("airline#extensions#tabline#formatter", "default")
      utils.g_set("airline#extensions#whitespace#mixed_indent_algo", 1)
      utils.g_set("airline_highlighting_cache", 1)
    end
  }
  use "https://github.com/vim-airline/vim-airline-themes"

  use { "https://github.com/mbbill/undotree" } -- :UndotreeToggle

  use {
    "https://github.com/wfxr/minimap.vim",
    config = function()
      vim.g.minimap_highlight_range = 1
      vim.g.minimap_width = 10
      vim.g.minimap_git_colors = 1
    end
  } -- :MinimapToggle
  use {
    "https://github.com/previm/previm",
    ft = "md",
    config = function()
      vim.g.previm_open_cmd = "open -a Firefox"
    end
  } -- :PreviewOpen

  use {
    "https://github.com/phaazon/mind.nvim",
    branch = "v2.2",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("mind").setup({
        keymaps = {
          normal = {
            mc = "add_inside_end_index",
            mI = "add_inside_start",
            mi = "add_inside_end",
            ml = "copy_node_link",
            mL = "copy_node_link_index",
            md = "delete",
            mO = "add_above",
            mo = "add_below",
            mq = "quit",
            mr = "rename",
            mR = "change_icon",
            mu = "make_url",
            mx = "select",
          },
          selection = {
            mI = "move_inside_start",
            mi = "move_inside_end",
            mO = "move_above",
            mo = "move_below",
            mq = "quit",
            mx = "select",
          }
        }
      })
    end
  }

  -- git stuff
  use "https://github.com/tpope/vim-fugitive" -- :Git [blah blah]
  use "https://github.com/shumphrey/fugitive-gitlab.vim" -- Sets up gitlab settings
  use "https://github.com/tpope/vim-rhubarb" -- :GitBrowse

  -- movement/directory
  use "https://github.com/lambdalisue/fern.vim" -- :Fern . -drawer -toggle

  use "https://github.com/tpope/vim-projectionist" -- :A, etc

  use "https://github.com/ryanoasis/vim-devicons"
  use {
    "https://github.com/nvim-telescope/telescope.nvim",
    config = function()
      local actions = require("telescope.actions")
      require("telescope").setup({
        defaults = {
          mappings = {
            i = {
              ["<esc>"] = actions.close,
              ["<C-u>"] = false,
              ["<C-j>"] = actions.move_selection_next,
              ["<C-k>"] = actions.move_selection_previous,
            },
          },
        }
      })
    end,
  }

  -- editing
  use {
    "https://github.com/AndrewRadev/splitjoin.vim",
    config = function()
      vim.g.splitjoin_trailing_comma = 1
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

  use {
    "https://github.com/kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  }

  -- gcc
  use {
    "https://github.com/terrortylor/nvim-comment",
    config = function()
      require("nvim_comment").setup({ comment_empty = false })
    end
  }
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
    config = function()
      vim.g["conjure#mapping#def_word"] = false
      vim.g["conjure#mapping#doc_word"] = false
      vim.g["conjure#client#clojure#nrepl#eval#raw_out"] = true
      vim.g["conjure#log#wrap"] = true
    end
  }
  use "https://github.com/walterl/conjure-macroexpand"

  -- universal editor settings
  use {
    "https://github.com/editorconfig/editorconfig-vim",
    config = function()
      vim.g.EditorConfig_exclude_patterns = { "fugitive://.*" }
    end
  }
  use {
    "https://github.com/neoclide/coc.nvim",
    branch = "release",
    config = function()
      vim.cmd("source " .. "$HOME/dotfiles/nvim/coc-nvim.vim")
    end
  }

  use {
    "https://github.com/airblade/vim-rooter",
    config = function ()
      vim.g.rooter_manual_only = 1
      vim.g.rooter_silent_chdir = 1
      vim.g.rooter_patterns = {
        ".git",
        "Cargo.toml",
        "deps.edn",
        "package.json",
        "project.clj",
      }
    end,
  }

  use {
    "https://github.com/nvim-treesitter/nvim-treesitter",
    run = ":TSUpdate",
    config = function()
      require("nvim-treesitter.configs").setup {
        ensure_installed = {
          "javascript",
          "lua",
          "query",
          "rust",
          "typescript",
          "vue",
        },
        highlight = { enable = true },
        incremental_selection = { enable = true },
        textobjects = { enable = true },
        -- playground = { enable = true },
        -- query_linter = {
        --   enable = true,
        --   use_virtual_text = true,
        --   lint_events = { "BufWrite", "CursorHold" },
        -- },
      }
    end
  }
  -- use "https://github.com/nvim-treesitter/playground"

  use {
    "https://github.com/glacambre/firenvim",
    run = function()
      vim.fn["firenvim#install"](0)
    end,
    config = function()
      vim.g.firenvim_config = {
        globalSettings = {
          alt = "all",
        },
        localSettings = {
          [ [[.*]] ] = {
            cmdline = "firenvim",
            priority = 0,
            selector = 'textarea:not([readonly]):not([class="handsontableInput"]), div[role="textbox"]',
            takeover = "always",
          },
          [ [[.*discord\.com.*]] ] = { priority = 9, takeover = "never" },
          [ [[.*docs\.google\.com.*]] ] = { priority = 9, takeover = "never" },
          [ [[.*notion\.so.*]] ] = { priority = 9, takeover = "never" },
          [ [[.*twitter\.com.*]] ] = { priority = 9, takeover = "never" },
          [ [[.*twitch\.tv.*]] ] = { priority = 9, takeover = "never" },
        },
      }
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
    config = function()
      vim.g.clojure_syntax_keywords = {
        clojureMacro = {
          "wait-for",
          "continue-ability",
          "do-game",
          "deftest-pending",
          "changes-val-macro",
          "when-let*",
          "before-each",
        }
      }
      vim.cmd [[
        augroup clojure
          autocmd FileType clojure setlocal lispwords+=before-each,do-game
        augroup END
      ]]
    end,
  }
  use {
    "https://github.com/bfontaine/zprint.vim",
    ft = "clojure",
    setup = function()
      vim.g["zprint#make_autocmd"] = 0
    end
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
    config = function()
      vim.g.vim_json_syntax_conceal = 0
    end
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

  -- Must be final call
  if PACKER_BOOTSTRAP then
    require("packer").sync()
  end
end)
