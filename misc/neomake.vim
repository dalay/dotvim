" NEOMAKE SETTINGS
" let g:neomake_verbose = 0
" let g:neomake_logfile = '/tmp/neomake.log'
augroup neomake_lints
    autocmd!
    " autocmd BufWritePost *.py,*.php,*.js,*.css Neomake
    autocmd BufWritePost * Neomake
augroup END
let self_dir = expand("<sfile>:p:h")
" neomake: python
" let g:neomake_python_enabled_makers = ['pyflakes', 'pylint']
let g:neomake_python_enabled_makers = ['python', 'pyflakes', 'pycodestyle']
let g:neomake_open_list = 2
let g:neomake_list_height = 5
let g:neomake_echo_current_error=1
let g:neomake_python_pycodestyle_args = ['--first', '--ignore=E501']
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
        \ '--verbose',
        \ '--config=' . self_dir . '/misc/.jshintrc.json',
        \ ]
" neomake: css
let g:neomake_css_enabled_markers = ['csslint']
let g:neomake_css_csslint_args = [
                    \ '--format=compact',
                    \ '--config=' . self_dir . '/misc/.csslintrc.json',
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
