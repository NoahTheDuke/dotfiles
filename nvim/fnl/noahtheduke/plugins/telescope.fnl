(local utils (require "noahtheduke.utils"))
(import-macros {: when-require} "noahtheduke.util-macros")
(local keyset vim.keymap.set)

(λ config []
  (when-require [telescope "telescope"
                 actions "telescope.actions"
                 builtin "telescope.builtin"]

    (telescope.load_extension "fzf")
    (telescope.setup
      {:defaults
       {:prompt_prefix " "
        :selection_caret " "
        :path_display
        {:shorten {:len 3
                   :exclude [-1 -2]}}

        :mappings
        {:i {"<C-n>" actions.cycle_history_next
             "<C-p>" actions.cycle_history_prev

             "<C-j>" actions.move_selection_next
             "<C-k>" actions.move_selection_previous

             "<C-c>" actions.close
             "<esc>" actions.close

             "<Down>" actions.move_selection_next
             "<Up>" actions.move_selection_previous

             "<CR>" actions.select_default
             "<C-x>" actions.select_horizontal
             "<C-v>" actions.select_vertical
             "<C-t>" actions.select_tab

             "<C-u>" actions.preview_scrolling_up
             "<C-d>" actions.preview_scrolling_down

             "<PageUp>" actions.results_scrolling_up
             "<PageDown>" actions.results_scrolling_down

             "<Tab>" (+ actions.toggle_selection actions.move_selection_worse)
             "<S-Tab>" (+ actions.toggle_selection actions.move_selection_better)
             "<C-q>" (+ actions.send_to_qflist actions.open_qflist)
             "<M-q>" (+ actions.send_selected_to_qflist actions.open_qflist)
             "<C-l>" actions.complete_tag
             "<C-_>" actions.which_key ;; keys from pressing <C-/>
             }

         :n {
             "<esc>" actions.close
             "<CR>" actions.select_default
             "<C-x>" actions.select_horizontal
             "<C-v>" actions.select_vertical
             "<C-t>" actions.select_tab

             "<Tab>" (+ actions.toggle_selection actions.move_selection_worse)
             "<S-Tab>" (+ actions.toggle_selection actions.move_selection_better)
             "<C-q>" (+ actions.send_to_qflist actions.open_qflist)
             "<M-q>" (+ actions.send_selected_to_qflist actions.open_qflist)

             "j" actions.move_selection_next
             "k" actions.move_selection_previous
             "H" actions.move_to_top
             "M" actions.move_to_middle
             "L" actions.move_to_bottom

             "<Down>" actions.move_selection_next
             "<Up>" actions.move_selection_previous
             "gg" actions.move_to_top
             "G" actions.move_to_bottom

             "<C-u>" actions.preview_scrolling_up
             "<C-d>" actions.preview_scrolling_down

             "<PageUp>" actions.results_scrolling_up
             "<PageDown>" actions.results_scrolling_down

             "?" actions.which_key
             }}}
       :pickers {:find_files
                 {:find_command ["fd" "--type" "f" "--exclude" "build-tools"]}}})

    (keyset "n" "<leader>ff" ":lua require('telescope.builtin').find_files()<cr>"
            {:noremap true
             :silent true
             :desc "Telescope find files"})

    (keyset "n" "<leader>ft" ":lua require('telescope.builtin').live_grep()<cr>"
            {:noremap true
             :silent true
             :desc "Telescope grep"})

    (keyset "n" "<leader>fb" ":lua require('telescope.builtin').buffers()<cr>"
            {:noremap true
             :silent true
             :desc "Telescope buffers"})

    (keyset "n" "<leader>fh" ":lua require('telescope.builtin').help_tags()<cr>"
            {:noremap true
             :silent true
             :desc "Telescope help tags"})
    (keyset "n" "<leader>fcs" ":lua require('telescope.builtin').colorscheme()<cr>"
            {:noremap true
             :silent true
             :desc "Choose colorscheme"})

    (keyset "n" "<leader>:" ":lua require('telescope.builtin').commands()<cr>"
            {:noremap true
             :silent true
             :desc "Telescope : commands"})

    (let [lsp-list
          [{:lhs "<leader>te" :rhs builtin.diagnostics :desc "List diagnostics"}
           {:lhs "<leader>ti" :rhs builtin.lsp_implementations :desc "Goto the implementation of the word under the cursor if there's only one, otherwise show all options"}
           {:lhs "<leader>tr" :rhs builtin.lsp_references :desc "Lists LSP references for word under the cursor"}
           {:lhs "<leader>ts" :rhs builtin.lsp_document_symbols :desc "Lists LSP document symbols in the current buffer"}]]

      (each [_ v (ipairs lsp-list)]
        (keyset "n" v.lhs v.rhs
                {:nowait true
                 :noremap true
                 :silent true
                 :desc v.desc})))))

(comment
  (config))

[(utils.dep
   "https://github.com/nvim-telescope/telescope-fzf-native.nvim.git"
   {:build "make"})
 (utils.dep
  "https://github.com/nvim-telescope/telescope.nvim"
  {:config config})]
