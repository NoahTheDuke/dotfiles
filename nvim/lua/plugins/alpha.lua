-- [nfnl] Compiled from fnl/plugins/alpha.fnl by https://github.com/Olical/nfnl, do not edit.
local utils = require("utils")
local function setup()
  local alpha = require("alpha")
  local dashboard = require("alpha.themes.dashboard")
  local headers = require("utils.headers")
  local lazy_plugins
  local function _1_(plugin)
    return plugin.name
  end
  local function _2_()
    local lazy = require("lazy")
    return lazy.plugins()
  end
  lazy_plugins = vim.tbl_map(_1_, _2_())
  math.randomseed(os.time())
  dashboard.section.header.val = headers.random()
  dashboard.section.buttons.val = {dashboard.button("s", "\239\157\138  Load Session", ":SessionManager<CR>"), dashboard.button("r", "\239\152\136  Recent Files", ":Telescope oldfiles<CR>"), dashboard.button("n", "\239\133\155  New file", ":ene <BAR> startinsert <CR>"), dashboard.button("f", "\239\144\162  Find File", ":Telescope find_files<CR>"), dashboard.button("t", "\239\158\131  Find Text", ":Telescope live_grep<CR>"), dashboard.button("c", "\238\152\149  Configuration", ":e $MYVIMRC<CR>:cd %:h/../<CR>"), dashboard.button("q", "\239\153\153  Quit Neovim", ":qa!<CR>")}
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
end
local function _4_(_plugin, _opts, run)
  if run then
    return setup()
  else
    return nil
  end
end
return utils.dep("https://github.com/goolord/alpha-nvim", {config = _4_})
