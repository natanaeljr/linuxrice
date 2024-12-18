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
Plug 'neoclide/coc.nvim', {'branch': 'release'}     " Conquer of Completion: Nodejs extension manager
Plug 'jackguo380/vim-lsp-cxx-highlight'             " C/C++/ObjC semantic highlighting
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " Fuzzy Finder
Plug 'junegunn/fzf.vim'                             " FZF preview
Plug 'kyazdani42/nvim-web-devicons'                 " File Type Icons
Plug 'romgrk/barbar.nvim'                           " Tabline plugin
Plug 'preservim/nerdcommenter'                      " Comment functions plugin
Plug 'tpope/vim-fugitive'                           " Git wrapper
Plug 'lukas-reineke/indent-blankline.nvim', {'branch': 'v2.20.8'} " Indent guides
Plug 'rust-lang/rust.vim'                           " Rust plugin
Plug 'dart-lang/dart-vim-plugin'                    " Dart plugin
call plug#end()

" coc.nvim global extensions
let g:coc_global_extensions = [
  \'coc-marketplace',
  \'coc-json',
  \'coc-git',
  \'coc-ccls',
  \'coc-clangd',
  \'coc-xml',
  \'coc-fzf-preview',
  \'coc-cmake',
  \'coc-explorer',
  \'coc-rust-analyzer',
  \'coc-lists',
  \'coc-yank',
  \'coc-cmake',
  \'coc-flutter-tools'
  \]
" fix coc-ccls: https://github.com/neoclide/coc.nvim/issues/2088

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

set statusline=%<%f\ \ \ [function\:%{get(b:,'coc_current_function','')}]\ \ \ %h%m%r%=%-14.(%l,%c%V%)\ %P

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Editing
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set cursorline              " Highlight current line
set hlsearch                " Highlight search matches
set nowrap                  " Wrap/nowrap lines
set number                  " Display line numbers
set number relativenumber   " Display line numbers relative to the cursor
set mouse=a                 " Enable mouse
set ttimeoutlen=10          " Timeout on escape key codes (e.g: ^[O)
"set ttymouse=sgr            " Fix mouse for unknown terminal $TERM types
set hidden                  " Hide unsaved buffers
set scrolloff=1             " Show at least one line above/below the cursor
set sidescrolloff=1         " Show at least one line left/right of the cursor
set list                    " Make whitespace characters visible
set listchars=tab:»·,trail:• " Strings to use for showing whitespace characters
let g:indent_blankline_char_list = ['│', '|', '¦', '┆', '┊']

