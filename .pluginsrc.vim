" ------ VANDL PLUGINS START -----------------
"

filetype off                  " required

" Istall Vundle
" git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim

"=====================================================
" Vundle settings
"=====================================================
" set the runtime path to include Vundle and initialize
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'gmarik/Vundle.vim'      " let Vundle manage Vundle, required

"---------=== Code/project navigation ===-------------
Plugin 'scrooloose/nerdtree'            " Project and file navigation
Plugin 'majutsushi/tagbar'              " Class/module browser

"--------------=== Snippets support ===---------------
Plugin 'garbas/vim-snipmate'       " Snippets manager
Plugin 'MarcWeber/vim-addon-mw-utils'  " dependencies #1
Plugin 'tomtom/tlib_vim'       " dependencies #2
" Plugin 'SirVer/ultisnips'
Plugin 'honza/vim-snippets'        " snippets repo

"---------------=== Languages support ===-------------
" --- Python ---
if has('python')
    Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints
    "  highlighting, run and ipdb and more)
endif

" "------------------=== Other ===----------------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'

Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'mhinz/vim-startify'             " Nice start screen

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'


call vundle#end()            		" required
filetype on
filetype plugin on
filetype plugin indent on

"  ----- PLUGINS END -----------

" --------== UltiSnips ==-------------------
" let g:UltiSnipsExpandTrigger="<tab>"

" --------== Startify ==-------------------
" disable random quotes header
let g:startify_custom_header = []


" --------== Airline ==-------------------
" let g:airline_theme = 'monokai'
" Set custom left separator 
let g:airline_left_sep = '▶'
" Set custom right separator 
let g:airline_right_sep = '◀'
" Enable airline for tab-bar 
let g:airline#extensions#tabline#enabled = 1
" Don't display buffers in tab-bar with single tab 
let g:airline#extensions#tabline#show_buffers = 0
" Display only filename in tab 
let g:airline#extensions#tabline#fnamemod = ':t'
" Don't display encoding 
let g:airline_section_y = ''
" Don't display filetype 
let g:airline_section_x = ''
let g:airline#extensions#tabline#left_sep = '▶'
let g:airline#extensions#tabline#left_alt_sep = '|'


" ----------------------------------------
" TagBar настройки
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 " автофокус на Tagbar при открытии

" ----------------------------------------
" NerdTree настройки
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>
" Disable bookmarks label, and hint about '?' 
let NERDTreeMinimalUI=1
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
" показывать скрытые файды
let NERDTreeShowHidden=1
" закрываем вместе с последним окном
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <C-\> :NERDTreeFind<CR>


" -----------------------------
"  Python-mode
au FileType python map <F8> :PymodeLint<CR>
au FileType python map <F9> :PymodeLintAuto<CR>
" отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
" let g:pymode_rope = 0
" let g:pymode_rope_completion = 0
" let g:pymode_rope_complete_on_dot = 0
" документация
let g:pymode_doc = 0
" let g:pymode_doc_key = 'K'
" проверка кода
let g:pymode_lint = 1
let g:pymode_lint_checker = "pyflakes,pep8"
let g:pymode_lint_ignore="E501,W601,C0110"
" провека кода после сохранения
let g:pymode_lint_on_write = 0
" поддержка virtualenv
let g:pymode_virtualenv = 1
" отключить autofold по коду
let g:pymode_folding = 0
" возможность запускать код
let g:pymode_run = 0

" -----------------------------
"  Syntastic
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages={'level':'warnings'}
au FileType html,htmldjango,php,css,javascript  map <F8> :SyntasticCheck<CR> 

