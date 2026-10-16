(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")

(λ config []
  (when-require [md-toc "md_toc"]
    (md-toc.setup
      {:auto_update true
       :fence_text "toc"
       :list_marker "-"
       :style "gfm"
       :telekasten_integration true})))

(utils.dep
   "https://github.com/dan-lynam/md_toc"
   {:config config
    :commit "ec9f70ddd224e37258876b47aec858d5788622da"})