" Restore cursor postion on file reopen
au BufReadPost * if line("'\"") > 1 && line("'\"") <= line("$") | exe "normal! g'\"" | endif

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Search for selected text, forwards or backwards.
vnoremap <silent> * :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy/<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '/\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>
vnoremap <silent> # :<C-U>
  \let old_reg=getreg('"')<Bar>let old_regtype=getregtype('"')<CR>
  \gvy?<C-R>=&ic?'\c':'\C'<CR><C-R><C-R>=substitute(
  \escape(@", '?\.*$^~['), '\_s\+', '\\_s\\+', 'g')<CR><CR>
  \gVzv:call setreg('"', old_reg, old_regtype)<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Completion
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set wildmenu                " Command-line completion enhanced mode
set wildmode=longest,full   " Completion mode options
set wildoptions=pum         " List completion options in a popupmenu

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Highlighting & Theme
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
syntax on
let g:sonokai_transparent_background = 1
colorscheme sonokai
set background=dark
set termguicolors
hi Normal ctermbg=NONE guibg=NONE           " Remove background color
hi EndOfBuffer ctermbg=NONE guibg=NONE      " Remove background color
nnoremap <silent> <leader><Esc> :nohlsearch<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Semantic Highlight
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" water-green: #54ccb8
" water-github: #6cb6ff
" vim-lsp-cxx-highlight
let g:lsp_cxx_hl_use_text_props = 1
highlight LspCxxHlSymType guifg=#54ccb8
highlight LspCxxHlSymStruct guifg=#54ccb8
highlight LspCxxHlSymClass guifg=#54ccb8
highlight LspCxxHlSymTypeAlias guifg=#54ccb8
highlight LspCxxHlSymEnum guifg=#54ccb8
highlight LspCxxHlSymEnumMember guifg=#d19a66
highlight LspCxxHlSymMacro guifg=#d19a66
highlight LspCxxHlSymNamespace guifg=#c3c5c9

" coc-semantic-highlights
let g:coc_default_semantic_highlight_groups=0
highlight CocSemTypeVariable guifg=#c3c5c9
highlight CocSemTypeFileScopeVariable guifg=#89b6ff
highlight CocSemTypeGlobalScopeVariable guifg=#89b6ff
highlight CocSemTypeParameter guifg=#c3c5c9
highlight CocSemTypeProperty guifg=#e6e8ed
highlight CocSemTypeClass guifg=#54ccb8
highlight CocSemTypeStruct guifg=#54ccb8
highlight CocSemTypeInterface guifg=#54ccb8
highlight CocSemTypeEnum guifg=#54cca8
highlight CocSemTypeEnumMember guifg=#d19a66
highlight CocSemTypeType guifg=#54ccb8
highlight CocSemTypeTypeAlias guifg=#54ccb8
highlight CocSemTypeTypeParameter guifg=#54ccb8
highlight CocSemTypeBuiltinType guifg=#d3869b
highlight CocSemTypeNamespace guifg=#c3c5c9
highlight CocSemTypeConcept guifg=#54ccb8
highlight CocSemTypeMacro guifg=#d19a66
"highlight CocSemTypeFunction
"highlight CocSemTypeMethod
"highlight CocSemTypeComment guifg=#928374
"highlight CocSemTypeComment guifg=NONE guibg=NONE gui=strikethrough
highlight CocSemTypeComment guifg=NONE guibg=#383838 gui=NONE
highlight CocSemTypeUnknown guifg=#7F8490

highlight CocInlayHintParameter guifg=Grey

nmap <silent> ghi :CocCommand semanticTokens.inspect<CR>
nmap <silent> ghr :CocCommand semanticTokens.refreshCurrent<CR>
nmap <silent> ghc :CocCommand semanticTokens.checkCurrent<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Copy/Paste
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set clipboard=unnamedplus   " Use X clipboard as main register

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Tags
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set tags=./tags;

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Session
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fix for coc-explorer buffer is empty error when session restored
set sessionoptions-=blank
function Session()
if filereadable("Session.vim")
  exec "source Session.vim"
else
  exec "mksession"
endif
endfunction

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Local .nvimrc
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
set exrc  " enable loading local .nvimrc

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Comments
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
filetype plugin on
nnoremap <silent> <C-;>  :call nerdcommenter#Comment('n', 'toggle')<CR>
xnoremap <silent> <C-;>  :call nerdcommenter#Comment('x', 'toggle')<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" coc-list & coc-yank
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" List buffers
nnoremap <silent> <leader>b  :<C-u>CocList -A buffers<cr>
" Paste with yank history
nnoremap <silent> <leader>p  :<C-u>CocList -A --normal yank<cr>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" File Explorer
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Open explorer
nmap <leader>ee <Cmd>CocCommand explorer<CR>
" Reveal to current buffer for closest coc-explorer
nmap <Leader>er <Cmd>call CocAction('runCommand', 'explorer.doAction', 'closest', ['reveal:0'], [['relative', 0, 'file']])<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Buffers
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Move to previous/next
nnoremap <silent>    <A-,> :BufferPrevious<CR>
nnoremap <silent>    <A-.> :BufferNext<CR>
" Re-order to previous/next
nnoremap <silent>    <A-<> :BufferMovePrevious<CR>
nnoremap <silent>    <A->> :BufferMoveNext<CR>
" Goto buffer in position...
nnoremap <silent>    <A-1> :BufferGoto 1<CR>
nnoremap <silent>    <A-2> :BufferGoto 2<CR>
nnoremap <silent>    <A-3> :BufferGoto 3<CR>
nnoremap <silent>    <A-4> :BufferGoto 4<CR>
nnoremap <silent>    <A-5> :BufferGoto 5<CR>
nnoremap <silent>    <A-6> :BufferGoto 6<CR>
nnoremap <silent>    <A-7> :BufferGoto 7<CR>
nnoremap <silent>    <A-8> :BufferGoto 8<CR>
nnoremap <silent>    <A-9> :BufferLast<CR>
" Pin/unpin buffer
nnoremap <silent>    <A-p> :BufferPin<CR>
" Close buffer
nnoremap <silent>    <A-c> :BufferClose<CR>
" List buffers
nnoremap <silent> <leader><tab> :Buffers<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Git
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Navigate chunks of current buffer
nmap [g <Plug>(coc-git-prevchunk)
nmap ]g <Plug>(coc-git-nextchunk)
" Navigate conflicts of current buffer
nmap [c <Plug>(coc-git-prevconflict)
nmap ]c <Plug>(coc-git-nextconflict)
" Chunk operations
nmap gs <Plug>(coc-git-chunkinfo)
nmap <silent> gu :CocCommand git.chunkUndo<CR>
nmap <silent> ga :CocCommand git.chunkStage<CR>
nmap <silent> gz :CocCommand git.chunkUnstage<CR>
" Show commit contains current position
nmap gc <Plug>(coc-git-commit)
" Create text object for git chunks
omap ig <Plug>(coc-git-chunk-inner)
xmap ig <Plug>(coc-git-chunk-inner)
omap ag <Plug>(coc-git-chunk-outer)
xmap ag <Plug>(coc-git-chunk-outer)
" Show git diff in a split window
nmap <silent> gf :Gdiffsplit<CR>
nmap <silent> gvf :Gvdiffsplit<CR>
nmap <silent> ghf :Ghdiffsplit<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" LSP
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Use <c-space> to trigger completion
inoremap <silent><expr> <c-space> coc#refresh()

" Use `:CocDiagnostics` to get all diagnostics of current buffer in location list.
nmap <silent> [d <Plug>(coc-diagnostic-prev)
nmap <silent> ]d <Plug>(coc-diagnostic-next)
nmap <silent> [e <Plug>(coc-diagnostic-prev-error)
nmap <silent> ]e <Plug>(coc-diagnostic-next-error)

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
xmap <leader>;  <Plug>(coc-format-selected)
nmap <leader>;  <Plug>(coc-format)
"
" Applying code actions to the selected code block
xmap <leader>av  <Plug>(coc-codeaction-selected)
nmap <leader>av  <Plug>(coc-codeaction-selected)

" Remap keys for applying code actions at the cursor position
nmap <leader>ac  <Plug>(coc-codeaction-cursor)
" Remap keys for apply code actions affect whole buffer
nmap <leader>as  <Plug>(coc-codeaction-source)
" Apply the most preferred quickfix action to fix diagnostic on the current line
nmap <leader>af  <Plug>(coc-fix-current)

" Outline search
nnoremap <silent> <leader>os  :<C-u>CocList -A outline<cr>
" Open outline window
nnoremap <silent> <leader>ow <Cmd>CocOutline<CR>

" Workspace Symbols
nnoremap <silent> <leader>s  :<C-u>CocList -A -I symbols<cr>

" Diagnostics Toogle
nmap <Leader>td <Cmd>call CocAction('diagnosticToggle')<CR>

" Toogle clangd hints
nmap <silent> <Leader>th :CocCommand document.toggleInlayHint<CR>

"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
" Fuzzy Finder
"""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""""
nmap <leader>f [fzf-p]
xmap <leader>f [fzf-p]

nnoremap <silent> [fzf-p]p     :<C-u>CocCommand fzf-preview.FromResources project_mru git<CR>
nnoremap <silent> [fzf-p]gs    :<C-u>CocCommand fzf-preview.GitStatus<CR>
nnoremap <silent> [fzf-p]ga    :<C-u>CocCommand fzf-preview.GitActions<CR>
nnoremap <silent> [fzf-p]b     :<C-u>CocCommand fzf-preview.Buffers<CR>
nnoremap <silent> [fzf-p]B     :<C-u>CocCommand fzf-preview.AllBuffers<CR>
nnoremap <silent> [fzf-p]o     :<C-u>CocCommand fzf-preview.FromResources buffer project_mru<CR>
nnoremap <silent> [fzf-p]<C-o> :<C-u>CocCommand fzf-preview.Jumps<CR>
nnoremap <silent> [fzf-p]g;    :<C-u>CocCommand fzf-preview.Changes<CR>
nnoremap <silent> [fzf-p]/     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'"<CR>
nnoremap <silent> [fzf-p]*     :<C-u>CocCommand fzf-preview.Lines --add-fzf-arg=--no-sort --add-fzf-arg=--query="'<C-r>=expand('<cword>')<CR>"<CR>
nnoremap          [fzf-p]gr    :<C-u>CocCommand fzf-preview.ProjectGrep<Space>
xnoremap          [fzf-p]gr    "sy:CocCommand   fzf-preview.ProjectGrep<Space>-F<Space>"<C-r>=substitute(substitute(@s, '\n', '', 'g'), '/', '\\/', 'g')<CR>"
nnoremap <silent> [fzf-p]t     :<C-u>CocCommand fzf-preview.BufferTags<CR>
nnoremap <silent> [fzf-p]q     :<C-u>CocCommand fzf-preview.QuickFix<CR>
nnoremap <silent> [fzf-p]l     :<C-u>CocCommand fzf-preview.LocationList<CR>
