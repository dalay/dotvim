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

" COMMON
Plugin 'nanotech/jellybeans.vim'
Plugin 'scrooloose/nerdtree'            " Project and file navigation
Plugin 'majutsushi/tagbar'              " Class/module browser
Plugin 'thinca/vim-quickrun'
Plugin 'neomake/neomake' "Syntastic alternative
Plugin 'mhinz/vim-startify'             " Nice start screen
Plugin 'tpope/vim-commentary'
Plugin 'tpope/vim-repeat'
Plugin 'tpope/vim-surround'
Plugin 'jiangmiao/auto-pairs'
Plugin 'ervandew/supertab'
Plugin 'easymotion/vim-easymotion'
" Peekaboo extends " and @ in normal mode and <CTRL-R> in insert mode so you
" can see the contents of the registers."
Plugin 'junegunn/vim-peekaboo'

" AIRLINE
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" Plugin 'itchyny/lightline.vim'
Plugin 'edkolev/tmuxline.vim'

" SYNTAX HIGHLIGHTING
Plugin 'evanmiller/nginx-vim-syntax'
Plugin 'dzeban/vim-log-syntax'

" PHP 
Plugin 'sumpygump/php-documentor-vim'
" Plugin 'git://drupalcode.org/project/vimrc.git', {'rtp': 'bundle/vim-plugin-for-drupal/'}

" ANSIBLE
" Plugin 'chase/vim-ansible-yaml'
" Plugin 'pearofducks/ansible-vim'

" PYTHON
Plugin 'davidhalter/jedi-vim' "  highlighting, run and ipdb and more)
" Plugin 'jmcantrell/vim-virtualenv'
Plugin 'othree/html5.vim'

Plugin 'tell-k/vim-autopep8'

call vundle#end()                   " required

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



" == Airline ==-------------------
set laststatus=2
set linespace=0
set noshowmode
let g:airline_theme = 'jellybeans'
" Set custom left separator 
let g:airline_left_sep = '▶'
" Set custom right separator 
let g:airline_right_sep = '◀'
" Enable airline for tab-bar 
let g:airline#extensions#tabline#enabled = 1
" Don't display buffers in tab-bar with single tab 
let g:airline#extensions#tabline#show_buffers = 0
let g:airline#extensions#keymap#enabled = 0
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


" ----- Srartify-----------------
map <silent> <leader>s  :Startify<CR>
let g:startify_bookmarks = ['~/.bashrc', '~/.vimrc', '~/.vim/plugins.vim', '~/scripts/']
let g:startify_change_to_vcs_root = 1
let g:startify_custom_header = []
let g:startify_list_order = [
\ ['   Recent Files'],
\ 'files',
\ ['   Sessions'],
\ 'sessions',
\ ['   Bookmarks'],
\ 'bookmarks',
\ ]
let g:startify_files_number = 7

let g:startify_enable_special         = 0
let g:startify_relative_path          = 1
let g:startify_change_to_dir          = 1

let g:startify_session_autoload       = 1
let g:startify_session_persistence    = 1
let g:startify_session_delete_buffers = 1
let g:startify_session_dir = '~/.vim/session'
 

" ----- SuperTab -----------------
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"



" ------------- Jedi-Vim  ---------------------
    let g:jedi#rename_command = ''

" " ------------- EasyMotion  ---------------------
" отключаем зависимость от регистра
let g:EasyMotion_smartcase = 1
" отключаем тень (в момент выбора цели весь текст помечается как комментарий)
let g:EasyMotion_do_shade = 0
" какой группой подсвечивать цели
" hi link EasyMotionTarget Search

" " <Leader>f{char} to move to {char}
" map  <Leader>f <Plug>(easymotion-bd-f)
" nmap <Leader>f <Plug>(easymotion-overwin-f)

" " s{char}{char} to move to {char}{char}
" " nmap s <Plug>(easymotion-overwin-f2)

" " Move to line
map <Leader><Leader>l <Plug>(easymotion-bd-jk)
nmap <Leader><Leader>l <Plug>(easymotion-overwin-line)
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

"========== Jellybeans Theme  ==============
" let g:jellybeans_use_term_italics = 1

"========== Ansible ==============
let g:ansible_options = {'ignore_blank_lines': 0}

"========== AutoPep8 ==============
" Disable show diff window
let g:autopep8_disable_show_diff=1


"========== NeoMake ==============
augroup neomake_lints
    autocmd!
    autocmd BufWritePost * Neomake
augroup END
" let g:neomake_logfile = '/tmp/neomake.log'
" let g:neomake_python_enabled_makers = ['pylint']
" set statusline+=\ %#ErrorMsg#%{neomake#statusline#QflistStatus('qf:\ ')}
let g:neomake_python_enabled_makers = ['pyflakes', 'pylint']
let g:neomake_open_list = 2
let g:neomake_list_height = 5
let g:neomake_echo_current_error=1
let g:neomake_python_pylint_args = [
        \ '--rcfile=' . expand("<sfile>:p:h") . '/misc/pylintrc',
        \ '--load-plugins=pylint_django',
        \ '--disable=django-not-available', 
        \ '--ignored-classes=Manager,File',
        \ '--output-format=text',
        \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"',
        \ '--reports=no',
        \ '--disable=C,W,R0901',
        \ ]
" " Друпал - строгие правила.
" let g:neomake_php_phpcs_args = [
"             \ '--standard=Drupal',
"             \ '--extensions=php,module,inc,install,test,profile,theme',
"             \]
" Друпал - правили полегче.
let g:neomake_php_phpcs_args = [
            \ '--report=csv',
            \ '--standard='.expand("<sfile>:p:h").'/.vim/misc/phpcs-drupal-ruleset.xml',
            \ ]


" -+- lightline -------------

let g:lightline = {
    \ 'colorscheme': 'dalay',
    \ 'component': {
    \   'readonly': '%{&readonly?"RO":"W"}',
    \   'modified': '%{&modified?"+":""}',
    \ },
    \ 'component_function': {
    \   'cwd': 'CwdFunc',
    \   'fsz': 'FileSize',
    \ },
    \ 'active': {
    \   'left':  [ ['mode', 'paste'], ['readonly'], ['cwd'] ],
    \   'right': [ ['percent'], ['fileformat'], ['fileencoding'], ['fsz'], ['filetype'], ['filename'], ['modified'] ]
    \ },
    \ 'inactive': {
    \   'left':  [ ['mode', 'paste'], ['readonly'], ['cwd'] ],
    \   'right': [ ['percent'], ['fileformat'], ['fileencoding'], ['fsz'], ['filetype'], ['filename'], ['modified'] ]
    \ },
    \ 'separator':    { 'left': '',  'right': ''  },
    \ 'subseparator': { 'left': '|', 'right': '|' },
    \ 'tabline': {
            \ 'left': [ [ 'tabs' ] ],
            \ 'middle': [ [ '' ] ] ,
            \ 'right': [ [ '' ] ] },
    \ }

function! CwdFunc()
    let cwd = substitute(getcwd(), expand($HOME), '~', '')
    return cwd
endfunction

function! FileSize()
    let bytes = getfsize(expand("%:p"))
    if bytes <= 0
        return ""
    endif
    if bytes < 1024
        return bytes
    elseif bytes > (1024*1024)
        return (bytes / (1024*1024)) . "Mb"
    else
        return (bytes / 1024) . "K"
    endif
endfunction
" ---------------------------
