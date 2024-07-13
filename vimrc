" Changed: 2024-07-13 09:30:05
"
"
" Section variables {{{
"
" encoding and scriptencoding
set encoding=utf-8
scriptencoding utf-8
"
" Some useful variables
" usage:  expand(vimDir . '/path_to_folder_or_file')
"
if (has('win32') || has('win64'))
  let vimDir = '$HOME/vimfiles'
else
  let vimDir = '$HOME/.vim'
endif

let myviminfo_file = expand(vimDir . '/_viminfo')

if (has('win32') || has('win64'))
  let mybackupdir = $TEMP . '//'
  let mydirectory = $TEMP . '//'
  let myundodir = $TEMP . '//'
else
  " linux
  let mybackupdir = '/tmp/'
  let mydirectory = '/tmp/'
  let myundodir = '/tmp/'
endif
" }}}

" Section my plugins {{{
"
" Set up Vundle:
" -------------
" $ git clone https://github.com/VundleVim/Vundle.vim.git ~/.vim/bundle/Vundle.vim

" Configure plugins:
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

" my plugins
" ----------
"
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
"Plugin 'itchyny/calendar.vim'

" этот плагин работает с vimwiki
Plugin 'mattn/calendar-vim'

" c.vim
"Plugin 'c.vim'

" Doxygen
"Plugin 'DoxygenToolkit.vim'

" ctrlp.vim
Plugin 'ctrlpvim/ctrlp.vim'

" vim-markdown and tabular
"Plugin 'godlygeek/tabular'

" tagbar plugin
" Dependencies:
" Exuberant Ctags >= 5.5, or (highly recommended) any version of Universal Ctags
" which is a currently maintained fork of Exuberant Ctags with many bugfixes,
" support for many more formats, and proper Unicode support
Plugin 'majutsushi/tagbar'

" vim-move
Plugin 'matze/vim-move'

" Scratch window
"Plugin 'mtth/scratch.vim'

" startify
"Plugin 'mhinz/vim-startify'

" snippets
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
" snippets set for snipmate
"Plugin 'honza/vim-snippets'

" perl
" XXX: problems with vim9
"Plugin 'vim-perl/vim-perl',  { 'for': 'perl', 'do': 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny' }
"Plugin 'vim-perl/vim-perl', {'lazy' : 'true', 'ft' : 'perl', 'build' : 'make clean carp dancer highlight-all-pragmas moose test-more try-tiny'} 


" Color themes here
"
"Plugin 'larsbs/vimterial'
"Plugin 'adrian5/oceanic-next-vim'
"Plugin 'hzchirs/vim-material'
"Plugin 'glepnir/oceanic-material'

Plugin 'NLKNguyen/papercolor-theme'

" The end of plugins config
" All of your Plugins must be added before the following line
call vundle#end()
" }}}

" Section common {{{
"
filetype plugin indent on

packadd! matchit
" runtime macros/matchit.vim

set backspace=indent,eol,start    " allow backspacing over everything in insert mode

if has("vms")
  set nobackup  " do not keep a backup file, use versions instead
else
  set backup    " keep a backup file
endif
 
set exrc        " read .vimrc in local directory
set secure      " security for local directory

let mapleader = " "    " mapleader is `SPACE`

set nostartofline

" Some information is always good 
set showfulltag
set report=0

" messages
set shortmess-=aI
set shortmess+=T

" help window
set helpheight=12
set winminheight=0

" I want to see some context around
set scrolloff=2
set sidescrolloff=5
set sidescroll=15

set listchars=tab:<->,trail:.,space:.,extends:+,eol:$,precedes:+
set fillchars="vert: ,fold:-"

set diffopt=filler,context:3   " Diff options

" Always save some info for next time
set history=200
set viminfo='50,h,s100,<1000


set sessionoptions-=options       " Don't save options to session file - it's possibly buggy
set sessionoptions+=localoptions

set secure


" backup dirs
let &backupdir = mybackupdir
let &directory = mydirectory
let &undodir = myundodir

