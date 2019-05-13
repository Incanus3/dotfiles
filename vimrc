call plug#begin('~/.vim/bundle')

Plug 'benmills/vimux'
Plug 'mileszs/ack.vim'
Plug 'tpope/vim-rails'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-bundler'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'janko-m/vim-test'
Plug 'junegunn/fzf.vim'
Plug 'vim-vdebug/vdebug'
Plug 'godlygeek/tabular'
Plug 'scrooloose/nerdtree'
Plug 'sheerun/vim-polyglot'
Plug 'pgdouyon/vim-evanesco'
Plug 'airblade/vim-gitgutter'
Plug 'Valloric/YouCompleteMe'
Plug 'vim-scripts/zim-syntax'
Plug 'mkarmona/colorsbox'
Plug 'chriskempson/base16-vim'
Plug 'jpo/vim-railscasts-theme'
Plug 'powerline/powerline', {'rtp': 'powerline/bindings/vim/'}

call plug#end()

" if filereadable(expand("~/.vimrc_background"))
"   let base16colorspace=256
"   source ~/.vimrc_background
" endif

set t_Co=256
set background=dark
colorscheme railscasts
" colorscheme base16-default-dark
" colorscheme base16-atelier-forest
" colorscheme base16-atelier-dune

" NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.bst$','\.dia$','\.eps$','\.pdf$','\~$','\.pyc$','^__pycache__$']

set number
" set relativenumber

set hlsearch
set cursorline
set grepprg=ack
set scrolloff=3
set laststatus=2
set textwidth=100
set backupcopy=yes
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
set wildignore+=.git*,coverage/**,tmp/**,**~

set winwidth=100
set winheight=3
set winminheight=3
set winheight=999

" filetype associations
au BufRead,BufNewFile *.txt    set filetype=zim
au BufRead,BufNewFile *.md     set filetype=markdown
au BufRead,BufNewFile *.asd    set filetype=lisp
au BufRead,BufNewFile *.tex    set filetype=tex
au BufRead,BufNewFile *.scheme set filetype=scheme
au BufRead,BufNewFile *.god    set filetype=ruby
au BufRead,BufNewFile *.em     set filetype=emblem
au FileType sh set noexpandtab

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

" RSpec.vim mappings
" map <Leader>t :call RunCurrentSpecFile()<CR>
" map <Leader>s :call RunNearestSpec()<CR>
" map <Leader>l :call RunLastSpec()<CR>
" map <Leader>a :call RunAllSpecs()<CR>

" %% in command expands to current dir
cnoremap %% <C-R>=fnameescape(expand('%:h')).'/'<cr>

" use ,g to jump to tag
map <Leader>g <c-]>
set tags+=gems.tags

" use ,m to run make
map <leader>m :make!<CR>

" use ,f and ,b for fuzzy search in files and buffers
" map <leader>f :FufFile<cr>
" map <leader>b :FufBuffer<cr>

" use enter in normal mode to insert newline
nnoremap <CR> o<Esc>k
autocmd CmdwinEnter * nnoremap <CR> <CR>
autocmd BufReadPost quickfix nnoremap <CR> <CR>

" use ,n to hide search results
map <leader>n :nohl<cr>

" use ,, to switch btw. alternate files
" this is slow, because easymotion has mapping starting with ,,
map <Leader><Leader> <C-^>

" use <leader>t to tabularize by =
nnoremap <Leader>t :Tabularize /=<cr>

" command-t buffer window
nnoremap <silent> <leader>b :CommandTBuffer<cr>

" use ctrl + hjkl to move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" reindent whole file (make mark, jump to bof, = to eof, back to mark)
map <leader>i mmgg=G`m

nnoremap <leader>bd :call VimuxRunCommand("npm run build-dev")<cr>
nnoremap <leader>bt :call VimuxRunCommand("npm run build-test")<cr>
nnoremap <leader>ba :call VimuxRunCommand("npm run build-assets")<cr>
nnoremap <leader>tt :call VimuxRunCommand("npm run test " . expand("%"))<cr>
nnoremap <leader>ta :call VimuxRunCommand("npm run tests")<cr>
nnoremap <leader>tp :call VimuxRunCommand("pyenv activate django3.6 && ./manage.py test")<cr>

map <Leader>vp :VimuxPromptCommand<CR>
map <Leader>vl :VimuxRunLastCommand<CR>
map <Leader>vi :VimuxInspectRunner<CR>
map <Leader>vq :VimuxCloseRunner<CR>
map <Leader>vz :VimuxZoomRunner<CR>

let g:VimuxHeight = "50"
let g:VimuxOrientation = "h"
let g:VimuxPromptString = "> "

" inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" " let g:ycm_python_binary_path = '/home/jakub/.pyenv/versions/3.7.0/bin/python3.7'
" let g:ycm_python_binary_path = 'python'
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_autoclose_preview_window_after_insertion = 1
" let g:ycm_semantic_triggers = { 'elm' : ['.'] }

let g:elm_format_autosave = 1

let test#strategy      = 'dispatch'
let test#python#runner = 'pytest'

map <Leader>f :Files<CR>
map <leader>p :Files ..<cr>
map <leader>b :Buffers<cr>
