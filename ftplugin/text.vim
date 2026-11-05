if exists('b:did_ftplugin')
  finish
endif
let b:did_ftplugin = 1

let b:undo_ftplugin = 'setlocal comments< commentstring<'

" We intentionally don't set formatoptions-=t since text should wrap as text.

" Pseudo comment leaders to indent bulleted lists with '-' and '*'.  And allow
" for Mail quoted text with '>'.
setlocal comments=fb:-,fb:*,n:>
setlocal commentstring=

setlocal tabstop=4
setlocal shiftwidth=4
" FIXME
" setlocal smarttab
setlocal expandtab
setlocal softtabstop=4

let b:undo_ftplugin ..= ' | setlocal ts< sw< et< sts<'
