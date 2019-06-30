let g:ale_linters = {
\   'javascript': ['eslint'],
\   'typescript': ['tsserver'],
\}

let g:ale_javascript_eslint_executable = 'eslint_d'
let g:ale_lint_on_enter = 0
let g:ale_lint_on_text_changed = 'never'
let g:ale_lint_on_save = 1
" let g:ale_sign_column_always = 1
