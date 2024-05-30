:hi VimwikiHeader1 guifg=#FF0000 gui=bold,underline
:hi VimwikiHeader2 guifg=#FF1493
:hi VimwikiHeader3 guifg=#BF3EFF
:hi VimwikiHeader4 guifg=#7D9EC0
:hi VimwikiHeader5 guifg=#8E8E38
:hi VimwikiHeader6 guifg=#8DB6CD

setlocal foldlevel=1
setlocal foldenable
setlocal foldmethod=expr
setlocal foldexpr=Fold(v:lnum)

function! Fold(lnum)
  let fold_level = strlen(matchstr(getline(a:lnum), '^' . l:vimwiki_header_type . '\+'))
  if (fold_level)
    return '>' . fold_level  " start a fold level
  endif
  if getline(a:lnum) =~? '\v^\s*$'
    if (strlen(matchstr(getline(a:lnum + 1), '^' . l:vimwiki_header_type . '\+')) > 0 && !g:vimwiki_fold_blank_lines)
      return '-1' " don't fold last blank line before header
    endif
  endif
  return '=' " return previous fold level
endfunction
