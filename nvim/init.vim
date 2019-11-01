call plug#begin('~/.local/nvim/bundle')

Plug 'benmills/vimux'
Plug 'mileszs/ack.vim'
Plug 'janko-m/vim-test'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-easy-align'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'airblade/vim-gitgutter'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/zim-syntax'
Plug 'drewtempelmeyer/palenight.vim'
Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'machakann/vim-highlightedyank'

" Plug 'chriskempson/base16-vim'
" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

call plug#end()

" set t_Co=256
" set termguicolors
set background=dark
colorscheme palenight

set hlsearch
set incsearch
set ignorecase
set smartcase

set number
set mouse=a
set clipboard=unnamed
set grepprg=ack
set scrolloff=3
set laststatus=2
set noshowmode
set cursorline
set textwidth=100
set updatetime=100
set signcolumn=yes
set backupcopy=no
set sidescrolloff=3
set display+=lastline
set listchars=tab:▸\ ,eol:¬
set formatoptions=tcrqj " see :h fo-table
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

set undodir=~/.vim/undodir
set undofile

set foldmethod=syntax
set foldlevel=1
set nofoldenable

set splitbelow
set splitright

set completeopt=menu,longest,preview
set wildmode=longest,list:longest
set wildignore+=.git/**,coverage/**,tmp/**,**~

set nobackup
set nowritebackup

set winheight=3
set winwidth=65
set winminheight=3
set winminwidth=65

let g:loaded_python_provider = 0 " disable python2
let g:python3_host_prog = '/home/jakub/.pyenv/versions/3.7.3/bin/python3.7'
let g:ruby_host_prog = '/home/jakub/.rbenv/versions/2.6.2/bin/neovim-ruby-host'
let g:highlightedyank_highlight_duration = 300

" maximize window after entering
autocmd WinEnter * wincmd _
" autocmd WinEnter * wincmd |

" enable true color support - v terminalu vypada hrozne
" set termguicolors
" Set floating window to be slightly transparent, funguje jenom s termguicolors
" set winbl=10

" filetype associations
au BufRead,BufNewFile *.txt    set filetype=zim
au BufRead,BufNewFile *.md     set filetype=markdown
au BufRead,BufNewFile *.asd    set filetype=lisp
au BufRead,BufNewFile *.tex    set filetype=tex
au BufRead,BufNewFile *.scheme set filetype=scheme
au BufRead,BufNewFile *.god    set filetype=ruby
au BufRead,BufNewFile *.em     set filetype=emblem
au BufRead,BufNewFile *.py     set textwidth=100 tabstop=2 softtabstop=2 shiftwidth=2 foldmethod=indent expandtab
" au FileType sh set noexpandtab

" map , (reverse of ;) to \
noremap \ ,
" use , as <Leader>
let mapleader=','

" toggle visibility of nonprintable characters
map <Leader>h :set list!<CR>

" strip trailing whitespace when saving file
function! <SID>StripTrailingWhitespaces()
  " Preparation: save last search, and cursor position.
  let _s=@/
  let l = line(".")
  let c = col(".")
  " Do the business:
  %s/\s\+$//e
  " Clean up: restore previous search history, and cursor position
  let @/=_s
  call cursor(l, c)
endfunction

autocmd BufWritePre * :call <SID>StripTrailingWhitespaces()

" use C-d as delete in insert mode
inoremap <C-d> <Del>

" %% in command expands to current dir
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

" use ,m to run make
map <leader>m :make!<CR>

" use enter in normal mode to insert newline
nnoremap <CR> o<Esc>k
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" use ,n to hide search results
map <leader>n :nohl<cr>

" use ,, to switch btw. alternate files
" this is slow, because easymotion has mapping starting with ,,
map <Leader><Leader> <C-^>

" use ctrl + hjkl to move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nmap <M-k> kzz
nmap <M-j> jzz

" reindent whole file (make mark, jump to bof, = to eof, back to mark)
map <leader>i mmgg=G`m

" Start interactive EasyAlign in visual mode (e.g. vipga)
xmap ga <Plug>(EasyAlign)
" Start interactive EasyAlign for a motion/text object (e.g. gaip)
nmap ga <Plug>(EasyAlign)

let g:elm_format_autosave = 1

let test#strategy      = 'dispatch'
let test#python#runner = 'pytest'

map <Leader>f :Files<CR>
map <leader>p :Files ..<cr>
map <leader>b :Buffers<cr>

" NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>
let g:NERDTreeIgnore = ['\.bst$','\.dia$','\.eps$','\.pdf$','\~$','\.pyc$','^__pycache__$']
let g:NERDTreeMinimalUI = 1
let g:NERDTreeStatusline = ''

let g:UltiSnipsExpandTrigger="<c-space>"
" let g:UltiSnipsJumpForwardTrigger="<c-b>"
" let g:UltiSnipsJumpBackwardTrigger="<c-z>"
let g:UltiSnipsSnippetsDir="~/.vim/snippets"

" let g:deoplete#enable_at_startup = 1

" autocmd InsertLeave * if pumvisible() == 0 | pclose | endif
" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" Use tab for trigger completion with characters ahead and navigate.
" Use command ':verbose imap <tab>' to make sure tab is not mapped by other plugin.
inoremap <silent><expr> <TAB>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<TAB>" :
      \ coc#refresh()
inoremap <expr><S-TAB> pumvisible() ? "\<C-p>" : "\<C-h>"

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

" Use <c-space> to trigger completion.
inoremap <silent><expr> <c-space> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current position.
" Coc only does snippet and additional edit on confirm.
inoremap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
" Or use `complete_info` if your vim support it, like:
" inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"

nmap <Leader>s :YcmCompleter GetType<CR>
nmap <leader>si :CocCommand python.setInterpreter<cr>
" nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gd :YcmCompleter GoTo<CR>
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)
nmap <silent> [g <Plug>(coc-diagnostic-prev)
nmap <silent> ]g <Plug>(coc-diagnostic-next)

" Highlight symbol under cursor on CursorHold
autocmd CursorHold * silent call CocActionAsync('highlight')

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

nnoremap <silent> K :call <SID>show_documentation()<CR>

" Remap for do codeAction of selected region, ex: `<leader>aap` for current paragraph
xmap <leader>a  <Plug>(coc-codeaction-selected)
nmap <leader>a  <Plug>(coc-codeaction-selected)
" Remap for do codeAction of current line
nmap <leader>ac  <Plug>(coc-codeaction)
" Fix autofix problem of current line
nmap <leader>qf  <Plug>(coc-fix-current)
" Create mappings for function text object, requires document symbols feature of languageserver.
xmap if <Plug>(coc-funcobj-i)
xmap af <Plug>(coc-funcobj-a)
omap if <Plug>(coc-funcobj-i)
omap af <Plug>(coc-funcobj-a)
" Use <C-d> for select selections ranges, needs server support, like: coc-tsserver, coc-python
nmap <silent> <C-d> <Plug>(coc-range-select)
xmap <silent> <C-d> <Plug>(coc-range-select)
" Remap for rename current word
nmap <leader>rn <Plug>(coc-rename)

" nmap <leader>ref <Plug>(coc-refactor)

" Using CocList
" Show all diagnostics
nnoremap <silent> <space>d  :<C-u>CocList diagnostics<cr>
" Manage extensions
nnoremap <silent> <space>e  :<C-u>CocList extensions<cr>
" Show commands
nnoremap <silent> <space>c  :<C-u>CocList commands<cr>
" Find symbol of current document
nnoremap <silent> <space>o  :<C-u>CocList outline<cr>
" Search workspace symbols
nnoremap <silent> <space>s  :<C-u>CocList -I symbols<cr>
" Do default action for next item.
nnoremap <silent> <space>j  :<C-u>CocNext<CR>
" Do default action for previous item.
nnoremap <silent> <space>k  :<C-u>CocPrev<CR>
" Resume latest coc list
nnoremap <silent> <space>p  :<C-u>CocListResume<CR>

" Should set gutter symbols' colors, but doesn't work
hi! CocErrorSign ctermfg=Red  guifg=#ff0000
hi! CocInfoSign  ctermfg=Blue guifg=#15aabf
hi! CocHintSign  ctermfg=Blue guifg=#15aabf

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

autocmd User CocStatusChange,CocDiagnosticChange call lightline#update()

" RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" nnoremap <leader>bd :call VimuxRunCommand("npm run build-dev")<cr>
" nnoremap <leader>bt :call VimuxRunCommand("npm run build-test")<cr>
" nnoremap <leader>ba :call VimuxRunCommand("npm run build-assets")<cr>
" nnoremap <leader>tt :call VimuxRunCommand("npm run test " . expand("%"))<cr>
" nnoremap <leader>ta :call VimuxRunCommand("npm run tests")<cr>
" nnoremap <leader>tp :call VimuxRunCommand("pyenv activate django3.6 && ./manage.py test")<cr>

" map <Leader>vp :VimuxPromptCommand<CR>
" map <Leader>vl :VimuxRunLastCommand<CR>
" map <Leader>vi :VimuxInspectRunner<CR>
" map <Leader>vq :VimuxCloseRunner<CR>
" map <Leader>vz :VimuxZoomRunner<CR>

" let g:VimuxHeight = "50"
" let g:VimuxOrientation = "h"
" let g:VimuxPromptString = "> "

" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" " let g:ycm_python_binary_path = '/home/jakub/.pyenv/versions/3.7.0/bin/python3.7'
" let g:ycm_python_binary_path = 'python'
" let g:ycm_complete_in_comments = 1
" let g:ycm_seed_identifiers_with_syntax = 1
" let g:ycm_filepath_completion_use_working_dir = 1
" let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_semantic_triggers = { 'elm' : ['.'] }
" let g:enable_ycm_at_startup=0
let g:ycm_auto_trigger=0

" use ,g to jump to tag
" map <Leader>g <c-]>
" set tags+=gems.tags
