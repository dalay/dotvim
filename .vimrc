
" Включаем несовместимость настроек с Vi
set nocompatible

" set leaser key
let mapleader=","

" Use 256 colors in vim 
" some plugins not work without it 
set t_Co=256

" Кодировка текста по умолчанию utf8
set termencoding=utf8
set fileencodings=utf-8,cp1251,koi8-r,cp866

" Включить подсветку синтаксиса и задаем цветовую схему по-умолчанию
syntax on
if !empty(glob("$HOME/.vim/colors/jellybeans.vim"))
    colorscheme jellybeans
endif

"  Показывать номера строк
set number

" Поиск в процессе набора
set incsearch

" Подсвечивание результатов поиска
set hlsearch
" убираем выделение найденного по нажатию на пробел.
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>

" умная зависимость от регистра. Детали `:h smartcase`
set ignorecase
set smartcase

" Показывать положение курсора всё время.
set ruler

" Показывать незавершённые команды в статусбаре
set showcmd

" Фолдинг по отсупам
set foldenable
set foldlevel=100
set foldmethod=indent

" Выключаем звуковое оповещение о достижении конца буффера, невозможности действия и т.д.
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=

" Сделать строку команд высотой в одну строку
set ch=1

" Скрывать указатель мыши, когда печатаем
set mousehide

" Включить автоотступы
set autoindent

" Преобразование Таба в пробелы
set expandtab

" Размер табуляции по умолчанию
set shiftwidth=4
set softtabstop=4
set tabstop=4

" Формат строки состояния. Альтернативные варианты настройки `:h statusline`
"set statusline=%&lt;%f%h%m%r\ %b\ %{&amp;encoding}\ 0x\ \ %l,%c%V\ %P
set laststatus=2

" Включаем "умные" отступы, например, авто отступ после `{`
set smartindent

" Отображение парных символов
set showmatch

" Навигация с учетом русских символов, учитывается командами следующее/предыдущее слово и т.п.
set iskeyword=@,48-57,_,192-255

" Подсвечивать линию текста, на которой находится курсор
set cursorline

" Увеличение размера истории
set history=200

" Дополнительная информация в строке состояния
set wildmenu
" set wildmode=list,full

" Настройка отображения специальных символов
set list listchars=tab:→\ ,trail:·

"  при переходе за границу в 80 символов в PHP/Python/js/ подсвечиваем на темном фоне текст
" augroup vimrc_autocmds
"     autocmd!
"     autocmd FileType python,javascript,php highlight Excess ctermbg=DarkGrey guibg=Black
"     autocmd FileType python,javascript,php match Excess /\%80v.*/
" augroup END

" run shell script in shell
au FileType sh,bash map <F8> :!bash %<CR>

" Map ctrl-movement keys to window switching
" map <C-k> <C-w><Up>
" map <C-j> <C-w><Down>
" map <C-l> <C-w><Right>
" map <C-h> <C-w><Left>

" Allow to copy/paste between VIM instances
" "copy the current visual selection to /tmp/.vim_buffer
vmap <Leader>y :w! /tmp/.vim_buffer<CR>
" "copy the current line to the buffer file if no visual selection
nmap <Leader>y :.w! /tmp/.vim_buffer<CR>
" "paste the contents of the buffer file
nmap <Leader>p :r /tmp/.vim_buffer<CR>

" Spell-Checker
set spelllang=ru
nn <F7> :setlocal spell!<CR>
highlight clear SpellBad
highlight SpellBad ctermfg=Red
highlight clear SpellCap
highlight SpellCap ctermfg=Blue
highlight clear SpellLocal
highlight SpellLocal ctermfg=Green

" Turn backup off, since most stuff is in SVN, git et.c anyway...
set nobackup
set nowb
set noswapfile

set keymap=russian-jcukenwin
set iminsert=0
set imsearch=0
set scrolloff=3     " keep 3 lines when scrolling

" Drupal settings
if has("autocmd")
  " Drupal *.module and *.install files.
  augroup module
    autocmd BufRead,BufNewFile *.module set filetype=php
    autocmd BufRead,BufNewFile *.install set filetype=php
    autocmd BufRead,BufNewFile *.test set filetype=php
    autocmd BufRead,BufNewFile *.inc set filetype=php
    autocmd BufRead,BufNewFile *.profile set filetype=php
    autocmd BufRead,BufNewFile *.view set filetype=php
    autocmd FileType php setlocal ts=2 sts=2 sw=2 et
  augroup END
endif

" Omnicomplete
set completeopt-=preview
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType python setlocal omnifunc=pythoncomplete#Complete

" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>

" Включаем перенос строк (set nowrap отключает перенос строк)
set wrap
" Перенос строк по словам, а не по буквам
set linebreak

" Paste mode toggle
set pastetoggle=<F6>


" PLUGINS SETTINGS
if $USER != 'root' && !empty(glob("$HOME/.vim/plugins.vim"))
    source $HOME/.vim/plugins.vim
endif

" Шаблоны для разных типов файлов
autocmd BufNewFile  *.py   0r ~/.vim/templates/python3
autocmd BufNewFile  *.php     0r ~/.vim/templates/php
" Функция для обработка меток в шаблоне
" autocmd BufNewFile  *       call s:format_template()
" function! s:format_template()
"     set report=999

"     let filename = expand('%:t')
"     execute '%s/%vim%filename%/' . filename . '/geI'
"     let header_var = substitute(toupper(filename), '\.', '_', 'ge')
"     execute '%s/%vim%header_var%/' . header_var . '/geI'
"     execute '%s/%vim%year%/\=strftime("%Y")/geI'

"     set report=2
" endfunction
"
autocmd BufRead,BufNewFile *.vim set filetype=vim
