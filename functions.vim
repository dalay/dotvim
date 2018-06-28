" Vim подерживает синтаксис джанго-шаблонов и подсвечивает их, если задать
" файлу тип htmldjango. К сожалению автоматически при открытии Vim определяет
" этот тип только если в начале файла находится джанго-тэг. Решить это можно
" например с помощью такой функции.
" которую нужно запускать при открытии файла с раширением .html:
" autocmd BufNewFile,BufRead *.html call DetectTemplate()
fun! DetectTemplate()
    let n = 1
    while n < line("$")
        if getline(n) =~ '{%' || getline(n) =~ '{{'
            set ft=htmldjango
            return
        endif
        let n = n + 1
    endwhile
    set ft=html "default html
endfun"'}}}'

" Открывает файл в insert-режиме, если он(файл) пустой.
function InsertIfEmpty()
    if @% == ""
        " No filename for current buffer
        startinsert
    elseif filereadable(@%) == 0
        " File doesn't exist yet
        startinsert
    elseif line('$') == 1 && col('$') == 1
        " File is empty
        startinsert
    endif
endfunction

" Less compile (with lessc)
autocmd FileWritePost,BufWritePost *.less :call LessCSSCompile()
function! LessCSSCompile()
  let cwd = expand('<afile>:p:h')
  let name = expand('<afile>:t:r')
  if (executable('lessc'))
    cal system('lessc '.cwd.'/'.name.'.less > '.cwd.'/'.name.'.css &')
  elseif (executable('lesscpy'))
    cal system('lesscpy '.cwd.'/'.name.'.less > '.cwd.'/'.name.'.css &')
  endif
endfunction
