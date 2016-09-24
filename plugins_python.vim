" --- Python ---
if has('python')
    " Plugin 'klen/python-mode'	        " Python mode (docs, refactor, lints
    " let g:pymode_rope_lookup_project = 0
    "  Python-mode
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

    "  highlighting, run and ipdb and more)
    Plugin 'davidhalter/jedi-vim'
    let g:jedi#rename_command = ''
endif


