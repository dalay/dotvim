" Включить подсветку синтаксиса и задаем цветовую схему по-умолчанию
syntax on
colorscheme jellybeans
" Включаем несовместимость настроек с Vi
set nocompatible
" Use 256 colors in vim 
" some plugins not work without it 
set t_Co=256
set background=dark
" Кодировка текста по умолчанию utf8
set termencoding=utf8
set fileencodings=utf-8,cp1251,koi8-r,cp866

"  Показывать номера строк
set number

" Поиск в процессе набора
set incsearch

" Подсвечивание результатов поиска
set hlsearch

" умная зависимость от регистра. Детали `:h smartcase`
set ignorecase
set smartcase

" Показывать положение курсора всё время.
set ruler

" Показывать незавершённые команды в статусбаре
set showcmd

" Old: Фолдинг по отсупам
" set foldenable
" set foldlevel=1
" set foldmethod=indent

"=============НАСТРОЙКИ СВОРАЧИВАНИЯ БЛОКОВ КОДА (фолдинг)=============
" set foldenable " отклключить фолдинг по умолчанию
" set foldmethod=syntax " определять блоки на основе синтаксиса файла
" set foldmethod=indent " определять блоки на основе отступов
" set foldnestmax=3       "deepest fold is 3 levels
" set foldcolumn=10 " показать полосу для управления сворачиванием
" set foldlevel=1 " Первый уровень вложенности открыт, остальные закрыты
" set foldopen=all " автоматическое открытие сверток при заходе в них

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
" set laststatus=2
" set statusline=
" Broken down into easily includeable segments
" set statusline+=%<%f\ " Filename
" set statusline+=%w%h%m%r " Options
" set statusline+=\ [%{&ff}/%Y] " filetype
" set statusline+=\ [%{getcwd()}] " current dir

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
 augroup vimrc_autocmds
     autocmd!
     autocmd FileType python,javascript,php highlight Excess ctermbg=DarkGrey guibg=Black
     autocmd FileType python,javascript,php match Excess /\%80v.*/
 augroup END



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
" highlight lCursor guifg=NONE guibg=Cyan

" само пересчитывает vimrc при сохранении оного
" autocmd! bufwritepost ~/.vimrc execute "normal! :source ~/.vimrc"

set scrolloff=3     " keep 3 lines when scrolling

" Omnicomplete
set completeopt-=preview
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
" autocmd FileType python setlocal omnifunc=pythoncomplete#Complete


" Включаем перенос строк (set nowrap отключает перенос строк)
set wrap
" Перенос строк по словам, а не по буквам
set linebreak

" Paste mode toggle
set pastetoggle=<F2>

" Шаблоны для разных типов файлов
autocmd BufNewFile  *.py   0r ~/.vim/templates/python3 | 4
autocmd BufNewFile  *.php     0r ~/.vim/templates/php | 3

" Переход в папку файла
set browsedir=current

" Фикс для использования русской раскладки в командном режиме
set langmap=ёйцукенгшщзхъфывапролджэячсмитьбюЁЙЦУКЕHГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ;`qwertyuiop[]asdfghjkl\\;'zxcvbnm\\,.~QWERTYUIOP{}ASDFGHJKL:\\"ZXCVBNM<>

" При редактировании файла всегда переходить на последнюю известную
"позицию курсора. Если позиция ошибочная - не переходим.
autocmd BufReadPost *
 \ if line("'\"") > 0 && line("'\"") <= line("$") |
  \   exe "normal! g`\"" |
  \ endif



" обнуление задержки для клавиши Esc
set ttimeout ttimeoutlen=0 notimeout

" nice wrapping for long lines with respect of
" starging indent
" set breakindent

" отключение перерисовки при выполнении макросов, повышает производительность
set lazyredraw

" YAML filetype
au FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

au BufNewFile,BufRead *.html,*.j2 set filetype=htmldjango

" Включаем проверку правописания при сохранении текстового файла.
" au BufWrite *.txt set spell spelllang=ru

" Автоматически включаем режим ввода, если файл пуст. Функция описана в functions.vim
" au VimEnter * call InsertIfEmpty()

" KEYMAPS
nnoremap Q <Nop>
" set leaser key
let mapleader=","
" Map Y to act like D and C, i.e. to yank until EOL, rather than act as yy,
" which is the default
map Y y$
" Открыть файл в Fierefox.
nnoremap <C-F12> :exe ':silent !firefox %'<CR>
" Disable arrow keys
noremap <Up> <Nop>
noremap <Down> <Nop>
noremap <Left> <Nop>
noremap <Right> <Nop>
" убираем выделение найденного по нажатию на пробел.
nnoremap <silent> <Space> :nohl<Bar>:echo<CR>
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
" move among buffers with gb and gB, like tab gt and gT
map gb :bnext<CR>
map gB :bprev<CR>
" Новая вкладка
nmap t :tabnew<CR>
" Закрыть вкладку
nmap <C-x> :tabclose<CR>
" This will remap the "+y (copy) and "+p (paste) commands to use xclip.
" vmap "+y :!xclip -f -sel clip<CR>
" map "+p :r!xclip -o -sel clip<CR>

" PLUGINS 
source $HOME/.vim/plugins.vim
