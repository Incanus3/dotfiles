let g:loaded_python_provider = 0 " disable python2
let g:python3_host_prog = '/home/jakub/.pyenv/versions/nvim3.8/bin/python'
let g:ruby_host_prog = '/home/jakub/.rbenv/versions/2.7.2/bin/neovim-ruby-host'

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

let g:firenvim_config = {
    \ 'globalSettings': {
        \ '<C-w>': 'noop',
        \ '<C-n>': 'default',
    \ }
\ }

lua << EOF
  require("todo-comments").setup {
    colors = {
      error = { "LspDiagnosticsDefaultError", "ErrorMsg", "#DC2626" },
      warning = { "LspDiagnosticsDefaultWarning", "WarningMsg", "#FBBF24" },
      info = { "LspDiagnosticsDefaultInformation", "#2563EB" },
      hint = { "LspDiagnosticsDefaultHint", "#10B981" },
      default = { "Identifier", "#7C3AED" },
    },
    highlight = {
      before = "", -- "fg" or "bg" or empty
      keyword = "wide", -- "fg", "bg", "wide" or empty. (wide is the same as bg, but will also highlight surrounding characters)
      after = "fg", -- "fg" or "bg" or empty
      pattern = [[.*<(KEYWORDS)\s*:]], -- pattern used for highlightng (vim regex)
      comments_only = true, -- this applies the pattern only inside comments using `commentstring` option
    },
  }

  require'nvim-treesitter.configs'.setup {
    highlight = {
      enable = true,
      custom_captures = {
        -- Highlight the @foo.bar capture group with the "Identifier" highlight group.
        ["foo.bar"] = "Identifier",
      },
    },

    incremental_selection = {
      enable = true,
      keymaps = {
        init_selection = "gnn",
        node_incremental = "grn",
        scope_incremental = "grc",
        node_decremental = "grm",
      },
    },

    indent = {
      enable = true
    }
  }
EOF

if $TERM != "linux"
  if has('termguicolors')
    set termguicolors
  endif

  " let g:sonokai_style = 'shusia' " possible values - default, atlantis, andromeda, shusia, maia
  " let g:sonokai_enable_italic = 0
  " let g:sonokai_disable_italic_comment = 0

  let g:tokyonight_style = 'night' " available: night, storm
  let g:tokyonight_enable_italic = 1
  let g:tokyonight_menu_selection_background = 'blue'

  " colorscheme palenight
  " colorscheme atom-dark
  " colorscheme tender
  " colorscheme one
  " colorscheme purify

  " colorscheme atelier-forest
  " colorscheme eighties
  " colorscheme material-darker
  " colorscheme onedark
  " colorscheme spacemacs
  " colorscheme base16-summerfruit-dark

  " colorscheme sonokai
  colorscheme tokyonight

  " let g:lightline = { 'colorscheme': 'one' }
  " let g:lightline = { 'colorscheme': 'palenight' }

  " let g:one_allow_italics = 1

  " let g:lightline = {}
        " \ 'active': {
        " \   'left': [ [ 'mode', 'paste' ],
        " \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
        " \ },
        " \ 'component_function': {
        " \   'cocstatus': 'coc#status',
        " \ }

  " let g:lightline.colorscheme = 'sonokai'

  if !exists('g:airline_symbols')
    let g:airline_symbols = {}
  endif

  " let g:airline_theme = 'sonokai'
  let g:airline_theme = 'tokyonight'
  let g:airline#extensions#tabline#enabled = 1
  let g:airline_left_sep = ''
  let g:airline_left_alt_sep = ''
  let g:airline_right_sep = ''
  let g:airline_right_alt_sep = ''
  let g:airline_symbols.branch = ''
  let g:airline_symbols.linenr = '☰'
  let g:airline_symbols.readonly = ''
  let g:airline#parts#ffenc#skip_expected_string='utf-8[unix]'
  let g:airline_section_z = '%{g:airline_symbols.linenr} %l/%L:%v'
endif
