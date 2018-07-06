python3 from powerline.vim import setup as powerline_setup
python3 powerline_setup()
python3 del powerline_setup

" needed for % to jump begin/def/class <-> end, etc.
runtime macros/matchit.vim
runtime plugin/powerline.vim

set laststatus=2
set tabstop=2 softtabstop=2 shiftwidth=2 expandtab

execute pathogen#infect()
"let g:EasyMotion_leader_key = '<Leader>'

" use 256 colors
set t_Co=256
" if has('gui_running')
"   colorscheme desert
" endif

if filereadable(expand("~/.vimrc_background"))
  let base16colorspace=256
  source ~/.vimrc_background
endif

" colorscheme base16-default-dark
" colorscheme base16-atelier-forest
" colorscheme base16-atelier-dune

" NERDTree
map <silent> <C-n> :NERDTreeToggle<CR>
let NERDTreeIgnore = ['\.bst$','\.dia$','\.eps$','\.pdf$','\~$','\.pyc$','^__pycache__$']

set number
set relativenumber
set backupcopy=yes

" filetype associations
au BufRead,BufNewFile *.txt    set filetype=zim
au BufRead,BufNewFile *.md     set filetype=markdown
au BufRead,BufNewFile *.asd    set filetype=lisp
au BufRead,BufNewFile *.tex    set filetype=tex
au BufRead,BufNewFile *.scheme set filetype=scheme
au BufRead,BufNewFile *.god    set filetype=ruby
au BufRead,BufNewFile *.em     set filetype=emblem
au BufRead,BufNewFile *.py     set textwidth=100 tabstop=2 softtabstop=2 shiftwidth=2 foldmethod=indent
au FileType sh set noexpandtab

" map , (reverse of ;) to \
noremap \ ,
" use , as <Leader>
let mapleader=','

" toggle visibility of nonprintable characters
map <Leader>h :set list!<CR>

" visual symbols for nonprintable characters
set listchars=tab:▸\ ,eol:¬

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

" always show at least 5 lines around cursor
set scrolloff=3
set sidescrolloff=3
set display+=lastline

" use ack as grep program
set grepprg=ack

" set search matches highlighting color
" hi Search ctermbg=13

" use C-d as delete in insert mode
inoremap <C-d> <Del>

" for compatibility with fish shell
set shell=/bin/bash

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

set textwidth=100
" see :h fo-table, add a to reformat paragraph after every change
" (:set formatoptions+=a)
set formatoptions=tcrqj
" set formatprg=par\ -w100r

" highlight current line
set cursorline

" use ,, to switch btw. alternate files
" this is slow, because easymotion has mapping starting with ,,
map <Leader><Leader> <C-^>

" use <leader>t to tabularize by =
nnoremap <Leader>t :Tabularize /=<cr>

set wildignore+=.git*,coverage/**,tmp/**,**~

" command-t buffer window
nnoremap <silent> <leader>b :CommandTBuffer<cr>

" code folding options
set foldmethod=syntax
set foldlevel=1
set nofoldenable

" open new splits right and below
set splitbelow
set splitright

" use ctrl + hjkl to move between splits
nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

" complete with tab, only to longest match
" imap <Tab> <C-P>
set completeopt=menu,longest,preview

" completion in command
set wildmode=longest,list:longest

" reindent whole file (make mark, jump to bof, = to eof, back to mark)
map <leader>i mmgg=G`m

set winwidth=100
set winheight=3
set winminheight=3
set winheight=999

" http://vim.wikia.com/wiki/View_all_colors_available_to_gvim
hi VertSplit    term=bold cterm=bold gui=bold ctermbg=8
" hi StatusLineNC term=bold cterm=bold gui=bold ctermbg=8 ctermfg=2
" hi StatusLine   term=bold cterm=bold gui=bold ctermbg=2 ctermfg=8

set fillchars=""
set hlsearch

" nnoremap <leader>bd :ProjectRootExe !npm run build-dev<cr>
" nnoremap <leader>bt :ProjectRootExe !npm run build-test<cr>
" nnoremap <leader>tt :ProjectRootExe !npm run test %<cr>
" nnoremap <leader>ta :ProjectRootExe !npm run test<cr>

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

inoremap <expr><tab> pumvisible() ? "\<c-n>" : "\<tab>"

" let g:ycm_python_binary_path = '/home/jakub/.pyenv/versions/3.7.0/bin/python3.7'
let g:ycm_python_binary_path = 'python'
let g:ycm_complete_in_comments = 1
let g:ycm_seed_identifiers_with_syntax = 1
let g:ycm_filepath_completion_use_working_dir = 1
let g:ycm_autoclose_preview_window_after_insertion = 1

set cmdheight=2
