" Vim filetype plugin file
" Language:         Tcl
" Maintainer:       Robert L Hicks <sigzero@gmail.com>
" Latest Revision:  2009-05-01
"                   2024 Jan 14 by Vim Project (browsefilter)
"                   2024 May 23 by Riley Bruins <ribru17@gmail.com> ('commentstring')

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

" Make sure the continuation lines below do not cause problems in
" compatibility mode.
let s:cpo_save = &cpo
set cpoptions-=C
set cpoptions-=<          " allow '<keycode>' forms in mappings, e.g. <CR>

setlocal comments=:#
setlocal commentstring=#\ %s
setlocal formatoptions+=croql


setlocal fileformat=unix

setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4
setlocal autoindent
setlocal textwidth=0
setlocal cindent
setlocal cinkeys-=0#           " # in column 1 does not prevent >> from indenting
"-----------------------------------------------------------------------------

" Undo the stuff we changed.
let b:undo_ftplugin = 'setlocal fo< com< cms< inc< inex< def< isf< kp<'
let b:undo_ftplugin ..= ' | setlocal ts< sw< et< sts<'
let b:undo_ftplugin ..= ' | setlocal ai< tw< cin<'

" Restore the saved compatibility options.
let &cpo = s:cpo_save
unlet s:cpo_save
