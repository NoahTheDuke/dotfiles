-- [nfnl] fnl/noahtheduke/plugins/conjure.fnl
local utils = require("noahtheduke.utils")
local function conjure()
  local errors_1_ = {}
  local _2_, core
  local function _11_()
    return require("nfnl.core")
  end
  local function _12_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/conjure.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _2_, core = xpcall(_11_, _12_)
  local _3_, eval
  local function _14_()
    return require("conjure.eval")
  end
  local function _15_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/conjure.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _3_, eval = xpcall(_14_, _15_)
  local _4_, extract
  local function _17_()
    return require("conjure.extract")
  end
  local function _18_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/conjure.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _4_, extract = xpcall(_17_, _18_)
  local _5_, log
  local function _20_()
    return require("conjure.log")
  end
  local function _21_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/conjure.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _5_, log = xpcall(_20_, _21_)
  local _6_, parse
  local function _23_()
    return require("conjure.client.clojure.nrepl.parse")
  end
  local function _24_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/conjure.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _6_, parse = xpcall(_23_, _24_)
  local _7_, runners
  local function _26_()
    return require("conjure.client.clojure.nrepl.action")
  end
  local function _27_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/conjure.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _7_, runners = xpcall(_26_, _27_)
  local _8_, server
  local function _29_()
    return require("conjure.client.clojure.nrepl.server")
  end
  local function _30_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/conjure.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _8_, server = xpcall(_29_, _30_)
  local _9_, str
  local function _32_()
    return require("nfnl.string")
  end
  local function _33_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/conjure.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _9_, str = xpcall(_32_, _33_)
  local _10_, ui
  local function _35_()
    return require("conjure.client.clojure.nrepl.ui")
  end
  local function _36_(err_2_auto)
    if (nil == err_2_auto) then
      _G.error("Missing argument err_2_auto on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/conjure.fnl:5", 2)
    else
    end
    return table.insert(errors_1_, debug.traceback(err_2_auto))
  end
  _10_, ui = xpcall(_35_, _36_)
  if (_2_ and _3_ and _4_ and _5_ and _6_ and _7_ and _8_ and _9_ and _10_) then
    local function time_current_form(extra_opts)
      if (nil == extra_opts) then
        _G.error("Missing argument extra-opts on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/conjure.fnl:15", 2)
      else
      end
      local form = extract.form({})
      if form then
        local content = form.content
        local range = form.range
        eval["eval-str"](core.merge({code = str.join({"(time (dotimes [_ 1000] ", content, "))"}), range = range, origin = "current-form"}, extra_opts))
        return form
      else
        return nil
      end
    end
    local function _40_()
      return time_current_form({})
    end
    vim.keymap.set("n", "<leader>et", _40_)
    local function ns_unmap(extra_opts)
      if (nil == extra_opts) then
        _G.error("Missing argument extra-opts on /Users/noah.bogart/dotfiles/nvim/fnl/noahtheduke/plugins/conjure.fnl:29", 2)
      else
      end
      local form = extract.form({["root?"] = true})
      if form then
        local content = form.content
        local range = form.range
        local var_name = core.second(str.split(parse["strip-meta"](content), "%s+"))
        local current_ns = extract.context()
        if var_name then
          log.append({core.str("; Unmapping ", var_name)}, {["break?"] = true})
          local function _42_(_241)
            return ui["display-result"](_241, {["simple-out?"] = true, ["raw-out?"] = true, ["ignore-nil?"] = false})
          end
          server.eval({code = core.str("(ns-unmap (the-ns '", current_ns, ") '", var_name, ")")}, _42_)
        else
        end
        return form
      else
        return nil
      end
    end
    vim.api.nvim_create_user_command("Unmap", ns_unmap, {})
    vim.g["conjure#extract#tree_sitter#enabled"] = true
    vim.g["conjure#log#hud#ignore_low_priority"] = true
    vim.g["conjure#log#wrap"] = true
    vim.g["conjure#mapping#def_word"] = false
    vim.g["conjure#mapping#doc_word"] = false
    vim.g["conjure#client#clojure#nrepl#connection#auto_repl#enabled"] = false
    vim.g["conjure#client#clojure#nrepl#eval#raw_out"] = true
    vim.g["conjure#client#clojure#nrepl#test#raw_out"] = false
    vim.g["conjure#client#clojure#nrepl#test#current_form_names"] = {"deftest", "defexpect", "defdescribe", "defn"}
    runners["test-runners"].lazytest = {namespace = "lazytest.repl", ["all-fn"] = "run-all-tests", ["ns-fn"] = "run-tests", ["single-fn"] = "run-test-var", ["default-call-suffix"] = "{:reporter [lazytest.reporters/nested]}", ["name-prefix"] = "#'", ["name-suffix"] = ""}
    vim.g["conjure#client#clojure#nrepl#test#call_suffix"] = ""
    vim.g["conjure#client#clojure#nrepl#test#runner"] = "clojure"
    return nil
  else
    return vim.notify(errors_1_[1], vim.log.levels.ERROR)
  end
end
--[[ (conjure) ]]
return {utils.dep("https://github.com/Olical/conjure.git", {config = conjure}), utils.dep("https://github.com/walterl/conjure-macroexpand", {dependencies = {"Olical/conjure"}}), utils.dep("https://github.com/walterl/conjure-locstack", {dependencies = {"Olical/conjure"}})}
