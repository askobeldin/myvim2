" Changed: 2020-11-15 18:42:01
"
"
" section common {{{
if has("gui")
    set guioptions+=aghre
    set guioptions-=T       " no toolbar
    set guioptions-=m       " no menu
    set guioptions-=r       " no right scrollbar
    set guioptions-=R       " no right scrollbar
    set guioptions-=l       " no left scrollbar
    set guioptions-=L       " no left scrollbar
    set guipty

  if (has('win32') || has('win64'))
    " set guifont=Consolas:h10:cRUSSIAN
    set guifont=DejaVu_Sans_Mono:h10:cRUSSIAN:qDRAFT
  else
    set guifont=DejaVu\ Sans\ Mono\ 9
  endif

    set guicursor=n-v-c:block-Cursor
    set guicursor=i:hor15-Cursor
    set cursorline

    set guitablabel=%N\ %f


    winpos 0 0 
    set lines=70        " number of lines
    set columns=100     " number of columns

    " my color scheme
    colorscheme oceandeep3
endif
" }}}

" section printing {{{
set pfn=Consolas:h10:cRUSSIAN
set printoptions=left:12mm,right:12mm,top:12mm,bottom:12mm,header:2,syntax:n,wrap:y,paper:A4,duplex:off
set pheader=%<%f%h%m%=pg.\ %N/%{line('$')/66+1}   " 66 - lines per page
" }}}

" vim: set sw=2 ts=2 sts=2 et tw=80 ff=unix ft=vim fdm=marker:
