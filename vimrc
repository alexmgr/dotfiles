" Vundle plugin manager settings
" ==============================

set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
" Add additional plugins here
Plugin 'gmarik/Vundle.vim'
Plugin 'vim-scripts/minibufexpl.vim'
Plugin 'ervandew/supertab'
Plugin 'MarcWeber/vim-addon-mw-utils'
Plugin 'tomtom/tlib_vim'
Plugin 'garbas/vim-snipmate'
Plugin 'honza/vim-snippets'
Plugin 'mileszs/ack.vim'
Plugin 'davidhalter/jedi-vim'
Plugin 'embear/vim-localvimrc'
Plugin 'altercation/vim-colors-solarized'
" Python specific plugins
Plugin 'tell-k/vim-autopep8'
call vundle#end()

" General settings
" ===============
set nocompatible          " get rid of Vi compatibility mode. SET FIRST!
filetype on
filetype plugin indent on " filetype detection[ON] plugin[ON] indent[ON]
set t_Co=256              " enable 256-color mode.
syntax enable             " enable syntax highlighting (previously syntax on).
colorscheme desert        " set colorscheme
set number                " show line numbers
set nohlsearch            " Don't continue to highlight searched phrases.
set incsearch             " But do highlight as you type your search.
set ignorecase            " Make searches case-insensitive.
set ruler                 " Always show info along bottom.
set autoindent            " auto-indent
set tabstop=4             " tab spacing
set softtabstop=4         " unify
set shiftwidth=4          " indent/outdent by 4 columns
set shiftround            " always indent/outdent to the nearest tabstop
set expandtab             " use spaces instead of tabs
set smarttab              " use tabs at the start of a line, spaces elsewhere
set nowrap                " don't wrap text
set encoding=utf-8
set history=1000
set colorcolumn=120
set visualbell
set foldmethod=indent
set foldlevel=99
set hidden               " Keep unsaved buffers in the background
set confirm              " Ask for confirmation before closing unsaved buffers

" Backups/Swapfiles
" =================
set backup 		  " keep a backup file
set backupdir=~/.vim/backup/ " where to keep backup
set noswapfile 		  " don't keep a swap file

" Highlight EOL whitespace
" ========================
highlight ExtraWhitespace ctermbg=red guibg=red
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()

" Statusline
" ==========
set statusline=
set statusline+=%<\ " cut at start
set statusline+=%2*[%n%H%M%R%W]%*\ " flags and buf no
set statusline+=%-40f\ " path
set statusline+=%=%1*%y%*%*\ " file type
set statusline+=%10((%l,%c)%)\ " line and column
set statusline+=%P " percentage of file
set laststatus=2

" Display
" =======

set nolazyredraw           " turn off lazy redraw
set number                 " line numbers
:highlight LineNr term=bold cterm=NONE ctermfg=DarkGrey ctermbg=NONE gui=NONE guifg=DarkGrey guibg=NONE
set wildmenu               " turn on wild menu
set wildmode=list:longest,full
set whichwrap+=<,>,h,l,[,] " backspace and cursor keys wrap to
set shortmess=filtIoOA     " shorten messages
set report=0               " tell us about changes
set nostartofline          " don't jump to the start of line when scrolling
if !has("gui_running")
  let g:solarized_termtrans=1
  "let g:solarized_termcolors=256
endif
colorscheme solarized
set background=dark

" Key bindings
" ============

let mapleader=' '
nmap <leader>a <Esc>:Ack!
if has("autocmd")
  autocmd FileType python map <buffer> <f5> :w<cr>:!python %<cr>
  autocmd FileType python map <buffer> <leader>8 :call Autopep8()<CR>
  "autocmd BufWritePost *.py !autopep8 -i \"%s\"
end

" Plugin config
" =============
let g:SuperTabDefaultCompletionType = "context"
let g:jedi#popup_select_first = 0                                                                                          
let g:jedi#popup_on_dot = 0
map <C-P> :bp<cr>                                                                                                          
map <C-N> :bp<cr>

" Cscope mappings
" ===============
if has('cscope')
  set cscopetag cscopeverbose
  if has('quickfix')
    set cscopequickfix=s-,c-,d-,i-,t-,e-
  endif
  cnoreabbrev <expr> csa
    \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs add'  : 'csa')
  cnoreabbrev <expr> csf
    \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs find' : 'csf')
  cnoreabbrev <expr> csk
    \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs kill' : 'csk')
  cnoreabbrev <expr> csr
    \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs reset' : 'csr')
  cnoreabbrev <expr> css
    \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs show' : 'css')
  cnoreabbrev <expr> csh
    \ ((getcmdtype() == ':' && getcmdpos() <= 4)? 'cs help' : 'csh')
end


" Cscope mappings
" ===============
set tags=./tags,tags;$HOME

