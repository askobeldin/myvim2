"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" part: variables
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Some useful variables
" usage:  expand(vimDir . '/path_to_folder_or_file')
"
if (has('win32') || has('win64'))
	let vimDir = '$HOME/vimfiles'
else
	let vimDir = '$HOME/.vim'
endif
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" part: plugin-manager-begin
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Set up Vundle:
" -------------
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Configure Plugins:
" -----------------
" Put this at the top of your .vimrc to use Vundle. Remove plugins you don't
" need, they are for illustration purposes.

" Brief help
" ----------
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal
"
"
if (has('win32') || has('win64'))
	set rtp+=~/vimfiles/bundle/Vundle.vim/
else
	set rtp+=~/.vim/bundle/Vundle.vim
endif

set nocompatible
filetype off

if (has('win32') || has('win64'))
	call vundle#begin('$HOME/vimfiles/bundle/')
else
	call vundle#begin()
endif

" let Vundle manage Vundle, required
Plugin 'VundleVim/Vundle.vim'


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" part: plugins
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" NerdTree
" Plugin 'scrooloose/nerdtree'

" NERDCommenter
Plugin 'scrooloose/nerdcommenter'

" vim-scripts/mru
Plugin 'vim-scripts/mru.vim'

" bufexplorer
Plugin 'jlanzarotta/bufexplorer'

" slimv
Plugin 'kovisoft/slimv'

" vimwiki
Plugin 'vimwiki/vimwiki'

" calendar (modern, with google)
Plugin 'itchyny/calendar.vim'

" c.vim
Plugin 'c.vim'

" UltiSnips
"Plugin 'SirVer/ultisnips'

" Doxygen
"Plugin 'DoxygenToolkit.vim'

" ctrlp.vim
"Plugin 'ctrlpvim/ctrlp.vim'

" vim-markdown and tabular
"Plugin 'godlygeek/tabular'

" vim-move
Plugin 'matze/vim-move'
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" part: plugin-manager-end
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" All of your Plugins must be added before the following line
call vundle#end()

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" part: common
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin indent on			" включение плагинов типа файла и отступов
runtime macros/matchit.vim


set encoding=utf-8


" allow backspacing over everything in insert mode
set backspace=indent,eol,start

if has("vms")
  set nobackup		" do not keep a backup file, use versions instead
else
  set backup		" keep a backup file
endif

" read .vimrc in local directory
set exrc

" security for local directory
set secure

" mapleader is `space`
let mapleader = " "

set nostartofline

" Some information is always good 
set showfulltag
set report=0

set shortmess-=aI
set shortmess+=T

set helpheight=12
set winminheight=0

" I want to see some context around
set scrolloff=2
set sidescrolloff=5
set sidescroll=15

" Nice :list or :set list
set listchars=tab:<->,trail:.,space:.,extends:+,eol:$,precedes:+

set fillchars="vert: ,fold:-"

" Diff options
set diffopt=filler,context:3

" Always save some info for next time
set history=2000
set viminfo='200,h

" Don't save options to session file - it's possibly buggy
set sessionoptions-=options

" It's not an MS Word clone
set secure

set ch=1				" number of lines used for the command-line
set nocul				" подсветка строки

set ruler				" show the cursor position all the time
set showcmd				" display incomplete commands
set incsearch			" do incremental searching
set nowrapscan			" 

set foldenable			" fold enable
" set foldmethod=indent

set laststatus=2		" 0 = never a status line; 2 = always a status line; 
                        " 1 = status line if there is more than one window

set nowrap				" long lines (no)wrap
set hidden
set vb					" visual bell enable

