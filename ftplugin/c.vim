" Only do this when not done yet for this buffer
if exists("b:did_ftplugin")
  finish
endif

" Don't load another plugin for this buffer
let b:did_ftplugin = 1

" Using line continuation here.
let s:cpo_save = &cpo
set cpoptions-=C

let b:undo_ftplugin = "setl fo< com< ofu< cms< def< inc< | if has('vms') | setl isk< | endif"

" Set 'formatoptions' to break comment lines but not other lines,
" and insert the comment leader when hitting <CR> or using "o".
setlocal formatoptions-=t formatoptions+=croql

" These options have the right value as default, but the user may have
" overruled that.
setlocal commentstring=/*\ %s\ */ define& include&

" Set completion with CTRL-X CTRL-O to autoloaded function.
if exists('&ofu') && has("vim9script")
  setlocal omnifunc=ccomplete#Complete
endif

" Set 'comments' to format dashed lists in comments.
" Also include ///, used for Doxygen.
setlocal comments=sO:*\ -,mO:*\ \ ,exO:*/,s1:/*,mb:*,ex:*/,:///,://

" In VMS C keywords contain '$' characters.
if has("vms")
  setlocal iskeyword+=$
endif

" Use terminal window for gui
if has('gui_running') && exists(':terminal') == 2 && executable("man")
  setlocal keywordprg=:CKeywordPrg

  command! -buffer -nargs=1 -count CKeywordPrg call s:CKeywordPrg(<q-args>, <count>)

  function! s:CKeywordPrg(arg, count) abort
    if a:count > 0
      exe printf('term ++close man -s %d %s', a:count, a:arg)
    else
      exe printf('term ++close man %s', a:arg)
    endif
  endfunction

  let b:undo_ftplugin .= ' | setl kp< | sil! delc -buffer CKeywordPrg'
endif

" When the matchit plugin is loaded, this makes the % command skip parens and
" braces in comments properly.
if !exists("b:match_words")
  let b:match_words = '^\s*#\s*if\%(\|def\|ndef\)\>:^\s*#\s*elif\%(\|def\|ndef\)\>:^\s*#\s*else\>:^\s*#\s*endif\>'
  let b:match_skip = 's:comment\|string\|character\|special'
  let b:undo_ftplugin ..= " | unlet! b:match_skip b:match_words"
endif


let &cpo = s:cpo_save
unlet s:cpo_save

"""""""""""""""""""""""""""""""""""""""""""""""""""""""
setlocal filetype=c
setlocal fileformat=unix
setlocal formatprg=astyle
setlocal tabstop=4
setlocal shiftwidth=4
setlocal expandtab
setlocal softtabstop=4
setlocal autoindent
setlocal cindent

let b:undo_ftplugin ..= ' | setl ts< sw< et< sts< ai< cin<'
