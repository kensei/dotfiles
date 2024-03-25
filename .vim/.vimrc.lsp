function! s:on_lsp_buffer_enabled() abort
  setlocal omnifunc=lsp#complete
  setlocal signcolumn=yes
  nmap <buffer> gd <plug>(lsp-definition)
  nmap <buffer> <f2> <plug>(lsp-rename)
  inoremap <expr> <cr> pumvisible() ? "\<c-y>\<cr>" : "\<cr>"
endfunction

augroup lsp_install
  au!
  autocmd User lsp_buffer_enabled call s:on_lsp_buffer_enabled()
augroup END
command! LspDebug let lsp_log_verbose=1 | let lsp_log_file = expand('~/lsp.log')

let g:lsp_diagnostics_enabled = 1
let g:lsp_diagnostics_echo_cursor = 1
let g:lsp_text_edit_enabled = 1
let g:lsp_settings_enable_suggestions = 0

"" 環境変数でdevcontainerにリモートlspの設定が定義されている場合
if exists("$DEV_CONTAINER_JSON_PATH") && executable("devcontainer")
  let s:json_data = readfile($DEV_CONTAINER_JSON_PATH)
  let s:devcontainer_json = json_decode(join(s:json_data))
  let s:current_dir = substitute(getcwd(), '^.*/', '', '')
  for s:item in s:devcontainer_json['vim']['lsp-containers']
    if s:item['mount-path'] == s:current_dir
      au User lsp_setup call lsp#register_server({
        \ 'name': s:item['lsp-server-name'],
        \ 'tcp': { server_info-> "localhost:" . s:item['port'] },
        \ 'allowlist': [s:item['file-type']],
        \ })
      au FileType s:item['file-type'] setlocal omnifunc=lsp#complete
    endif
  endfor
endif