""""""""""""""""
" russian config
set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0

" autoreread file if it has changed outside
set autoread

set showmatch
set si                " enable smart indent

set ts=4
set sw=4

set linebreak			"включение симпатичного переноса строк
set ignorecase

set fenc=""
set fencs=""

set showtabline=1		" отображение закладок при открытии 2-х и более файлов ?

colorscheme oceandeep3


" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
map Q gq

" This is an alternative that also works in block mode, but the deleted
" text is lost and it only works for putting the current register.
"vnoremap p "_dp

" Switch syntax highlighting on, when the terminal has colors
" Also switch on highlighting the last used search pattern.
if &t_Co > 2 || has("gui_running")
  syntax on
  set hlsearch
endif

" Only do this part when compiled with support for autocommands.
if has("autocmd")

  " Enable file type detection.
  " Use the default filetype settings, so that mail gets 'tw' set to 72,
  " 'cindent' is on in C files, etc.
  " Also load indent files, to automatically do language-dependent indenting.
  filetype plugin indent on

  " Put these in an autocmd group, so that we can delete them easily.
  augroup vimrcEx
  au!

  " For all text files set 'textwidth' to 80 characters.
  autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else
  set autoindent		" always set autoindenting on
endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" part: statusline
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set statusline=%F%m%w%r\%=[%{&fenc}\|%{&ff}\|%Y\|%04l,%04v\|%p%%]
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" part: menu
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu
set wcm=<Tab>

menu MyMenu.Encoding.utf-8        :e ++enc=utf-8 <CR>
menu MyMenu.Encoding.koi8-r       :e ++enc=KOI8-R<CR>
menu MyMenu.Encoding.windows-1251 :e ++enc=cp1251<CR>
menu MyMenu.Encoding.cp866        :e ++enc=cp866<CR>
menu MyMenu.Listchars             :set list!<CR>
menu MyMenu.ClearSpaces ms:%s/\s\+$//e<CR>'s
menu MyMenu.Insert.LastChangeDate	msHmtgg/[Ll]ast[Cc]hange:\s*/e+1<CR>"_D"=strftime("%d %b %Y %X")<CR>p'tzt`s
menu MyMenu.Insert.ThisFileName		msHmtgg/[Ff]ile:\s*/e+1<CR>"_D"=expand("%:p")<CR>p'tzt`s
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" part: mappings
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" My menu mapping
map <F8>	:emenu MyMenu.<TAB>

" перемещение между окнами
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" перемещение между буферами
noremap <C-TAB> :bnext<CR>:redraw<CR>
noremap <C-S-TAB> :bprevious<CR>:redraw<CR>

" перемещение по истории команд
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" search for visually highlighted text
vmap // y/<C-R>"<CR>

" moving current text line up or down
"nnoremap <A-j> :m .+1<CR>==
"nnoremap <A-k> :m .-2<CR>==
"inoremap <A-j> <Esc>:m .+1<CR>==gi
"inoremap <A-k> <Esc>:m .-2<CR>==gi
"vnoremap <A-j> :m '>+1<CR>gv=gv
"vnoremap <A-k> :m '<-2<CR>gv=gv

" Toggles main menu in GUI mode
map <silent> <F11> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" part: leader-keys
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
map <Leader>h :set hlsearch!<CR>          " вкл. подсветки поиска

map <Leader>n :set number!<CR>            " вкл. нумерацию строк

" list mode
nmap <silent> <leader>lm :set list!<CR>

" NERDTree toggle
nnoremap <silent> <leader>t :NERDTreeToggle<CR>
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" part: functions
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" mydiff
"
set diffexpr=MyDiff()

function MyDiff()
   let opt = ""
   if &diffopt =~ "icase"
     let opt = opt . "-i "
   endif
   if &diffopt =~ "iwhite"
     let opt = opt . "-b "
   endif
   " silent execute "!diff -a --binary " . opt . v:fname_in . " " . v:fname_new .
	" \  " > " . v:fname_out
   silent execute '!"'.$VIMRUNTIME.'\diff" -a ' . opt . v:fname_in . ' ' . v:fname_new . ' > ' . v:fname_out
endfunction


"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" part: augroups
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" python files config
augroup filetype_py
	autocmd!
	autocmd BufRead *.py set nosmartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
	autocmd BufNewFile,BufReadPre *.py setlocal fileencoding=utf-8 fileformat=unix
	autocmd BufNewFile *.py silent! :execute "0r " . expand(vimDir . '/myheaders/python.header') . "|4"
augroup END

" perl files config
augroup filetype_perl
	autocmd!
	autocmd BufNewFile,BufReadPre *.pl setlocal fileencoding=utf-8 filetype=perl fileformat=unix
	autocmd BufNewFile *.pl silent! :execute "0r " . expand(vimDir . '/myheaders/perl.header') . "|10"
augroup END

" html files config
augroup filetype_html
	autocmd!
	autocmd BufNewFile,BufReadPre *.html setlocal fileencoding=utf-8 filetype=html fileformat=unix nowrap
	autocmd BufNewFile *.html silent! :execute "0r " . expand(vimDir . '/myheaders/html.header') . "|5"
augroup END

" javascript files config
augroup filetype_javascript
	autocmd!
	autocmd BufNewFile,BufReadPre *.js setlocal fileencoding=utf-8 filetype=javascript fileformat=unix
augroup END

" json files config
augroup filetype_json
	autocmd!
	autocmd BufNewFile,BufReadPre *.json setlocal fileencoding=utf-8 filetype=json fileformat=unix
augroup END

" tcl files config
augroup filetype_tcl
	autocmd!
	autocmd BufNewFile,BufReadPre *.tcl setlocal fileencoding=utf-8 filetype=tcl fileformat=unix
augroup END

" lisp files config
augroup filetype_lisp
	autocmd!
	autocmd BufNewFile,BufReadPre *.lisp setlocal fileencoding=utf-8 filetype=lisp fileformat=unix
	autocmd BufNewFile,BufReadPre *.cl setlocal fileencoding=utf-8 filetype=lisp fileformat=unix
	autocmd BufNewFile,BufReadPre *.el setlocal fileencoding=utf-8 filetype=lisp fileformat=unix
augroup END

" long lines highlighting
augroup longLines
    autocmd!
    autocmd BufEnter * let &colorcolumn=""
    autocmd BufEnter *.py let &colorcolumn="80"
    autocmd BufEnter *.lisp,*.cl,*.el,*.lsp let &colorcolumn="101"
augroup END

" markdown files config
augroup filetype_md
    autocmd!
    autocmd BufNewFile,BufReadPre *.md setlocal fileencoding=utf-8 fileformat=unix
augroup END

" C files config
augroup filetype_CC
    autocmd!
	autocmd BufNewFile,BufReadPre *.h,*.c setlocal cin fileencoding=utf-8 filetype=c.doxygen fileformat=unix
	autocmd filetype c setlocal cin filetype=c.doxygen fileencoding=utf-8 fileformat=unix formatprg=astyle
augroup END

" make files config
augroup filetype_make
    autocmd!
	autocmd filetype make setlocal nocin noexpandtab fileencoding=utf-8 fileformat=unix
augroup END
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" part: plugins-config
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" slimv
"
"""""""""""""""""""""""""""
" if there are problems - convert `slime.el` file to unix line endings
" open slime.el and then do: 
"         :w ++f=unix
"""""""""""""""""""""""""""
let g:paredit_leader = ','
"let g:slimv_impl = 'sbcl'
"if (has('win32') || has('win64'))
	" windows
	" let g:slimv_swank_cmd = '!start "sbcl" --load "C:/Users/a.skobeldin/vimfiles/bundle/slimv/slime/start-swank.lisp" '
"else
	" linux
	" let g:slimv_swank_cmd = '! xterm -e sbcl --load $HOME/.vim/bundle/slimv/slime/start-swank.lisp &'
"endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" vimwiki
"
if (has('win32') || has('win64'))
	" windows
	let wiki_win = {}
	let wiki_win.path = 'c:\myinfo\vimwiki\'
	let wiki_win.path_html = 'c:\myinfo\vimwiki\public_html\'
	let g:vimwiki_list = [wiki_win,]
else
	" linux
	let wiki_lin = {}
	let wiki_lin.path = '~/vimwiki/'
	let wiki_lin.path_html = '~/vimwiki/public_html/'
	let g:vimwiki_list = [wiki_lin,]
endif

" vim: set sw=2 ts=2 sts=2 et tw=80 ft=vim fdm=marker:
