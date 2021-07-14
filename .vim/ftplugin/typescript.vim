if exists('b:did_ftplugin_typescript')
    finish
endif
let b:did_ftplugin_typescript = 1

if exists('*TSScompleteFunc') && &omnifunc ==# ''
  setlocal omnifunc=TSScompleteFunc
endif
