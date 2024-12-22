" NEOMAKE SETTINGS
" let g:neomake_verbose = 0
" let g:neomake_logfile = '/tmp/neomake.log'
autocmd BufWritePost * Neomake

let g:neomake_open_list = 2
let g:neomake_list_height = 5
let g:neomake_echo_current_error=1

" neomake: python
let g:neomake_python_exe = 'python3'

let py_makers = ['python']
if executable('flake8')
    call add(py_makers, 'flake8')
    let g:neomake_python_flake8_args = ['--config=' . SELF_DIR . '/misc/.flake8']
endif
if executable('mypy')
    call add(py_makers, 'mypy')
    let g:neomake_python_mypy_args = ['--check-untyped-defs', '--ignore-missing-imports', '--disable-error-code=var-annotated', '--no-warn-no-return']
endif

let g:neomake_python_enabled_makers = py_makers

" let g:neomake_python_flake8_args = ['--config=' . SELF_DIR . '/misc/.flake8']
" let g:neomake_python_pycodestyle_args = ['--first', '--ignore=E501,E402']
" let g:neomake_python_pylint_args = [
"         \ '--rcfile=' . SELF_DIR . '/misc/.pylintrc',
"         \ '--load-plugins=pylint_django',
"         \ '--disable=django-not-available',
"         \ '--ignored-classes=Manager,File,TreeForeignKey',
"         \ '--output-format=text',
"         \ '--msg-template="{path}:{line}:{column}:{C}: [{symbol}] {msg} [{msg_id}]"',
"         \ '--reports=no',
"         \ '--disable=C,W,R0901,R0201',
"         \ ]

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

" neomake: shell
let g:neomake_sh_shellcheck_args = [
            \ '-fgcc',
            \ '--exclude=2006,2181,1117',
            \ ]

" let g:neomake_go_go_args = ['test']
