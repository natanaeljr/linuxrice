" Natanael Josue Rabello's
"  _       _ _         _
" (_)_ __ (_) |___   _(_)_ __ ___
" | | '_ \| | __\ \ / / | '_ ` _ \
" | | | | | | |_ \ V /| | | | | | |
" |_|_| |_|_|\__(_)_/ |_|_| |_| |_|
" =================================
"
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Environment (ref: https://tlvince.com/vim-respect-xdg)
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set viminfo+=n$XDG_CACHE_HOME/nvim/viminfo   " Change .viminfo location
set directory=$XDG_CACHE_HOME/nvim,~/,/tmp   " Change .swp files location
set backupdir=$XDG_CACHE_HOME/nvim,~/,/tmp   " Change .bak files location
set runtimepath=$XDG_DATA_HOME/nvim/site,$XDG_DATA_HOME/nvim/site/after,$XDG_DATA_HOME/vim,$XDG_DATA_HOME/vim/after,$VIM,$VIMRUNTIME

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Leader
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
let mapleader="\<Space>"

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Plugins
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
call plug#begin(stdpath('data') . '/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'} " Conquer of Completion: Nodejs extension manager
Plug 'jackguo380/vim-lsp-cxx-highlight'         " C/C++/ObjC semantic highlighting
call plug#end()

" coc.nvim global extensions
let g:coc_global_extensions = ['coc-json', 'coc-git', 'coc-ccls']

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tab
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tabstop=2       " Tab width
set shiftwidth=2    " One indentation level width
set expandtab       " Use spaces instead of tabs

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Windows
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set splitbelow      " Horizontal split open below
set splitright      " Vertical split to the right

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline              " Highlight current line
set hlsearch                " Highlight search matches
set nowrap                  " Wrap/nowrap lines
set number                  " Display line numbers
"set number relativenumber   " Display line numbers relative to the cursor
set mouse=a                 " Enable mouse
set ttimeoutlen=100         " Timeout on escape key codes (e.g: ^[O)
"set ttymouse=sgr            " Fix mouse for unknown terminal $TERM types

" Restore cursor postion on file reopen
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu                " Command-line completion enhanced mode
set wildmode=longest,full   " Completion mode options
set wildoptions=tagfile     " Use Ctrl+D to list matching tags

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Syntax Highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
colorscheme gruvbox
set background=dark
hi Normal ctermbg=NONE guibg=NONE      " Remove background color

set termguicolors
highlight LspCxxHlSymType guifg=#56b6c2
highlight LspCxxHlSymStruct guifg=#56b6c2
highlight LspCxxHlSymClass guifg=#56b6c2
highlight LspCxxHlSymTypeAlias guifg=#56b6c2
highlight LspCxxHlSymEnum guifg=#56c2b0
highlight LspCxxHlSymEnumMember guifg=#d19a66
highlight LspCxxHlSymMacro guifg=#d19a66
highlight LspCxxHlSymNamespace guifg=#a9b2c3

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy/Paste
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus   " Use X clipboard as main register

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=./tags;

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Coc.nvim
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" show chunk diff at current position
nmap gs <Plug>(coc-git-chunkinfo)
" show commit contains current position
"nmap gc <Plug>(coc-git-commit)
" create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)

" GoTo code navigation.
nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

" Highlight the symbol and its references when holding the cursor.
autocmd CursorHold * silent call CocActionAsync('highlight')

" Symbol renaming.
nmap <leader>rn <Plug>(coc-rename)

" Formatting selected code.
xmap <leader>f  <Plug>(coc-format-selected)
nmap <leader>f  <Plug>(coc-format-selected)
