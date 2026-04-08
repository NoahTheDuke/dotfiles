-- [nfnl] fnl/noahtheduke/plugins/alpha.fnl
local utils = require("noahtheduke.utils")
local function __3efooter(_3flazy_plugins)
  local vim_version = vim.version()
  local version = ("\239\148\167 " .. vim_version.major .. "." .. vim_version.minor .. "." .. vim_version.patch)
  if (nil == _3flazy_plugins) then
    return version
  else
    local cnt = #_3flazy_plugins
    return (version .. "  \239\150\149 " .. cnt .. " Plugins")
  end
end
local function setup()
  local errors_2_ = {}
  local _3_, alpha
  local function _6_()
    return require("alpha")
  end
  local function _7_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/alpha.fnl:13", 2)
    else
    end
    return table.insert(errors_2_, debug.traceback(err_2_auto))
  end
  _3_, alpha = xpcall(_6_, _7_)
  local _4_, dashboard
  local function _9_()
    return require("alpha.themes.dashboard")
  end
  local function _10_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/alpha.fnl:13", 2)
    else
    end
    return table.insert(errors_2_, debug.traceback(err_2_auto))
  end
  _4_, dashboard = xpcall(_9_, _10_)
  local _5_, headers
  local function _12_()
    return require("utils.headers")
  end
  local function _13_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on fnl/noahtheduke/plugins/alpha.fnl:13", 2)
    else
    end
    return table.insert(errors_2_, debug.traceback(err_2_auto))
  end
  _5_, headers = xpcall(_12_, _13_)
  if (_3_ and _4_ and _5_) then
    math.randomseed(os.time())
    local _let_15_ = vim.deepcopy(dashboard.section)
    local header = _let_15_.header
    local buttons = _let_15_.buttons
    local footer = _let_15_.footer
    header.val = headers.random()
    header.opts.hl = "AlphaHeader"
    buttons.val = {dashboard.button("s", "\239\157\138  Load Session", ":SessionManager load_current_dir_session<CR>"), dashboard.button("r", "\239\152\136  Recent Files", ":Telescope oldfiles<CR>"), dashboard.button("n", "\239\133\155  New file", ":ene <BAR> startinsert <CR>"), dashboard.button("f", "\239\144\162  Find File", ":Telescope find_files<CR>"), dashboard.button("t", "\239\158\131  Find Text", ":Telescope live_grep<CR>"), dashboard.button("c", "\238\152\149  Configuration", ":e $MYVIMRC<CR>:cd %:h/../<CR>"), dashboard.button("q", "\239\153\153  Quit Neovim", ":qa!<CR>")}
    buttons.opts.hl = "AlphaButton"
    do
      local lazy_plugins
      local function _16_(plugin)
        if (nil == plugin) then
          _G.error("Missing argument plugin on fnl/noahtheduke/plugins/alpha.fnl:34", 2)
        else
        end
        return plugin.name
      end
      local function _18_()
        local lazy = require("lazy")
        return lazy.plugins()
      end
      lazy_plugins = vim.tbl_map(_16_, _18_())
      footer.val = __3efooter(lazy_plugins)
    end
    footer.opts.hl = "AlphaFooter"
    local config = {layout = {{type = "padding", val = 2}, header, {type = "padding", val = 2}, buttons, footer}, opts = {margin = 5, noautocmd = true}}
    return alpha.setup(config)
  else
    return vim.notify(errors_2_[1], vim.log.levels.ERROR)
  end
end
local function _20_(_plugin, _opts, run)
  if run then
    return setup()
  else
    return nil
  end
end
return utils.dep("https://github.com/goolord/alpha-nvim", {config = _20_})
