" Autoistall Vim-Plug
" if empty(glob('~/.vim/autoload/plug.vim'))
"   silent !curl -fLo ~/.vim/autoload/plug.vim --create-dirs
"     \ https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
"   autocmd VimEnter * PlugInstall --sync | source $MYVIMRC
" endif

"=====================================================
" Vim-Plug settings
"=====================================================
" let g:plug_window='tabnew'
" let g:plug_window='tabnew'
let g:plug_window='enew'
call plug#begin('~/.vim/plugged')

" COMMON
Plug 'scrooloose/nerdtree', {'on': ['NERDTreeToggle', 'NERDTreeFind']}
Plug 'majutsushi/tagbar', {'on': 'TagbarToggle'}
Plug 'terryma/vim-multiple-cursors'
Plug 'thinca/vim-quickrun'
Plug 'neomake/neomake'                "Syntastic alternative
Plug 'Chiel92/vim-autoformat', {'on': 'Autoformat'}
Plug 'mhinz/vim-startify'             " Nice start screen
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'jiangmiao/auto-pairs'
Plug 'ervandew/supertab'
Plug 'easymotion/vim-easymotion'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/vim-peekaboo'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
" Plug 'edkolev/tmuxline.vim'
" PYTHON
Plug 'davidhalter/jedi-vim', { 'for': 'python' }
" PHP
Plug 'sumpygump/php-documentor-vim', { 'for': 'php' }
" HTML
Plug 'othree/html5.vim', { 'for': ['html', 'htmldjango'] }
" SYNTAX
Plug 'chr4/nginx.vim', {'for': 'nginx'}
Plug 'dzeban/vim-log-syntax', { 'for': 'log' }


call plug#end()

" NerdTreee 
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
map <F4> :TagbarToggle<CR>
let g:tagbar_autofocus = 1 " автофокус на Tagbar при открытии
" сортировать в том порядке, в котором тег появляется в коде, а не по имени
let g:tagbar_sort = 0


" QuickRun
let g:quickrun_config = {
\   "*" : {
\       "outputter/buffer/close_on_empty" : 1,
\       "outputter/buffer/split" : ":rightbelow 40vsp",
\   },
\}

" NeoMake
augroup neomake_lints
    autocmd!
    autocmd BufWritePost python,php,js Neomake
augroup END
let g:neomake_logfile = '/tmp/neomake.log'
let self_dir = expand("<sfile>:p:h")
" neomake: python
let g:neomake_python_enabled_makers = ['pyflakes', 'pylint']
let g:neomake_open_list = 2
let g:neomake_list_height = 5
let g:neomake_echo_current_error=1
let g:neomake_python_pylint_args = [
        \ '--rcfile=' . self_dir . '/misc/.pylintrc',
        \ '--load-plugins=pylint_django',
        \ '--disable=django-not-available', 
        \ '--ignored-classes=Manager,File,TreeForeignKey',
        \ '--output-format=text',
        \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"',
        \ '--reports=no',
        \ '--disable=C,W,R0901,R0201',
        \ ]
" neomake: javascript
let g:neomake_javascript_jshint_args = [
        \ '--config=' . self_dir . '/misc/.jshintrc',
        \ ]
" neomake: css
let g:neomake_css_enabled_markers = ['csslint']
let g:neomake_css_csslint_args = [
                    \ '--format=compact',
                    \ '--config=' . self_dir . '/misc/.csslintrc',
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
autocmd FileType nginx setlocal commentstring=#\ %s
autocmd FileType php setlocal commentstring=//\ %s

" SuperTab
let g:SuperTabDefaultCompletionType = "<c-x><c-o>"

" EasyMotion
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

"" CTRLP
" По умолчанию, CtrlP ищет файлы по их полному пути, что мне показалось странным, поскольку на запрос "repo", имея следующую структуру файлов:
" project/src/Repository/Repository.php
" project/src/Repository/Foo.php
" CtrlP может придать больший вес файлу Foo.php. К счастью, CtrlP, как и многие другие плагины для vim'a, имеет гибкую настройку. Для решения проблемы нужно прописать
let g:ctrlp_by_filename = 1
" откуда начинать поиск. w - ближайшая директория, которая содержит признаки наличия CVS (.git, .svn). r - текущая директория (pwd).
let g:ctrlp_working_path_mode = 'wr'
let g:ctrlp_map = '<c-p>'          " открываем нажатием Ctrl+P
let g:ctrlp_cmd = 'CtrlPBuffer'    " показывать список буферов по-умолчанию

" AIRLINE
set laststatus=2
set linespace=0
set noshowmode
let g:airline_theme = 'jellybeans'
" Set custom left separator 
" let g:airline_left_sep = '▶'
let g:airline_left_sep = '≡'
" Set custom right separator 
" let g:airline_right_sep = '◀'
let g:airline_right_sep = '≡'
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

" PHP 
" PHP-DOCUMENTOR
au FileType php nnoremap <leader><leader>p :call PhpDoc()<CR> 
let g:pdv_cfg_Author = 'Dalay <dalay@drupalka.ru>'
let g:pdv_cfg_ClassTags = ["author"]

" ANSIBLE
" let g:ansible_options = {'ignore_blank_lines': 0}

" PYTHON
" JEDI-VIM
let g:jedi#rename_command = ''
" Jedi automatically starts the completion, if you type a dot, e.g. str., if you don't want this:
let g:jedi#popup_on_dot = 0
" Jedi selects the first line of the completion menu: for a better typing-flow and usually saves one keypress.
let g:jedi#popup_select_first = 0

" AUTOFORMAT
let g_autoformat_verbosemode=1
nmap <F8> :Autoformat<CR>:w<CR>
" VIM-PEEKABOO
let g:peekaboo_compact = 1
