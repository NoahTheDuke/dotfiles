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
