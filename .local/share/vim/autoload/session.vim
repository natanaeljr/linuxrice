" Save current session
function! session#Make()
  if g:sessionfile != ""
    echo "Saving."
    if (filewritable(g:sessiondir) != 2)
      exe 'silent !mkdir -p ' g:sessiondir
      redraw!
    endif
    exe "mksession! " . g:sessionfile
  endif
endfunction

" Load session from current directory
function! session#Load()
  if argc() == 0
    let g:sessiondir = $XDG_CACHE_HOME . "/vim/sessions" . getcwd()
    let g:sessionfile = g:sessiondir . "/session.vim"
    if (filereadable(g:sessionfile))
      exe 'source ' g:sessionfile
      "if has("gui_running")
      "  exec 'set background=light'
      "else
        exec 'set background=dark'
        exec 'hi Normal ctermbg=NONE'
      "endif
    endif
  else
    let g:sessionfile = ""
    let g:sessiondir = ""
  endif
endfunction

