-- [nfnl] fnl/noahtheduke/plugins/alpha.fnl
local utils = require("noahtheduke.utils")
local function setup()
  local errors_1_ = {}
  local _2_, alpha
  local function _5_()
    return require("alpha")
  end
  local function _6_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/alpha.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _2_, alpha = xpcall(_5_, _6_)
  local _3_, dashboard
  local function _8_()
    return require("alpha.themes.dashboard")
  end
  local function _9_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/alpha.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _3_, dashboard = xpcall(_8_, _9_)
  local _4_, headers
  local function _11_()
    return require("utils.headers")
  end
  local function _12_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/alpha.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _4_, headers = xpcall(_11_, _12_)
  if (_2_ and _3_ and _4_) then
    local lazy_plugins
    local function _14_(plugin)
      if (nil == plugin) then
        _G.error("Missing argument plugin on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/alpha.fnl:9", 2)
      else
      end
      return plugin.name
    end
    local function _16_()
      local lazy = require("lazy")
      return lazy.plugins()
    end
    lazy_plugins = vim.tbl_map(_14_, _16_())
    math.randomseed(os.time())
    dashboard.section.header.val = headers.random()
    dashboard.section.buttons.val = {dashboard.button("s", "\239\157\138  Load Session", ":SessionManager load_current_dir_session<CR>"), dashboard.button("r", "\239\152\136  Recent Files", ":Telescope oldfiles<CR>"), dashboard.button("n", "\239\133\155  New file", ":ene <BAR> startinsert <CR>"), dashboard.button("f", "\239\144\162  Find File", ":Telescope find_files<CR>"), dashboard.button("t", "\239\158\131  Find Text", ":Telescope live_grep<CR>"), dashboard.button("c", "\238\152\149  Configuration", ":e $MYVIMRC<CR>:cd %:h/../<CR>"), dashboard.button("q", "\239\153\153  Quit Neovim", ":qa!<CR>")}
    local function footer()
      local vim_version = vim.version()
      local version = ("\239\148\167 " .. vim_version.major .. "." .. vim_version.minor .. "." .. vim_version.patch)
      if (lazy_plugins == nil) then
        return version
      else
        local cnt = #lazy_plugins
        local total_plugins = ("  \239\150\149 " .. cnt .. " Plugins")
        return (version .. total_plugins)
      end
    end
    dashboard.section.footer.val = footer()
    dashboard.section.footer.opts.hl = "AlphaFooter"
    dashboard.section.header.opts.hl = "AlphaHeader"
    dashboard.section.buttons.opts.hl = "AlphaButton"
    dashboard.opts.opts.noautocmd = true
    return alpha.setup(dashboard.opts)
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
local function _19_(_plugin, _opts, run)
  if run then
    return setup()
  else
    return nil
  end
end
return utils.dep("https://github.com/goolord/alpha-nvim", {config = _19_})
