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
Plugin 'scrooloose/nerdtree'            " Project and file navigation
Plugin 'majutsushi/tagbar'              " Class/module browser
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
Plugin 'thinca/vim-quickrun'
" Plugin 'ctrlpvim/ctrlp.vim'
Plugin 'scrooloose/syntastic'
Plugin 'mhinz/vim-startify'             " Nice start screen
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ervandew/supertab'
Plugin 'davidhalter/jedi-vim' "  highlighting, run and ipdb and more)
Plugin 'easymotion/vim-easymotion'
Plugin 'sumpygump/php-documentor-vim'
Plugin 'nginx.vim'
Plugin 'dzeban/vim-log-syntax'

" Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints
call vundle#end()            		" required

filetype plugin indent on

"---------=== NerdTreee ===-------------
" показать NERDTree на ...
" map <leader><leader> :NERDTreeToggle<CR>
map <F3> :NERDTreeToggle<CR>
" автоматически обновлять буфер после переименовывания файла
let NERDTreeAutoDeleteBuffer = 1
" Disable bookmarks label, and hint about '?' 
let NERDTreeMinimalUI=1
"игноррируемые файлы с расширениями
let NERDTreeIgnore=['^\.git$', '\~$', '\.pyc$', '\.pyo$', '\.class$', 'pip-log\.txt$', '\.o$']
" показывать скрытые файды
let NERDTreeShowHidden=1
" Закрывать после открытия файла
let NERDTreeQuitOnOpen=1
" закрываем вместе с последним окном
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif
nmap <C-\> :NERDTreeFind<CR>

" ------------- TagBar ---------------------------
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 " автофокус на Tagbar при открытии


" --------== Airline ==-------------------
" let g:airline_theme = 'jellybeans'
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
" если файл с уникальным именем - показывается только имя, если встречается файл с таким же именем, отображается также и директория
let g:airline#extensions#tabline#formatter = 'unique_tail'
" убираем "X" для закрытия вкладки мышью (мышью!?)
let g:airline#extensions#tabline#show_close_button = 0
" отключаем tagbar
let g:airline#extensions#tagbar#enabled = 0
" показывать номер вкладки
let g:airline#extensions#tabline#show_tab_nr = 1
" показывать только номер вкладки
let g:airline#extensions#tabline#tab_nr_type = 1


" "------------------=== QuickRun ===----------------------
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


"------------  Syntastic ----------------------
" let g:syntastic_mode_map = { 'mode': 'passive', 'active_filetypes':   [],'passive_filetypes': [] }
set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*
let g:syntastic_always_populate_loc_list = 1
let g:syntastic_auto_loc_list = 1
" Automatic checks at open and save
let g:syntastic_check_on_open = 0
" let g:syntastic_check_on_wq = 0
" let g:syntastic_check_on_w = 0
let g:syntastic_quiet_messages={'level':'warnings'}
let g:syntastic_loc_list_height = 5
au FileType python,html,htmldjango,php,css,javascript  map <F8> :SyntasticCheck<CR> 


" ----- Srartify-----------------
let g:startify_bookmarks = ['~/.vimrc', '~/.vim/plugins.vim']
let g:startify_change_to_vcs_root = 1
" let g:startify_session_persistence = 1
let g:startify_custom_header = []
map <silent> <leader>s  :Startify<CR>

" ----- SuperTab -----------------
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"


" ------------- Python-mode ---------------------
    " let g:pymode_rope_lookup_project = 0
    " au FileType python map <F8> :PymodeLint<CR>
    " au FileType python map <F9> :PymodeLintAuto<CR>
    " " отключаем автокомплит по коду (у нас вместо него используется jedi-vim)
    " " let g:pymode_rope = 0
    " " let g:pymode_rope_completion = 0
    " " let g:pymode_rope_complete_on_dot = 0
    " " документация
    " let g:pymode_doc = 0
    " " let g:pymode_doc_key = 'K'
    " " проверка кода
    " let g:pymode_lint = 1
    " let g:pymode_lint_checker = "pyflakes,pep8"
    " let g:pymode_lint_ignore="E501,W601,C0110"
    " " провека кода после сохранения
    " let g:pymode_lint_on_write = 0
    " " поддержка virtualenv
    " let g:pymode_virtualenv = 1
    " " отключить autofold по коду
    " let g:pymode_folding = 0
    " " возможность запускать код
    " let g:pymode_run = 0

" ------------- Jedi-Vim  ---------------------
    let g:jedi#rename_command = ''

" " ------------- EasyMotion  ---------------------
" " <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" " s{char}{char} to move to {char}{char}
" " nmap s <Plug>(easymotion-overwin-f2)

" " Move to line
" map <Leader>L <Plug>(easymotion-bd-jk)
" nmap <Leader>L <Plug>(easymotion-overwin-line)

" " Move to word
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

" ========== sumpygump/php-documentor-vim =========
au FileType php inoremap <buffer> <C-P> :call PhpDoc()<CR>
au FileType php nnoremap <buffer> <C-P> :call PhpDoc()<CR>
au FileType php vnoremap <buffer> <C-P> :call PhpDocRange()<CR>
let g:pdv_cfg_Author = 'Dalay <dalay@drupalka.ru>'
let g:pdv_cfg_ClassTags = []

"========== Vim-Commentary ==============
autocmd FileType nginx setlocal commentstring=#\ %s
