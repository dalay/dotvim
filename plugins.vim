" Autoistall Vim-Plug
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

"=====================================================
" Vim-Plug settings
"=====================================================

call plug#begin('~/.vim/plugged')


" NerdTreee 
Plug 'scrooloose/nerdtree'            " Project and file navigation
" показать NERDTree на ...
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

" TagBar
Plug 'majutsushi/tagbar'              " Class/module browser
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 " автофокус на Tagbar при открытии

Plug 'terryma/vim-multiple-cursors'

" QuickRun
Plug 'thinca/vim-quickrun'
let g:quickrun_config = {
\   "*" : {
\       "outputter/buffer/close_on_empty" : 1,
\       "outputter/buffer/split" : ":rightbelow 40vsp",
\   },
\}

" NeoMake
Plug 'neomake/neomake'                "Syntastic alternative
augroup neomake_lints
    autocmd!
    autocmd BufWritePost * Neomake
augroup END
" let g:neomake_logfile = '/tmp/neomake.log'
let g:neomake_python_enabled_makers = ['pyflakes', 'pylint']
let g:neomake_open_list = 2
let g:neomake_list_height = 5
let g:neomake_echo_current_error=1
let g:neomake_python_pylint_args = [
        \ '--rcfile=' . expand("<sfile>:p:h") . '/misc/pylintrc',
        \ '--load-plugins=pylint_django',
        \ '--disable=django-not-available', 
        \ '--ignored-classes=Manager,File,TreeForeignKey',
        \ '--output-format=text',
        \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"',
        \ '--reports=no',
        \ '--disable=C,W,R0901,R0201',
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

" Srartify
Plug 'mhinz/vim-startify'             " Nice start screen
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

" Vim-Commentary
Plug 'tpope/vim-commentary'
autocmd FileType nginx setlocal commentstring=#\ %s
autocmd FileType php setlocal commentstring=//\ %s

Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'

" SuperTab
Plug 'ervandew/supertab'
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" EasyMotion
Plug 'easymotion/vim-easymotion'
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
" " Move to word
" map  <Leader>w <Plug>(easymotion-bd-w)
" nmap <Leader>w <Plug>(easymotion-overwin-w)

"" ctrlp
Plug 'ctrlpvim/ctrlp.vim'
let g:ctrlp_map = '<c-p>'          " открываем нажатием Ctrl+P
let g:ctrlp_cmd = 'CtrlPBuffer'    " показывать список буферов по-умолчанию

" Peekaboo extends " and @ in normal mode and <CTRL-R> in insert mode so you
" can see the contents of the registers."
Plug 'junegunn/vim-peekaboo'

" AIRLINE
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
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
let g:airline#extensions#tabline#left_alt_sep = '/'
" если файл с уникальным именем - показывается только имя, если встречается файл с таким же именем, отображается также и директория
let g:airline#extensions#tabline#formatter = 'unique_tail'
" убираем "X" для закрытия вкладки мышью (мышью!?)
let g:airline#extensions#tabline#show_close_button = 0
" отключаем tagbar
" let g:airline#extensions#tagbar#enabled = 0
" показывать номер вкладки
let g:airline#extensions#tabline#show_tab_nr = 1
" показывать только номер вкладки
let g:airline#extensions#tabline#tab_nr_type = 1


" lightline
" Plug 'itchyny/lightline.vim'
" let g:lightline = {
"     \ 'colorscheme': 'dalay',
"     \ 'component': {
"     \   'readonly': '%{&readonly?"RO":"W"}',
"     \   'modified': '%{&modified?"+":""}',
"     \ },
"     \ 'component_function': {
"     \   'cwd': 'CwdFunc',
"     \   'fsz': 'FileSize',
"     \ },
"     \ 'active': {
"     \   'left':  [ ['mode', 'paste'], ['readonly'], ['cwd'] ],
"     \   'right': [ ['percent'], ['fileformat'], ['fileencoding'], ['fsz'], ['filetype'], ['filename'], ['modified'] ]
"     \ },
"     \ 'inactive': {
"     \   'left':  [ ['mode', 'paste'], ['readonly'], ['cwd'] ],
"     \   'right': [ ['percent'], ['fileformat'], ['fileencoding'], ['fsz'], ['filetype'], ['filename'], ['modified'] ]
"     \ },
"     \ 'separator':    { 'left': '',  'right': ''  },
"     \ 'subseparator': { 'left': '|', 'right': '|' },
"     \ 'tabline': {
"             \ 'left': [ [ 'tabs' ] ],
"             \ 'middle': [ [ '' ] ] ,
"             \ 'right': [ [ '' ] ] },
"     \ }

" function! CwdFunc()
"     let cwd = substitute(getcwd(), expand($HOME), '~', '')
"     return cwd
" endfunction
" function! FileSize()
"     let bytes = getfsize(expand("%:p"))
"     if bytes <= 0
"         return ""
"     endif
"     if bytes < 1024
"         return bytes
"     elseif bytes > (1024*1024)
"         return (bytes / (1024*1024)) . "Mb"
"     else
"         return (bytes / 1024) . "K"
"     endif
" endfunction


" Plug 'edkolev/tmuxline.vim'

" SYNTAX HIGHLIGHTING

Plug 'evanmiller/nginx-vim-syntax'
Plug 'dzeban/vim-log-syntax'

" PHP 

" php-documentor
Plug 'liulipeng/PDV--phpDocumentor-for-Vim'
au FileType php nnoremap <leader><leader>p :call PhpDoc()<CR> 

" ANSIBLE
" Plug 'chase/vim-ansible-yaml'
" Plug 'pearofducks/ansible-vim'
" let g:ansible_options = {'ignore_blank_lines': 0}

" PYTHON

" Jedi-Vim
Plug 'davidhalter/jedi-vim' "  highlighting, run and ipdb and more)
let g:jedi#rename_command = ''
" Jedi automatically starts the completion, if you type a dot, e.g. str., if you don't want this:
let g:jedi#popup_on_dot = 0
" Jedi selects the first line of the completion menu: for a better typing-flow and usually saves one keypress.
let g:jedi#popup_select_first = 0


Plug 'othree/html5.vim'


" Autoformat 
Plug 'Chiel92/vim-autoformat'
let g_autoformat_verbosemode=1
nmap <F8> :Autoformat<CR>:w<CR>

call plug#end()
