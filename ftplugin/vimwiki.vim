if exists("b:did_ftplugin")
  finish
endif
" let b:did_ftplugin = 1

:hi VimwikiHeader1 guifg=#C67171  gui=bold  ctermfg=red      cterm=bold
:hi VimwikiHeader2 guifg=#71C671  gui=bold  ctermfg=white    cterm=bold
:hi VimwikiHeader3 guifg=#8E8E38  gui=bold  ctermfg=magenta  cterm=bold
:hi VimwikiHeader4 guifg=#7171C6  gui=bold  ctermfg=brown    cterm=bold
:hi VimwikiHeader5 guifg=#388E8E  gui=bold  ctermfg=grey     cterm=bold
:hi VimwikiHeader6 guifg=#8E388E  gui=bold  ctermfg=cyan     cterm=bold

setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4

if v:version >= 902
	" ver. 9.2
	setlocal complete=.^10
else
	" ver. < 9.2
	setlocal complete=.
endif

if &modifiable 
	setlocal textwidth=0 
	setlocal fileformat=unix
	setlocal wrapmargin=0 
	setlocal formatoptions+=t 
	setlocal formatoptions-=l
    setlocal wrap
endif

let b:undo_ftplugin = 'setlocal comments< commentstring<'
let b:undo_ftplugin ..= ' | setlocal ts< sw< et< sts<'
let b:undo_ftplugin ..= ' | setlocal tw< ff< wm< fo< wrap<'
