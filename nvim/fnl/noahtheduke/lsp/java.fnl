(local utils (require "noahtheduke.utils"))
(import-macros {: callback : when-require} "noahtheduke.util-macros")

(local jls
  "/Users/noah/programming/open-source/java-language-server/dist/lang_server_mac.sh")

(vim.lsp.config
  :java
  {:cmd [jls]
   :filetypes ["java"]
   :root_markers ["pom.xml"]
   :trace "verbose"})

(when (utils.file-exists jls)
  (vim.lsp.enable :java))

nil
