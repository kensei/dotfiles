augroup filetypedetect
  au BufRead,BufNewFile *.py setfiletype python
  au BufRead,BufNewFile *.php setfiletype php
  au BufRead,BufNewFile *.go setfiletype go
  au BufRead,BufNewFile *.{md,mdwn,mkd,mkdn,mark*} set filetype=markdown
  au BufRead,BufNewFile *.{mm,m} setfiletype objc
  au BufRead,BufNewFile Makefike setfiletype make
  au BufRead,BufNewFile *.ts setfiletype typescript
  au BufRead,BufNewFile *.jbuilder setfiletype ruby
  au BufRead,BufNewFile *.slim setfiletype ruby
  au BufRead,BufNewFile *.rake setfiletype ruby
  au BufRead,BufNewFile *.cap setfiletype ruby
  au BufRead,BufNewFile *.tf setfiletype terraform
augroup END

autocmd FileType c          setlocal sw=4 sts=4 ts=4 et
autocmd FileType cpp        setlocal sw=4 sts=4 ts=4 et
autocmd FileType cs         setlocal sw=4 sts=4 ts=4 et
autocmd FileType css        setlocal sw=2 sts=2 ts=2 et
autocmd FileType diff       setlocal sw=4 sts=4 ts=4 et
autocmd FileType eruby      setlocal sw=4 sts=4 ts=4 et
autocmd FileType go         setlocal sw=4 sts=4 ts=4
autocmd FileType html       setlocal sw=2 sts=2 ts=2 et
autocmd FileType java       setlocal sw=4 sts=4 ts=4 et
autocmd FileType javascript setlocal sw=2 sts=2 ts=2 et
autocmd FileType typescript setlocal sw=2 sts=2 ts=2 et
autocmd FileType markdown   setlocal sw=4 sts=4 ts=4 et
autocmd FileType objc       setlocal sw=4 sts=4 ts=4
autocmd FileType perl       setlocal sw=4 sts=4 ts=4 et
autocmd FileType php        setlocal sw=4 sts=4 ts=4 et
autocmd FileType python     setlocal sw=4 sts=4 ts=4 et
autocmd FileType ruby       setlocal sw=2 sts=2 ts=2 et
autocmd FileType scala      setlocal sw=4 sts=4 ts=4 et
autocmd FileType sh         setlocal sw=4 sts=4 ts=4 et
autocmd FileType sql        setlocal sw=4 sts=4 ts=4 et
autocmd FileType vim        setlocal sw=2 sts=2 ts=2 et
autocmd FileType xhtml      setlocal sw=4 sts=4 ts=4 et
autocmd FileType xml        setlocal sw=4 sts=4 ts=4 et
autocmd FileType yaml       setlocal sw=2 sts=2 ts=2 et
autocmd FileType zsh        setlocal sw=4 sts=4 ts=4 et
autocmd FileType make       setlocal sw=4 sts=4 ts=4
autocmd FileType terraform  setlocal sw=2 sts=2 ts=2 et
