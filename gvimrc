"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" part: gui-common
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
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

    set guitablabel=%N\ %f

    winpos 0 0 
    set lines=70			" количество строк 
    set columns=100			" количество столбцов

    colorscheme oceandeep3
	" set background=light
    " colorscheme PaperColor

endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" part: gui-printing
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set pfn=Consolas:h10:cRUSSIAN
set printoptions=left:12mm,right:12mm,top:12mm,bottom:12mm,header:2,syntax:n,wrap:y,paper:A4,duplex:off
set pheader=%<%f%h%m%=pg.\ %N/%{line('$')/66+1}          " 66 - lines per page
