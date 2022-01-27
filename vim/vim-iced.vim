" things to disable
let g:iced_enable_clj_kondo_analysis = v:false
let g:iced_enable_clj_kondo_local_analysis = v:false
let g:iced_enable_auto_indent = v:false
let g:iced_enable_default_key_mappings = v:false

" settings
let g:iced#buffer#stdout#mods = 'belowright'
let g:sexp_mappings = {'sexp_indent': '', 'sexp_indent_top': ''}

nmap <Nop>(iced_document_popup_open) <Plug>(iced_document_popup_open)

"" Evaluating (<Leader>e)
"" ------------------------------------------------------------------------
nmap <Leader>ei <Plug>(iced_eval)<Plug>(sexp_inner_element)``
nmap <Leader>ee <Plug>(iced_eval)<Plug>(sexp_outer_list)``
nmap <Leader>et <Plug>(iced_eval_outer_top_list)

nmap <Leader>ea <Plug>(iced_eval_at_mark)
nmap <Leader>el <Plug>(iced_eval_last_outer_top_list)
vmap <Leader>ee <Plug>(iced_eval_visual)
nmap <Leader>en <Plug>(iced_eval_ns)
nmap <Leader>ep <Plug>(iced_print_last)
nmap <Leader>eb <Plug>(iced_require)
nmap <Leader>eB <Plug>(iced_require_all)
nmap <Leader>eu <Plug>(iced_undef)
nmap <Leader>eU <Plug>(iced_undef_all_in_ns)
nmap <Leader>eM <Plug>(iced_macroexpand_outer_list)
nmap <Leader>em <Plug>(iced_macroexpand_1_outer_list)
nmap <Leader>enr <Plug>(iced_refresh)

  "" Testing (<Leader>t)
  "" ------------------------------------------------------------------------
nmap <Leader>tt <Plug>(iced_test_under_cursor)
nmap <Leader>tl <Plug>(iced_test_rerun_last)
nmap <Leader>ts <Plug>(iced_test_spec_check)
nmap <Leader>to <Plug>(iced_test_buffer_open)
nmap <Leader>tn <Plug>(iced_test_ns)
nmap <Leader>tp <Plug>(iced_test_all)
nmap <Leader>tr <Plug>(iced_test_redo)

  "" Stdout buffer (<Leader>s)
  "" ------------------------------------------------------------------------
nmap <Leader>ss <Plug>(iced_stdout_buffer_toggle)
nmap <Leader>sl <Plug>(iced_stdout_buffer_clear)
nmap <Leader>so <Plug>(iced_stdout_buffer_open)
nmap <Leader>sq <Plug>(iced_stdout_buffer_close)
