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

"---------=== NerdTreee ===-------------
Plugin 'scrooloose/nerdtree'            " Project and file navigation
" показать NERDTree на F3
map <F3> :NERDTreeToggle<CR>
" Disable bookmarks label, and hint about '?' 
let NERDTreeMinimalUI=1
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
" показывать скрытые файды
let NERDTreeShowHidden=1
" Закрывать после открытия файла
let NERDTreeQuitOnOpen=1
" закрываем вместе с последним окном
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <C-\> :NERDTreeFind<CR>

" ------------- TagBar ---------------------------
Plugin 'majutsushi/tagbar'              " Class/module browser
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 " автофокус на Tagbar при открытии

" "------------------=== Other ===----------------------
"
" --------== Airline ==-------------------
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
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




" "------------------=== QuickRun ===----------------------
Plugin 'thinca/vim-quickrun'
let g:quickrun_config = {
\   "*" : {
\       "outputter/buffer/close_on_empty" : 1,
\       "outputter/buffer/split" : ":rightbelow 40vsp",
\   },
\}
" let g:quickrun_config = {
" \   "_" : {
" \       "outputter" : "message",
" \   },
" \}
" "---------------------------------------------------------

Plugin 'ctrlpvim/ctrlp.vim'

" -----------------------------
"  Syntastic
Plugin 'scrooloose/syntastic'
let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 0
let g:syntastic_check_on_wq = 0
let g:syntastic_quiet_messages={'level':'warnings'}
au FileType python,html,htmldjango,php,css,javascript  map <F8> :SyntasticCheck<CR> 



" ----- Srartify-----------------
Plugin 'mhinz/vim-startify'             " Nice start screen
let g:startify_custom_header = []
map <silent> <leader>s  :Startify<CR>

Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
" Plugin 'tpope/vim-surround'

" ----- Auto Pairs -----------------
Plugin 'jiangmiao/auto-pairs'

" ----- SuperTab -----------------
Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"


" ----- INCLUDES -----------------
if !empty(glob("$HOME/.vim/plugins_python.vim"))
    source $HOME/.vim/plugins_python.vim
endif
if !empty(glob("$HOME/.vim/plugins_php.vim"))
    source $HOME/.vim/plugins_php.vim
endif

call vundle#end()            		" required

filetype on
filetype plugin on
filetype plugin indent on
