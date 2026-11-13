" Vim filetype plugin file
" Language:             YAML (YAML Ain't Markup Language)
" Last change: 2026-11-13 13:42:43

if exists("b:did_ftplugin")
  finish
endif
let b:did_ftplugin = 1

let s:cpo_save = &cpo
set cpo&vim

let b:undo_ftplugin = "setl com< cms< et< fo<"

setlocal comments=:# commentstring=#\ %s expandtab
setlocal formatoptions-=t formatoptions+=croql
setlocal fileformat=unix

if get(g:, 'yaml_recommended_style',
      \ get(g:, 'filetype_recommended_style', 1))
  let b:undo_ftplugin ..= " sw< sts<"
  setlocal shiftwidth=2 softtabstop=2
endif

let &cpo = s:cpo_save
unlet s:cpo_save
