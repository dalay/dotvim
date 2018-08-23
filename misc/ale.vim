" ALE SETTINGS
let g:airline#extensions#ale#enabled = 1
nmap <silent> <C-k> <Plug>(ale_previous_wrap)
nmap <silent> <C-j> <Plug>(ale_next_wrap)
let g:ale_set_loclist = 0
let g:ale_set_quickfix = 1
" let g:ale_open_list = 1
" let g:ale_list_window_size = 5
" Set this if you want to.
" This can be useful if you are combining ALE with
" some other plugin which sets quickfix errors, etc.
" let g:ale_keep_list_window_open = 1
let g:ale_lint_on_text_changed = 'never'
" if you don't want linters to run on opening a file
let g:ale_lint_on_enter = 0
" let g:ale_sign_error = 'e'
" let g:ale_sign_warning = 'w'
" let g:ale_echo_msg_error_str = 'E'
" let g:ale_echo_msg_warning_str = 'W'
let g:ale_echo_msg_format = '[%linter%][%severity%][%code%] %s'
let g:ale_linters = {
\   'python': ['python', 'pyflakes', 'pycodestyle'],
\   'php': ['php -l', 'phpcs'],
\   'javascript': ['jshint',],
\   'css': ['csslint',],
\}
" python
let g:ale_python_pycodestyle_options = '--first --ignore=E501'
" javascript
let g:ale_filetype_javascript_jshint_options = '--verbose --config=' . SELF_DIR . '/misc/.jshintrc.json'
" css
let g:ale_filetype_css_csslint_options = '--format=compact --config=' . SELF_DIR . '/misc/.csslintrc.json'
" php
" Друпал - строгие правила.
" let g:ale_filetype_php_phpcs_options = '--standard=Drupal --extensions=php,module,inc,install,test,profile,theme'
" Друпал - правили полегче.
let g:ale_filetype_php_phpcs_options = '--report=csv --standard=' . SELF_DIR . '/misc/phpcs-drupal-ruleset.xml'