set ch=1            " number of lines used for the command-line
set ruler           " show the cursor position all the time
set showcmd         " display incomplete commands
set incsearch       " do incremental searching
set nowrapscan      " 
set foldenable      " fold enable
set laststatus=2    " 0 = never a status line; 2 = always a status line; 
                    " 1 = status line if there is more than one window
set nowrap          " long lines (no)wrap
set hidden
set vb              " visual bell enable

set keymap=russian-jcukenwin    " config for russian language

set iminsert=0
set imsearch=0
set autoread        " autoreread file if it has changed outside

set showmatch
set smartindent     " enable smart indent

set tabstop=4
set shiftwidth=4

set linebreak
set ignorecase

set showtabline=1    " when the line with tab page labels will be displayed

set fenc=""
set fencs=""

colorscheme atom

let &viminfofile=myviminfo_file
" misc {{{
" For Win32 GUI: remove 't' flag from 'guioptions': no tearoff menu entries
" let &guioptions = substitute(&guioptions, "t", "", "g")

" Don't use Ex mode, use Q for formatting
"map Q gq

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
  "autocmd FileType text setlocal textwidth=80

  " When editing a file, always jump to the last known cursor position.
  " Don't do it when the position is invalid or when inside an event handler
  " (happens when dropping a file on gvim).
  autocmd BufReadPost *
    \ if line("'\"") > 0 && line("'\"") <= line("$") |
    \   exe "normal g`\"" |
    \ endif

  augroup END

else
  set autoindent    " always set autoindenting on
endif
" }}}
" }}}

" Section statusline {{{
"
set statusline=%F%m%w%r\%=[%{&fenc}\|%{&ff}\|%Y\|%04l,%04v\|%p%%]
" }}}

" Section menu {{{
"
set wildmenu
set wcm=<Tab>

menu MyMenu.Encoding.utf-8        :e ++enc=utf-8 <CR>
menu MyMenu.Encoding.koi8-r       :e ++enc=KOI8-R<CR>
menu MyMenu.Encoding.windows-1251 :e ++enc=cp1251<CR>
menu MyMenu.Encoding.cp866        :e ++enc=cp866<CR>
menu MyMenu.Calendar              :Calendar<CR>
menu MyMenu.ClearSpaces ms:%s/\s\+$//e<CR>'s
"menu MyMenu.ThisFileName   msHmtgg/[Ff]ile:\s*/e+1<CR>"_D"=expand("%:p")<CR>p'tzt`s
" }}}

" Section mappings {{{
"
" my menu mapping
map <F8>  :emenu MyMenu.<TAB>

" snippets
imap <F9> <Plug>snipMateNextOrTrigger
smap <F9> <Plug>snipMateNextOrTrigger

" jumping cursor between windows
noremap <C-J> <C-W>j
noremap <C-K> <C-W>k
noremap <C-H> <C-W>h
noremap <C-L> <C-W>l

" перемещения курсора
noremap <silent> k gk
noremap <silent> j gj
"noremap <silent> 0 g0
"noremap <silent> $ g$

" switching buffers
noremap <C-TAB> :bnext<CR>:redraw<CR>
noremap <C-S-TAB> :bprevious<CR>:redraw<CR>

" moving in command's history
cnoremap <C-p> <Up>
cnoremap <C-n> <Down>

" search for visually highlighted text
vmap // y/<C-R>"<CR>

" Toggles main menu in GUI mode
map <silent> <F11> :if &go=~#'m'<Bar>set go-=m<Bar>else<Bar>set go+=m<Bar>endif<CR>

" expands `%%` text in Ex mode to path to folder of active buffer file
cnoremap <expr> %% getcmdtype() == ':' ? expand(expand('%:h').'/') : '%%'
" }}}

" Section leader keys mappings {{{
"
nnoremap <silent> <Leader>h :set hlsearch!<CR>     " toggle highlighting of search matches
nnoremap <silent> <Leader>n :set number!<CR>       " toggle of line numbers
nnoremap <silent> <Leader>lm :set list!<CR>        " list mode
"nnoremap <silent> <Leader>t :NERDTreeToggle<CR>    " NERDTree toggle
" }}}

