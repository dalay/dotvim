" NEOMAKE SETTINGS
" let g:neomake_verbose = 0
" let g:neomake_logfile = '/tmp/neomake.log'
autocmd BufWritePost * Neomake

let g:neomake_open_list = 2
let g:neomake_list_height = 5
let g:neomake_echo_current_error=1

" neomake: python
" let g:neomake_python_enabled_makers = ['pyflakes', 'pylint']
let g:neomake_python_enabled_makers = ['python', 'pyflakes', 'pycodestyle']
let g:neomake_python_pycodestyle_args = ['--first', '--ignore=E501']
let g:neomake_python_pylint_args = [
        \ '--rcfile=' . SELF_DIR . '/misc/.pylintrc',
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
        \ '--config=' . SELF_DIR . '/misc/.jshintrc.json',
        \ ]

" neomake: css
let g:neomake_css_enabled_markers = ['csslint']
let g:neomake_css_csslint_args = [
                    \ '--format=compact',
                    \ '--config=' . SELF_DIR . '/misc/.csslintrc.json',
        \ ]

" neomake: php
" " Друпал - строгие правила.
" let g:neomake_php_phpcs_args = [
"             \ '--standard=Drupal',
"             \ '--extensions=php,module,inc,install,test,profile,theme',
"             \]
" Друпал - правили полегче.
let g:neomake_php_enabled_markers = ['php']
" let g:neomake_php_phpcs_args = [
"             \ '--extensions=php,module,inc,install,test,profile,theme',
"             \ '--standard=' . SELF_DIR . '/misc/phpcs-drupal-ruleset.xml',
"             \ ]
" neomake: shell
let g:neomake_sh_shellcheck_args = [
        \ '-fgcc',
        \ '--exclude=2006,2181',
        \ ]
