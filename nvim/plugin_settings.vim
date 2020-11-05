let g:loaded_python_provider = 0 " disable python2
let g:python3_host_prog = '/home/jakub/.pyenv/versions/3.7.7/envs/nvim3.7/bin/python'
let g:ruby_host_prog = '/home/jakub/.rbenv/versions/2.6.2/bin/neovim-ruby-host'

let g:highlightedyank_highlight_duration = 300

let g:sort_motion_flags = "ui"

let g:neoterm_default_mod = 'vertical'
let g:neoterm_repl_ruby = 'pry'

let g:elm_format_autosave = 1

" disable dispatch mappings, as they conflict with vim-signature
let g:dispatch_no_maps = 1

let test#strategy      = 'dispatch'
let test#python#runner = 'pytest'

let g:NERDTreeIgnore = ['\.bst$','\.dia$','\.eps$','\.pdf$','\~$','\.pyc$','^__pycache__$']
let g:NERDTreeWinSize = 50
let g:NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = ''

let g:UltiSnipsExpandTrigger="<c-space>"
let g:UltiSnipsJumpForwardTrigger="<c-f>"
let g:UltiSnipsJumpBackwardTrigger="<c-b>"
let g:UltiSnipsSnippetsDir="~/.vim/snippets"
let g:UltiSnipsEditSplit="vertical"

" let g:deoplete#enable_at_startup = 1

" let g:lightline = { 'colorscheme': 'one' }

let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'cocstatus': 'coc#status'
      \ },
      \ }

let g:VimuxHeight = "50"
let g:VimuxOrientation = "h"
let g:VimuxPromptString = "> "

" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

let g:ycm_python_binary_path = '/home/jakub/.pyenv/versions/ycm3.8/bin/python'
" let g:ycm_python_binary_path = 'python'
" let g:ycm_complete_in_comments = 1
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_filepath_completion_use_working_dir = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_semantic_triggers = { 'elm' : ['.'] }
" let g:enable_ycm_at_startup=0
let g:ycm_auto_trigger = 0

let g:rustfmt_autosave = 1

" keep cursor column when JK motion
let g:EasyMotion_startofline = 0

let g:rainbow_active = 1

let $FZF_DEFAULT_COMMAND = 'fd --type f'