" Section my functions {{{
"
" mydiff
set diffexpr=MyDiff()

function! MyDiff()
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


" If buffer modified, update any 'Changed: ' in the first 10 lines.
" 'Changed: ' can have up to 10 characters before (they are retained).
" Restores cursor and window position using save_cursor variable.
function! LastModifiedDate()
  if &modified
    let save_cursor = getpos(".")
    let n = min([10, line("$")])
    keepjumps exe '1,' . n . 's#^\(.\{,10}Changed: \).*#\1' .
          \ strftime('%Y-%m-%d %T') . '#e'
    call histdel('search', -1)
    call setpos('.', save_cursor)
  endif
endfunction
" }}}

" Section autocmd groups config {{{
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
  autocmd BufNewFile,BufReadPre *.pl,*.pm setlocal fileencoding=utf-8 filetype=perl fileformat=unix
  autocmd BufNewFile *.pl,*.pm silent! :execute "0r " . expand(vimDir . '/myheaders/perl.header') . "|10"
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

" go files config
augroup filetype_go
  autocmd!
  autocmd BufNewFile,BufReadPre *.go setlocal fileencoding=utf-8 filetype=go fileformat=unix
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

" vimwiki files config
augroup filetype_vimwiki
  autocmd!
  autocmd BufNewFile,BufReadPre *.wiki setlocal fileencoding=utf-8 fileformat=unix filetype=vimwiki
augroup END

augroup VimrcAuGroup
  autocmd!
  autocmd FileType vimwiki setlocal foldmethod=expr | setlocal foldenable | set foldexpr=VimwikiFoldLevelCustom(v:lnum)
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

" insert last modified date
autocmd BufWritePre * call LastModifiedDate()

" For all modifiabled text files
autocmd BufNewFile,BufReadPre *.txt
  \ if &modifiable |
  \     setlocal textwidth=0 fileencoding=utf-8 fileformat=unix |
  \     setlocal wrapmargin=1 formatoptions+=t formatoptions-=l |
  \     setlocal wrap |
  \ endif
" }}} 

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Configure my plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" slimv {{{
"
"""""""""""""""""""""""""""
" if there are problems - convert `slime.el` file to unix line endings
" open slime.el and then do: 
"         :w ++ff=unix
"""""""""""""""""""""""""""
let g:paredit_mode = 1
let g:paredit_electric_return = 1
let g:paredit_leader = ','
let g:slimv_impl = 'sbcl'
if (has('win32') || has('win64'))
  " windows
  " let g:slimv_swank_cmd = '!start "sbcl" --load "C:/Users/a.skobeldin/vimfiles/bundle/slimv/slime/start-swank.lisp" '
  let g:slimv_swank_cmd = '!start "sbcl" --load "' . expand(vimDir . '/bundle/slimv/slime/start-swank.lisp') . '"'
else
  " linux
  let g:slimv_swank_cmd = '! xterm -e sbcl --load $HOME/.vim/bundle/slimv/slime/start-swank.lisp &'
endif
" }}}

" vimwiki {{{
"
let path_to_wiki = '$HOME/vimwiki'
let g:vimwiki_ext2syntax = {'.wiki': 'default'}


" my personal wiki
let wiki_1 = {}
let wiki_1.path = expand(path_to_wiki . '/personal')
let wiki_1.path_html = expand(path_to_wiki . '/personal/html')
let wiki_1.name = 'My personal wiki'
let wiki_1.syntax = 'default'
let wiki_1.ext = '.wiki'
let wiki_1.links_space_char = '_'

" my work wiki
let wiki_2 = {}
let wiki_2.path = expand(path_to_wiki . '/work')
let wiki_2.path_html = expand(path_to_wiki . '/work/html')
let wiki_2.name = 'My work wiki'
let wiki_2.syntax = 'default'
let wiki_2.ext = '.wiki'
let wiki_2.links_space_char = '_'

