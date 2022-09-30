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
      mR = "change_icon_menu",
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
