set runtimepath+=$GOROOT/misc/vim
autocmd FileType go autocmd BufWritePre <buffer> Fmt
exe "set rtp+=".globpath($GOPATH, "src/github.com/nsf/gocode/vim")
set completeopt=menu,preview
