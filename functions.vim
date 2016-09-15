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
