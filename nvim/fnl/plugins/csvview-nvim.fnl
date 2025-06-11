(local utils (require :utils))

(utils.dep
  "https://github.com/hat0uma/csvview.nvim"
  {:opts {:cmd ["CsvViewEnable" "CsvViewDisable" "CsvViewToggle"]
          :keymaps
          {;; Excel-like navigation:
           ;; Use <Tab> and <S-Tab> to move horizontally between fields.
           ;; Use <Enter> and <S-Enter> to move vertically between rows and place the cursor at the end of the field.
           ;; Note: In terminals you may need to enable CSI-u mode to use <S-Tab> and <S-Enter>.
           :jump_next_field_end {1 "<Tab>"
                                 :mode ["n" "v"]}
           :jump_prev_field_end {1 "<S-Tab>"
                                 :mode ["n" "v"]}
           :jump_next_row {1 "<Enter>"
                           :mode ["n" "v"]}
           :jump_prev_row {1 "<S-Enter>"
                           :mode ["n" "v"]}}}})