let g:vimwiki_list = [wiki_1, wiki_2]
let g:vimwiki_use_calendar = 1

let g:vimwiki_global_ext = 1 
let g:vimwiki_folding = 'custom'

function! VimwikiFoldLevelCustom(lnum)
  let pounds = strlen(matchstr(getline(a:lnum), '^#\+'))
  if (pounds)
    return '>' . pounds  " start a fold level
  endif
  if getline(a:lnum) =~? '\v^\s*$'
    if (strlen(matchstr(getline(a:lnum + 1), '^#\+')))
      return '-1' " don't fold last blank line before header
    endif
  endif
  return '=' " return previous fold level
endfunction
" }}}
" MRU {{{
"
let MRU_File = expand(vimDir . '/_vim_mru_files')
" }}}
" Calendar 'itchyny/calendar.vim' plugin {{{
"
"let g:calendar_first_day = 'monday'
"let g:calendar_date_endian = 'little'
"let g:calendar_date_separator = '.'
"let g:calendar_week_number = 1
"let g:calendar_view = 'month'
"let g:calendar_views = ['year', 'month', 'week', 'day', 'agenda', 'event']
"let g:calendar_calendar = 'russia'
"let g:calendar_cache_directory = expand(path_to_wiki . '/calendar/cache') 

" colors
"autocmd FileType calendar call calendar#color#syntax('SaturdayTitle', '#ee0000', '#334e5b', '')
"autocmd FileType calendar call calendar#color#syntax('SundayTitle', '#ee0000', '#334e5b', '')
"autocmd FileType calendar call calendar#color#syntax('Sunday', '#ee0000', '#103040', '')
"autocmd FileType calendar call calendar#color#syntax('Saturday', '#ee0000', '#103040', '')
"autocmd FileType calendar call calendar#color#syntax('Today', '#ffff00', '#103040', 'bold')



"call calendar#color#syntax('Select', '', s:select_color, '')
"call calendar#color#syntax('TodaySunday', s:sunday_fg_color, s:sunday_bg_color, 'bold')
"call calendar#color#syntax('TodaySaturday', s:saturday_fg_color, s:saturday_bg_color, 'bold')
"call calendar#color#syntax('DayTitle', s:weekday_fg_color, s:weekday_color, '')
"call calendar#color#syntax('OtherMonth', s:othermonth_fg_color, '', '')
"call calendar#color#syntax('OtherMonthSelect', s:othermonth_fg_color, s:select_color, '')
"call calendar#color#syntax('NormalSpace', s:space_fg_color, s:space_bg_color, '')
"call calendar#color#syntax('CommentSelect', s:comment_fg_color, s:select_color, '')
"
" result of hi command:
" CalendarSelect xxx guibg=#3a5460
" CalendarSunday xxx guifg=#e41919 guibg=#461313
" CalendarSaturday xxx guifg=#1919e4 guibg=#131346
" CalendarTodaySunday xxx term=bold cterm=bold gui=bold guifg=#e41919 guibg=#461313
" CalendarTodaySaturday xxx term=bold cterm=bold gui=bold guifg=#1919e4 guibg=#131346
" CalendarToday  xxx term=bold cterm=bold gui=bold guifg=#159629 guibg=#123317
" CalendarDayTitle xxx guifg=#8f9ca2 guibg=#334e5b
" CalendarSundayTitle xxx guifg=#bc1717 guibg=#461313
" CalendarSaturdayTitle xxx guifg=#1717bc guibg=#131346
" CalendarOtherMonth xxx guifg=#6a7d86
" CalendarOtherMonthSelect xxx guifg=#6a7d86 guibg=#3a5460
" CalendarNormalSpace xxx guifg=#103040 guibg=#e4e4e4
" CalendarCommentSelect xxx guifg=CadetBlue guibg=#3a5460
" CalendarComment xxx links to Comment
"
" }}}
" vim: set sw=2 ts=2 sts=2 et tw=80 ff=unix ft=vim fdm=marker:
