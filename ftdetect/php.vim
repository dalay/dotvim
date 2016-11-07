" Drupal settings
" if has("autocmd")
"   " Drupal *.module and *.install files.
"   augroup module
"     autocmd BufRead,BufNewFile *.module set filetype=php
"     autocmd BufRead,BufNewFile *.install set filetype=php
"     autocmd BufRead,BufNewFile *.test set filetype=php
"     autocmd BufRead,BufNewFile *.inc set filetype=php
"     autocmd BufRead,BufNewFile *.profile set filetype=php
"     autocmd BufRead,BufNewFile *.view set filetype=php
"     autocmd FileType php setlocal ts=2 sts=2 sw=2 et
"   augroup END
" endif
